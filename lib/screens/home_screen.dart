import 'package:crud_api/screens/add_new_product.dart';
import 'package:flutter/material.dart';

import '../widgets/product_item.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return product_item();
        },
        separatorBuilder: (context, index) {
          return Divider(indent: 75);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewProduct()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


