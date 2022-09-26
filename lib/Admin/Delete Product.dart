import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteProduct extends StatefulWidget {
  const DeleteProduct({Key? key}) : super(key: key);

  @override
  _DeleteProductState createState() => _DeleteProductState();
}

class _DeleteProductState extends State<DeleteProduct> {
  @override
  TextEditingController nameproductcontrollere = new TextEditingController();
  TextEditingController productname = new TextEditingController();
  TextEditingController productprice = new TextEditingController();
  TextEditingController productdescription = new TextEditingController();
  TextEditingController productnumber = new TextEditingController();
  bool found = false;
  var id;
  var collection = FirebaseFirestore.instance.collection("ProductData");
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
                        setState(() {
                          found =true;
                        });
                        id = queryDocumentSnapshot.id;
                        print(found);
                      }
                    }
                  }
              ),
            ),
            SizedBox(height: 30,),
            found? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Container(
                  width: 380 ,
                  height: 50,
                  child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        primary: Colors.red,

                      ),
                      child: Text("Delete",style: TextStyle(color: Colors.white,fontSize: 17 ),),
                      onPressed: () {

                        collection.doc(id).delete();
                      }
                  ),
                ),
              ],
            )

                :Text("Please Enter right name")
          ],
        ),
      ),
    );
  }
}

