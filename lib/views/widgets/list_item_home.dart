import 'package:flutter/material.dart';

import '../../models/product.dart';

class ListItemHome extends StatelessWidget {
  final Product product;
  const ListItemHome({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.imageUrl!,
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
              ),
              Positioned(
                top: 10,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    " ${product.discount} %",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            product.category,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.grey.shade900,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            product.name!,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            "\$${product.price}",
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: Colors.grey.shade900,
                ),
          ),
        ],
      ),
    );
  }
}
