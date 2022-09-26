import 'package:ecommerce/Admin/AddProduct.dart';
import 'package:ecommerce/Admin/Delete%20Product.dart';
import 'package:ecommerce/Admin/EditProduct.dart';
import 'package:ecommerce/User/ViewProductsUser.dart';
import 'package:ecommerce/login.dart';
import 'package:ecommerce/signup.dart';
import 'package:ecommerce/uploadimage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Admin/ViewProductAdmin.dart';
import 'Admin/adminData.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddProduct(),
    );
  }
}
