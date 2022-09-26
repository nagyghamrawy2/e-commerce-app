import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditProduct extends StatefulWidget {
  EditProduct();



  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  TextEditingController nameproductcontrollere = new TextEditingController();
  TextEditingController productname = new TextEditingController();
  TextEditingController productprice = new TextEditingController();
  TextEditingController productdescription = new TextEditingController();
  TextEditingController productnumber = new TextEditingController();
  bool found = false;
  var id;
  var collection = FirebaseFirestore.instance.collection("ProductData");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 10.0,
        title: Center(child: Text("ADD PRODUCT",style: TextStyle(fontSize: 35 ,fontWeight: FontWeight.bold),),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Container(
                width: 380,

                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Please Enter name of product",
                    hintStyle: TextStyle(fontSize: 20),
                    fillColor: Colors.white60,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7)
                    ),
                  ),
                  controller: nameproductcontrollere,
                )
            ),
            SizedBox(height: 20,),
            Container(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text(
                    "Search",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  onPressed: () async{
                    var querySnapshot = await collection.get();

                    for (var queryDocumentSnapshot in querySnapshot.docs){
                      Map<String ,dynamic> data = queryDocumentSnapshot.data();
                      if(data['Name'].toString() == nameproductcontrollere.text){
                        id = queryDocumentSnapshot.id;
                      }
                    }
                  }
              ),
            ),
            SizedBox(height: 30,),
            Column(

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
                      child: Text("Save New Data",style: TextStyle(color: Colors.white,fontSize: 17 ),),
                      onPressed: () {
                        String name = productname.text;
                        String description = productdescription.text;
                        String price =productprice.text;
                        String number = productnumber.text;
                        collection.doc(id).update(<String ,dynamic>{
                          "Name": "$name",
                          "Price": "$price",
                          "Description": "$description",
                          "Amount" : "$number"
                        });
                      }
                  ),
                ),
              ],
            )


          ],
        ),
      ),
    );
  }
}
