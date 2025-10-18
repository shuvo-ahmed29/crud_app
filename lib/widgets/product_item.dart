import 'package:crud_api/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/update_product_screen.dart';

class product_item extends StatelessWidget {
  const product_item({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        width: 30,
        product.image,errorBuilder: (_, __, ___){
        return Icon(Icons.error_outline,size: 30,);
      },),
      title: Text(product.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Code: ${product.code}'),
          Row(
            spacing: 16,
            children: [
              Text('Quantity: ${product.quantity}'),

              Text('Unit Price: ${product.unitPrice}')
            ],
          ),
          //Text('Code: 3465723299'),
        ],
      ),
      trailing: PopupMenuButton<ProductOption>(
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              value: ProductOption.update,
              child: Text('Update'),
            ),
            PopupMenuItem(
              value: ProductOption.delete,
              child: Text('Delete'),
            ),
          ];
        },
        onSelected: (ProductOption selectedOption) {
          if (selectedOption == ProductOption.update) {
            print('Update');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UpdateProductScreen(),
              ),
            );
          } else if (selectedOption == ProductOption.delete) {
            print('Delete');
          }
        },
      ),
    );
  }
}

enum ProductOption { update, delete }