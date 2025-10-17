import 'package:crud_api/screens/home_screen.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(CrudApp());
}
class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //useMaterial3: false,
        colorSchemeSeed: Colors.blue
      ),
      title: 'Crud App',
      debugShowCheckedModeBanner: false,
      home:HomeScreen() ,
    );
  }
}
