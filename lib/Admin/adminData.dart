import 'package:flutter/material.dart';

import 'AddProduct.dart';

class AdminData extends StatefulWidget {
  const AdminData({Key? key}) : super(key: key);

  @override
  _AdminDataState createState() => _AdminDataState();
}

class _AdminDataState extends State<AdminData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 10.0,
        title: Center(child: Text("ADMIN DATA",style: TextStyle(fontSize: 35 ,fontWeight: FontWeight.bold),)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 300,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[600],
                  ),
                  child: Text(
                    "Add Product",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>AddProduct() ));
                  }
                  ),
            ),
            SizedBox(height: 20,),
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
                  onPressed: () {}
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                  ),
                  child: Text(
                    "Remove Product",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  onPressed: () {}
              ),
            ),
          ],
        ),
      ),
    );
  }
}
