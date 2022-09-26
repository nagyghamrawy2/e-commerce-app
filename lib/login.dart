import 'package:ecommerce/Admin/ViewProductAdmin.dart';
import 'package:ecommerce/Admin/adminData.dart';
import 'package:ecommerce/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'User/HomePage.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController passwordlogincontroller = new TextEditingController();
  TextEditingController emaillogincontroller = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(

            children: [
              SizedBox(height: 60,),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("Welcome",style: TextStyle(fontSize: 35 ,fontWeight: FontWeight.bold),)),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Enter your Email address to sign in.",style: TextStyle(fontSize: 20,color: Colors.black26),maxLines: 2, ),
              ),
              SizedBox(height: 7,),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Enjoy your Shopping :)",style: TextStyle(fontSize: 20,color: Colors.black26),maxLines: 2, ),
              ),
              SizedBox(height: 20,),
              Container(
                  width: 380,

                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Email Address",
                      hintStyle: TextStyle(fontSize: 20),
                      fillColor: Colors.white60,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      ),
                    ),
                    controller: emaillogincontroller,
                  )
              ),
              SizedBox(height: 10,),
              Container(
                  width: 380,

                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(fontSize: 20),
                      fillColor: Colors.white60,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      ),
                    ),
                    controller: passwordlogincontroller,
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
                    onPressed: ()async{
                      var collection = FirebaseFirestore.instance.collection("MyData");
                      var querySnapshot = await collection.get();
                      bool foundcorrect = false;
                      int flag =0;
                          for (var queryDocumentSnapshot in querySnapshot.docs){

                                Map<String ,dynamic> data = queryDocumentSnapshot.data() as Map<String, dynamic>;
                                     if (data['Email'].toString() == "admin@gmail.com" && data['Password'].toString()=="admin"){
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ViewProductAdmin()));
                                    }
                                    else if (data['Email'].toString() == emaillogincontroller.text && data['Password'].toString()==passwordlogincontroller.text){

                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));

                                }
                          }
                        print(flag);
                          print(foundcorrect);
                      },
                    child: Text("SIGN IN",style: TextStyle(color: Colors.white,fontSize: 17 ),)
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have account",style: TextStyle(color: Colors.black38 ,fontSize: 18),),
                  SizedBox(width: 15,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text("Create new account.",style: TextStyle(color: Colors.green ,fontSize: 18),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
