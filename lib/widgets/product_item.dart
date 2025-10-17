import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/update_product_screen.dart';

class product_item extends StatelessWidget {
  const product_item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text('Product Name'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Code: 3465723299'),
          Row(
            spacing: 16,
            children: [Text('Quantity: 3'), Text('Unit Price: 346')],
          ),
          Text('Code: 3465723299'),
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