import 'package:ecommerce/User/ViewProductsUser.dart';
import 'package:ecommerce/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class drawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.blueGrey,
          child: Column(

            children: [
              ListTile(
                leading: Icon(Icons.add_road,size: 30,),
                title: Text('View All Products',style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>ViewProduct()));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout,size: 30,),
                title: Text('Log Out',style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20),),
                onTap: () async{
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Login()));
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
