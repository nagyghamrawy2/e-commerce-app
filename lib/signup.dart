import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
class SignUp extends StatefulWidget {


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  bool isLoading =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Center(child: Text("Create Account",style: TextStyle(fontSize: 25 ,fontWeight: FontWeight.bold,color: Colors.black),)),
            ),
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text("Create Account" ,style: TextStyle(fontSize: 35 ,fontWeight: FontWeight.bold),)),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                  width: 350,
                  child: Text("Enter your Name, Email and Password for sign up.",style: TextStyle(fontSize: 20,color: Colors.black26),maxLines: 2, )),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                child: Text("Already have account",style: TextStyle(fontSize:20 ,color: Colors.green ),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                },
              ),
            ),
            SizedBox(height: 30,),
            Container(
                width: 380,

                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    hintStyle: TextStyle(fontSize: 20),
                    fillColor: Colors.white60,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7)
                    ),
                  ),
                  controller: namecontroller,
                )
            ),
            SizedBox(height: 10,),
            Container(
                width: 380,

                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email Address",
                    hintStyle: TextStyle(fontSize: 20),
                    fillColor: Colors.white60,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7)
                    ),
                  ),
                  controller: emailcontroller,
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
                  controller: passwordcontroller,
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
                child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 17 ),),
                  onPressed: () {
                    String name = namecontroller.text;
                    String email = emailcontroller.text;
                    String pass = passwordcontroller.text;
                    FirebaseFirestore.instance.collection("MyData").add(
                        <String, dynamic>{
                          "Name": "$name",
                          "Email": "$email",
                          "Password": "$pass"
                        }
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  }
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}
