// import 'dart:io';
//
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class UploadImage extends StatefulWidget {
//   const UploadImage({Key? key}) : super(key: key);
//
//   @override
//   _UploadImageState createState() => _UploadImageState();
// }
//
// class _UploadImageState extends State<UploadImage> {
//   final picker = ImagePicker();
//   late PickedFile image;
//   final storage = FirebaseStorage.instance;
//   var  permissionStatus;
//   var file;
//   String imageUrl ="";
//   dynamic x;
//   dynamic b;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//         title: Text("Upload Image"),
//       ),
//         body:Column(
//           children: [
//
//             RaisedButton(
//               onPressed: (){
//                  uploadImage();
//               } ,
//               child: Text("Upload Image" ),
//               color: Colors.lightBlue,
//             ),
//             ElevatedButton(
//                 onPressed: (){
//                   uploadImageToFireBase();
//                 },
//                 child: Text("Save Changes"))
//           ],
//         )
//     );
//   }
//   getImageFromCamera ()async{
//     // final picker = ImagePicker();
//     // PickedFile image;
//     // final storage = FirebaseStorage.instance;
//     // check permission
//     // await Permission.photos.request();
//     //   permissionStatus = await Permission.photos.status;
//     // if(permissionStatus.isGranted){
//     //               //select Image
//     //            image = (await picker.getImage(source: ImageSource.camera))!;
//     //             file = File(image.path);
//     //            // if(image != null){
//     //            //      //upload to firebase
//     //            //     var snapshot = await storage.ref().child('folderName/imageName').putFile(file).whenComplete(() {});
//     //            //     var downloadUrl = await snapshot.ref.getDownloadURL();
//     //            //     setState(() {
//     //            //       imageUrl = downloadUrl;
//     //            //     });
//     //            // }else{
//     //            //   print("No Path Recieved");
//     //            // }
//     // }else{
//     //   print("Grant Permission And Try Again");
//     // }
//     ImagePicker a =new ImagePicker();
//     b = await a.getImage(source: ImageSource.camera);
//     setState(() {
//       x=File(b.path);
//     });
//   }
//   uploadImageToFireBase()async{
//     if(b != null){
//       //upload to firebase
//       var snapshot = await storage.ref().child('folderName/imageName').putFile(x).whenComplete(() {});
//       var downloadUrl = await snapshot.ref.getDownloadURL();
//       setState(() {
//         imageUrl = downloadUrl;
//       });
//     }else{
//       print("No Path Recieved");
//     }
//   }
// }
