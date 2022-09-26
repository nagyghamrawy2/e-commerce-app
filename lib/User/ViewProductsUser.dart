import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Customs.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({Key? key}) : super(key: key);

  @override
  _ViewProductState createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 10.0,
      ),
      drawer: drawer(),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("ProductData").get(),
        builder: (context , AsyncSnapshot<dynamic> snapshot){
          if(snapshot.hasData ==false){
            return Text("Connection Lost");
          }
          else{
            return ListView.separated(
                itemBuilder: (context,i){
                  return Column(
                    children: [

                      Image.asset('assets/1.png',width: 200,height: 200,),
                      Text(snapshot.data.docs[i]['Name'],style: TextStyle(fontSize: 50 ,fontWeight: FontWeight.bold),),
                      Text(snapshot.data.docs[i]['Description'],style: TextStyle(fontSize: 20 ,color: Colors.black26),),
                      Text(snapshot.data.docs[i]['Price'],style: TextStyle(fontSize: 50 ,fontWeight: FontWeight.bold),),
                      Text(snapshot.data.docs[i]['Amount'],style: TextStyle(fontSize: 50 ,fontWeight: FontWeight.bold),),
                    ],
                  );
                },
                separatorBuilder: (context ,index){
                  return Divider(thickness: 3, height: 2,);
                },
                itemCount: snapshot.data.docs.length);
          }
        }
      ),
    );
  }
}
