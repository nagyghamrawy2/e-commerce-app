import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Admin/AddProduct.dart';
import 'package:ecommerce/Admin//Delete%20Product.dart';
import 'package:ecommerce/Admin/EditProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewProductAdmin extends StatefulWidget {
  const ViewProductAdmin({Key? key}) : super(key: key);

  @override
  _ViewProductAdminState createState() => _ViewProductAdminState();
}

class _ViewProductAdminState extends State<ViewProductAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10.0,
          title: Center(
            child: Text(
              "PRODUCTS DATA",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.blueGrey),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              Container(
                width: 300,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                    ),
                    child: Text(
                      "Add Product",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddProduct()));
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                    ),
                    child: Text(
                      "Edit Product",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProduct()));
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: Text(
                      "Delete Product",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeleteProduct()));
                    }),
              ),
            ],
          ),
        ));
  }
}
