import 'package:ecommerce_tarek_alabd/models/product.dart';
import 'package:ecommerce_tarek_alabd/utilities/images.dart';
import 'package:ecommerce_tarek_alabd/views/widgets/list_item_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

// TODO: temp code until we refactor to separate class with a separte context
  Widget _buildHeaderOfList(
    BuildContext context, {
    required String title,
    required VoidCallback onTap,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.red),
            ),
            GestureDetector(
              onTap: onTap,
              child: Text("عرض الكل",
                  style: Theme.of(context).textTheme.subtitle1),
            ),
          ],
        ),
        Text(
          description,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.grey.shade600),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Image.network(
                AppImages.topBannerHomePageImage,
                height: height * 0.35,
                fit: BoxFit.cover,
              ),
              Opacity(
                opacity: 0.35,
                child: Container(
                  width: double.infinity,
                  height: height * 0.35,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  "ملابس فخمه",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _buildHeaderOfList(
                  context,
                  title: "للبيع",
                  description: "ملابس صيفيه للبيع",
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: dummyProducts
                        .map((product) => Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: ListItemHome(
                                product: product,
                              ),
                            ))
                        .toList(),
                  ),
                ),
                _buildHeaderOfList(
                  context,
                  title: "جديد",
                  description: "ملابس جديده للبيع",
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: dummyProducts
                        .map((product) => Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: ListItemHome(
                                product: product,
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
