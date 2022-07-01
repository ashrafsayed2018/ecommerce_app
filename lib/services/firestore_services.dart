// import cloud firestore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestoreServices {
  FirestoreServices._();
  static final instance = FirestoreServices._();
  final firebaseFirestore = FirebaseFirestore.instance;
  // set data
  Future<void> setData(
      {required String path, required Map<String, dynamic> data}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    debugPrint("request data : $data");
    await reference.set(data);
  }

  // delete data
  Future<void> deleteData({required String path}) async {
    final reference = firebaseFirestore.doc(path);
    debugPrint("delete data : $path");
    await reference.delete();
  }

  // stream data from firestore
  Stream<T> documentStreamData<T>(
      {required String path, required T defaultValue}) {
    final reference = firebaseFirestore.doc(path);
    return reference.snapshots().map((snapshot) {
      if (snapshot.exists) {
        return snapshot.data() as T;
      }
      return defaultValue;
    });
  }

  // stream data from firestore
  Stream<List<T>> collectionStreamData<T>({
    required String path,
    required T defaultValue,
    Query Function(Query query)? queryBuilder, // query builder
    int Function(T lhs, T rhs)? sort, // sort builder
  }) {
    Query query = firebaseFirestore.collection(path);

    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final List<T> result = snapshot.docs.map((doc) {
        if (doc.exists) {
          return doc.data() as T;
        }
        return defaultValue;
      }).toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }
}
