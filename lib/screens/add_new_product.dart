import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../widgets/snackbar_message.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _addProductInProgres = false;

  final TextEditingController _nameTEController = TextEditingController();

  final TextEditingController _codeTEController = TextEditingController();

  final TextEditingController _quantityTEController = TextEditingController();

  final TextEditingController _unitPriceTEController = TextEditingController();

  final TextEditingController _imageUrlTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Product')),
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
                    labelText: 'Product Name',
                  ),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Enter your value';
                    }
                    return null;

                  },
                ),

                TextFormField(
                  controller: _codeTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Product Code',
                    labelText: 'Product Code',
                  ),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Enter your value';
                    }
                    return null;

                  },
                ),
                TextFormField(
                  controller: _quantityTEController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Quantity',
                    labelText: 'Quantity',
                  ),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Enter your value';
                    }
                    return null;

                  },
                ),
                TextFormField(
                  controller: _unitPriceTEController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Unit Price',
                    labelText: 'Unit Price',
                  ),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Enter your value';
                    }
                    return null;

                  },
                ),
                TextFormField(
                  controller: _imageUrlTEController,
                  decoration: InputDecoration(
                    hintText: 'Image Url',
                    labelText: 'Image Url',
                  ),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Enter your value';
                    }
                    return null;

                  },
                ),
                const SizedBox(height: 8),
                Visibility(
                  visible: _addProductInProgres == false,
                  replacement: Center(child: CircularProgressIndicator()),
                  child: FilledButton(
                    onPressed: _onTapAddProductButton,

                    child: Text('Add Product'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapAddProductButton() async {
    if(_formKey.currentState!.validate() == false){
      return;
    }
    _addProductInProgres = true;
    setState(() {});
    Uri uri = Uri.parse('http://35.73.30.144:2008/api/v1/CreateProduct');

    int totalPrice =
        int.parse(_unitPriceTEController.text) *
        int.parse(_quantityTEController.text);

    Map<String, dynamic> requestBody = {
      "ProductName": _nameTEController.text.trim(),
      "ProductCode": int.parse(_codeTEController.text.trim()),
      "Img": _imageUrlTEController.text.trim(),
      "Qty": int.parse(_quantityTEController.text.trim()),
      "UnitPrice": int.parse(_unitPriceTEController.text.trim()),
      "TotalPrice": totalPrice,
    };

    Response response = await post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      if (decodedJson['status'] == 'success') {
        _clearTextFiles();
        showSnackBarMassage(context, 'Product created successfully');

      }
      else{
        String errorMessage = decodedJson['data'];

        showSnackBarMassage(context ,errorMessage);

      }
    }

    _addProductInProgres = false;
    setState(() {});
  }

  void _clearTextFiles() {
    _nameTEController.clear();
    _codeTEController.clear();
    _quantityTEController.clear();
    _unitPriceTEController.clear();
    _imageUrlTEController.clear();
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
