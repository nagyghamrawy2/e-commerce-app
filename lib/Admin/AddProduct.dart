import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController productname = new TextEditingController();
  TextEditingController productprice = new TextEditingController();
  TextEditingController productdescription = new TextEditingController();
  TextEditingController productnumber = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 10.0,
        title: Center(child: Text("ADD PRODUCT",style: TextStyle(fontSize: 35 ,fontWeight: FontWeight.bold),),),
      ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 380,

                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: TextStyle(fontSize: 20),
                            fillColor: Colors.white60,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7)
                            ),
                          ),
                          controller: productname,
                        )
                    ),
                    SizedBox(height: 20,),
                    Container(
                        width: 380,

                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Price",
                            hintStyle: TextStyle(fontSize: 20),
                            fillColor: Colors.white60,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7)
                            ),
                          ),
                          controller:productprice ,
                        )
                    ),
                    SizedBox(height: 20,),
                    Container(
                        width: 380,

                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Description",
                            hintStyle: TextStyle(fontSize: 20),
                            fillColor: Colors.white60,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7)
                            ),
                          ),
                          controller:productdescription ,
                        )
                    ),
                    SizedBox(height: 20,),
                    Container(
                        width: 380,

                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Amount of product",
                            hintStyle: TextStyle(fontSize: 20),
                            fillColor: Colors.white60,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7)
                            ),
                          ),
                          controller:productnumber ,
                        )
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 380 ,
                      height: 50,
                      child: ElevatedButton(

                          style: ElevatedButton.styleFrom(

                            primary: Colors.green[600],

                          ),
                          child: Text("Add Product",style: TextStyle(color: Colors.white,fontSize: 17 ),),
                          onPressed: () {
                            String name = productname.text;
                            String description = productdescription.text;
                            String price =productprice.text;
                            String number = productnumber.text;

                            FirebaseFirestore.instance.collection("ProductData").add(
                                <String, dynamic>{
                                  "Name": "$name",
                                  "Price": "$price",
                                  "Description": "$description",
                                  "Amount" : "$number"
                                }
                            );
                          }
                      ),
                    ),

                  ],
                ),
              ),
    );
  }
}
