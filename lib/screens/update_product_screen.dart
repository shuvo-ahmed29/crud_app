import 'package:flutter/material.dart';
class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameTEController = TextEditingController();

  final TextEditingController _codeTEController = TextEditingController();

  final TextEditingController _quantityTEController = TextEditingController();

  final TextEditingController _unitPriceTEController = TextEditingController();

  final TextEditingController _imageUrlTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 8,
              children: [
                TextFormField(
                  controller: _nameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      hintText: 'Product Name',
                      labelText: 'Product Name'
                  ),
                ),


                TextFormField(
                  controller: _codeTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      hintText: 'Product Code',
                      labelText: 'Product Code'
                  ),


                ),
                TextFormField(
                  controller: _quantityTEController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      hintText: 'Quantity',
                      labelText: 'Quantity'
                  ),


                ),
                TextFormField(
                  controller: _unitPriceTEController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      hintText: 'Unit Price',
                      labelText: 'Unit Price'
                  ),


                ),
                TextFormField(
                  controller: _imageUrlTEController,
                  decoration: InputDecoration(
                      hintText: 'Image Url',
                      labelText: 'Image Url'
                  ),


                ),
                const SizedBox(height: 8,),
                FilledButton(onPressed: (){}, child: Text('Update'),),


              ],
            ),
          ),
        ),
      ),
    );

  }
  @override
  void dispose() {
    _nameTEController.dispose();
    _codeTEController.dispose();
    _quantityTEController.dispose();
    _unitPriceTEController.dispose();
    _imageUrlTEController.dispose();
    super.dispose();
  }
}
