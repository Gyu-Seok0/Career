import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'wrapper.dart';

// import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/src/services/asset_bundle.dart';
import 'package:flutter/src/painting/image_provider.dart';

class Add extends StatefulWidget {
  Add({Key key, this.curr_user}) : super(key: key);
  final String curr_user;

  @override
  _State createState() => _State();
}

class _State extends State<Add> {
  // 이미지 가져오기.
  final picker = ImagePicker();
  File image;



  String imageUrl;


  Future getMyImage() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    //pickedImage.path 를 출력하

    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
        imageUrl = pickedImage.path.toString();
      }
    });
  }

  // 여기서부터는 descripton 가져오고 하는거임!

  //String temp;
  String description;
  String productname;
  int price;

  getProduct(productname) {
    this.productname = productname;
  }

  getPrice(price) {
    this.price = int.parse(price); // 잘안되면 double로 하셈.
  }

  getDescription(description) {
    this.description = description;
  }






  // 함수시
  CreateData() async {
    print("here");
    print(image);
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Product").doc();
    String temp =
        image?.path ?? "https://handong.edu/site/handong/res/img/logo.png";
    // create map

    Map<String, dynamic> products = {
      "name": productname,
      "price": price,
      "description": description,
      "imgurl": temp,
      "like" : 0,
      "created" : FieldValue.serverTimestamp(),
      "modified" : FieldValue.serverTimestamp(),
      "create_user": widget.curr_user
    };



    documentReference.set(products).whenComplete(() {
      print("$description created");
    });

    // firestore 에 넣는 방식.
    if (image.path != null) {
      Reference ref = FirebaseStorage.instance.ref();
      TaskSnapshot addImg = await ref
          .child("image/" + image.toString())
          .putFile(image); // 이미지가 들어가기는 하는데 이름을 어떻게 줄까
      if (addImg.state == TaskState.success) {
        print("added to Firebase Storage");
      }
    }
    setState(() {
      image = null;
    });
  }


  var _controller1 = TextEditingController();
  var _controller2 = TextEditingController();
  var _controller3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,   //new line
      appBar: AppBar(
        leadingWidth: 80,
        centerTitle: true,
        leading: FlatButton(
          child: Text("cancle"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Wrapper(target: widget.curr_user,) ));
          },
        ),
        title: Text("Add"),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                _controller1.clear();
                _controller2.clear();
                _controller3.clear();
                CreateData();
                Navigator.push(context, MaterialPageRoute(builder: (context) => Wrapper(target: widget.curr_user,) ));
              },
              child: Text("Save")
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          // (imageUrl != null)
          //     ? Image.network(imageUrl)
          //     : Placeholder(
          //         fallbackHeight: 200.0, fallbackWidth: double.infinity),
          // RaisedButton(
          //   child: Text('Upload Image'),
          //   color: Colors.lightBlue,
          //   onPressed: () => uploadImage(),
          // ),
          Container(
            child: image == null
                ?
                // Placeholder(
                // fallbackHeight: 200.0, fallbackWidth: double.infinity)
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image.asset('assets/logo2.png',
                          height: 150, fit: BoxFit.fill),
                      SizedBox(height: 16.0),
                    ],
                  )
                // 아니라면,
                : Image.file(image),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
            IconButton(
                onPressed: (){
                  getMyImage();
                },
                icon: Icon(Icons.camera_alt),
            )
          ]
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _controller3,
              decoration: InputDecoration(
                  labelText: "Product Name",
                  fillColor: Colors.blueAccent,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0))),
              onChanged: (String productname) {
                getProduct(productname);
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _controller1,
              decoration: InputDecoration(
                  labelText: "Price",
                  fillColor: Colors.blueAccent,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0))),
              onChanged: (String price) {
                getPrice(price);
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _controller2,
              decoration: InputDecoration(
                  labelText: "Description",
                  fillColor: Colors.blueAccent,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0))),
              onChanged: (String description) {
                getDescription(description);
              },
            ),
          ),
        ],
      ),
    );
  }

// uploadImage() async {
//   final _storage = FirebaseStorage.instance;
//   final _picker = ImagePicker();
//   PickedFile image;
//
//   //Check Permissions
//   await Permission.photos.request();
//
//   var permissionStatus = await Permission.photos.status;
//
//   if (permissionStatus.isGranted) {
//
//     //Select Image
//     image = await _picker.getImage(source: ImageSource.gallery);
//     var file = File(image.path);
//
//     if (image != null) {
//       //Upload to Firebase
//       var snapshot = await _storage.ref()
//           .child('folderName/imageName')
//           .putFile(file);
//           //.onComplete
//
//       var downloadUrl = await snapshot.ref.getDownloadURL();
//
//       setState(() {
//         imageUrl = downloadUrl;
//       });
//
//     }
//     else {
//       print('No Path Received');
//     }
//
//   }
//   else {
//     print('Grant Permissions and try again');
//   }
// }

}
