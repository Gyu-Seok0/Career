import 'dart:io';
//import 'globals.dart' as globals;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'add.dart';
//import 'authenticate.dart';
import 'main.dart';
//import 'profile.dart';

// 정상작
// class Wrapper extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Authenticate();
//   }
// }

//
//
// void main() => runApp(new Myapp());
//
// class Myapp extends StatefulWidget {
//
//   @override
//   Widget build(BuildContext context){
//     return new MaterialApp(
//       title : "Flutter Demo",
//       theme: new ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: new MyHomePage(title: 'Flutter Firebase'),
//     );
//   }
//
// }

// static var test;
// Stati cur_user_id;


class Wrapper extends StatefulWidget {
  Wrapper({Key key, this.target}) : super(key: key);
  final String target;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<Wrapper> {


  @override
  Widget build(BuildContext context) {
    print("넘겨받은 TARGET");
    print(widget.target);
    return new Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.person,
            //semanticLabel: 'menu',
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SignInDemo();
            }));
            print('Filter button');
          },
        ),
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Add(curr_user: widget.target,);
              }));
              print('Filter button');
            },
          ),
        ],
      ),
      body: ListPage(target2: widget.target,),
    );
  }
}

class ListPage extends StatefulWidget {
  const ListPage({Key key, this.target2}) : super(key: key);
  final String target2;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // 여기가 살짝 다름.
  Future getPosts(bool flag) async {
    var firestore = FirebaseFirestore.instance;
    //firestore.collection("posts").get();
    firestore.collection("Product").get();
    QuerySnapshot qn = await firestore.collection("Product").
                    orderBy('price',descending: flag).get();

    return qn.docs;
  }

  navigateToDetail(DocumentSnapshot post, String t_target) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailPage(post: post, target3: t_target)));
  }

  Future _data;
  String dropdownValue = 'ASC';

  @override
  initState() {
    super.initState();
    _data = getPosts(false);
  }


  @override
  Widget build(BuildContext context) {
    print("target2");
    print(widget.target2);

    return Container(
      child: FutureBuilder(
          future: _data,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("Loading..."),
              );
            } else {
              final ThemeData theme = Theme.of(context);
              final NumberFormat formatter = NumberFormat.simpleCurrency(
                  locale: Localizations.localeOf(context).toString());
              // return GridView.count(
              //   crossAxisCount: 2,
              //   padding: EdgeInsets.all(16.0),
              //   childAspectRatio: 8.0/9.0,
              //   children: [],
              // );
              return Column(children: <Widget>[
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      dropdownValue == 'ASC' ? _data = getPosts(false) : _data = getPosts(true);
                    });
                    print(dropdownValue);
                  },
                  items: <String>['ASC', 'DESC']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Expanded(
                    child: GridView.count(
                        padding: EdgeInsets.all(16.0),
                        childAspectRatio: 8.0 / 9.0,
                        crossAxisCount: 2,
                        //shrinkWrap: true,
                        children: List.generate(snapshot.data.length, (index) {
                          //itemCount: snapshot.data.length, //조심하기
                          //itemBuilder: (_, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            // TODO: Adjust card heights (103)
                            child: Column(
                              // TODO: Center items on the card (103)
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                AspectRatio(
                                  aspectRatio: 20 / 11,
                                  child: Image.network(
                                      snapshot.data[index].data()["imgurl"]),
                                  // child: Image.asset(
                                  //   product.assetName,
                                  //   package: product.assetPackage,
                                  //   fit: BoxFit.fitWidth,
                                  // ),
                                ),
                                SingleChildScrollView(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(
                                        16.0, 12.0, 16.0, 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          snapshot.data[index].data()["name"],
                                          //style: theme.textTheme.headline6,
                                          maxLines: 1,
                                        ),
                                        //SizedBox(height: 8.0),
                                        Text(
                                          snapshot.data[index]
                                              .data()["price"]
                                              .toString(),
                                          style: theme.textTheme.subtitle2,
                                        ),
                                        Row(
                                            //direction: Axis.vertical,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              MaterialButton(
                                                child: Text("more",
                                                    style: TextStyle(
                                                        color: Colors.blue)),
                                                onPressed: () =>
                                                    navigateToDetail(
                                                        snapshot.data[index], widget.target2),
                                              )
                                            ]),
                                        //SizedBox(height: 50.0),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                          // );
                        })))
              ]);
            }
          }),
    );
  }
}

class DetailPage extends StatefulWidget {
  //const DetailPage({Key key}) : super(key: key);

  final DocumentSnapshot post;
  final String target3;

  const DetailPage({this.post, this.target3});





  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  navigateToUpdate(DocumentSnapshot post) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => UpdatePage(post: post, target4: widget.target3)));
  }

  deleteData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Product").doc(widget.post.id);

    documentReference.delete().whenComplete(() {
      print("Success to Delete");
    });

    //setState(() {});
  }


  LikeData(String like_user, int length) async {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("Product").doc(widget.post.id);

    // String temp = image?.path ?? "https://handong.edu/site/handong/res/img/logo.png";
    //String temp = image?.path ?? widget.post.data()['imgurl'];

    // create map
    //print("imgurl");
    //print(temp);

    String field_name = "like_user" + (length + 1).toString();
    print(field_name);



    Map<String, dynamic> tempp =  widget.post.data();
    tempp[field_name] = like_user;
    tempp["like"] = length + 1;



    Map<String, dynamic> products = {
      "name": widget.post.data()['name'],
      "price": widget.post.data()['price'],
      "description": widget.post.data()['description'],
      "imgurl": widget.post.data()['imgurl'],
      "like": widget.post.data()['like'] + 1,
      "created": widget.post.data()['created'],
      "modified": widget.post.data()['modified'],
      field_name : like_user
    };

    // String temp2 = widget.post.data()['imgurl'];

    documentReference.set(tempp).whenComplete(() {
      print("like updated 완료");
   });

    // setState(() {
    //   widget.post =
    //       FirebaseFirestore.instance.collection("Product").doc(widget.post.id).get()
    // });

    // if (image?.path != null) {
    // if (temp != temp2) {
    //   Reference ref = FirebaseStorage.instance.ref();
    //   TaskSnapshot addImg = await ref
    //       .child("image/" + image.toString())
    //       .putFile(image); // 이미지가 들어가기는 하는데 이름을 어떻게 줄까
    //   if (addImg.state == TaskState.success) {
    //     print("added to Firebase Storage");
    //   }
    // }

    // setState(() {
    //   image = null;
    // });
  }


  // Future _data2;
  //
  //
  // @override
  // initState() {
  //   super.initState();
  //   _data2 = getPosts2(false);
  // }

  int temp_car = 0;

  @override
  Widget build(BuildContext context) {
    print("target3");
    print(widget.target3);

    CollectionReference users = FirebaseFirestore.instance.collection('Product');
    return FutureBuilder<DocumentSnapshot>(
     future: users.doc(widget.post.id).get(),
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

    // if (snapshot.hasError) {
    // return Text("Something went wrong");
    // }
    //
    // if (snapshot.hasData && !snapshot.data.exists) {
    // return Text("Document does not exist");
    // }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: Text("Loading..."),
        );
      }

      // if (snapshot.connectionState == ConnectionState.done) {
      else{
      Map<String, dynamic> data = snapshot.data.data();
      print("here1");
      print(data["like"]);
      print("here2");
    var tempTime = DateTime.now().toString();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () {
            return Navigator.pop(context);
          },
        ),
        title: Text("Detail"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.create),
            onPressed: () {

              if (data["create_user"] == widget.target3) {
                navigateToUpdate(widget.post);
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content : Text("You are not creator."),
                  duration: const Duration(seconds: 2),
                  )
                );

              }



            },
          ),
          IconButton(
            icon: Icon(Icons.restore_from_trash),
            onPressed: () {
            if (data["create_user"] == widget.target3) {
                deleteData();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Wrapper(target: widget.target3,)));
              }
            else{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content : Text("You are not creator."),
                duration: const Duration(seconds: 2),
              )
              );

            }




              },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.network(widget.post.data()["imgurl"]),
              SizedBox(height: 16.0),
              Row(
                children: <Widget>[
                  Text(widget.post.data()["name"],
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
                  SizedBox(width: 30),
                  IconButton(
                    onPressed: (){

                      bool flag = true;

                      //print(target);

                      // 중복되는지 체크.
                      // var tempList = widget.post.data().values.toList();
                      var tempList = data.values.toList();
                      var tempkey = data.keys.toList();
                      //int tempLength = widget.post.data().length;
                      int tempLength = data.length;

                      for (int i = 0; i < tempLength; i++){
                        print(tempList[i]);

                        if (widget.target3 == tempList[i].toString()){
                          if (tempkey[i] == "create_user"){
                            continue;
                          }
                          flag = false;
                          print("같음");
                          break;
                        }
                      }

                      // 변경가능.
                      if (flag == true){
                        print("변경가능");

                        // LikeData(widget.target3, widget.post.data()['like'] + 1);
                        LikeData(widget.target3, data["like"]);

                        setState(() {
                          temp_car ++;
                        });

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content : Text("I Like it !!"),
                          duration: const Duration(seconds: 2),
                          )
                        );



                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //   return Wrapper(target: widget.target3,);
                        // }));

                      }
                      //변경불가
                      else{
                        print("변경불가");
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content : Text("You can only do it once !!"),
                              duration: const Duration(seconds: 2),
                            )
                        );

                      }


                    },
                    icon: Icon(Icons.thumb_up,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                  Text(data["like"].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red)),
                ],
              ),



              // Padding(
              //     padding: EdgeInsets.all(5.0),
              //     child: Text(
              //       widget.post.data()["name"],
              //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              //     )
              // ),
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text("\$" + widget.post.data()["price"].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30))),
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    widget.post.data()["description"],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    //"creator:" + widget.post.id,
                    "creator: " + data["create_user"],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    widget.post.data()["created"] == null
                        ? tempTime + "  Created"
                        : widget.post.data()["created"].toDate().toString() +
                            "  Created",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    widget.post.data()["modified"] == null
                        ? tempTime + "  Modified"
                        : widget.post.data()["modified"].toDate().toString() +
                            "  Modified",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
            ],
          )),
        ],
      ),
    );
    }
    }
    );
  }
}

//
// Container(
// // child: Card(
// //   child: ListTile(
// //     title: Text(widget.post.data()["productname"]),
// //     subtitle: Text(widget.post.data()["price"].toString()),
// //   ),
// // ),
// child: Column(
// //mainAxisAlignment: MainAxisAlignment.center,
// children: <Widget>[
// ListTile(
// title: Text(widget.post.data()["name"]),
// subtitle: Text(widget.post.data()["price"].toString()),
// ),
// Text(
// widget.post.data()["description"]
// )
// ],
// )
// ),

class UpdatePage extends StatefulWidget {
  //const DetailPage({Key key}) : super(key: key);

  final String target4;
  final DocumentSnapshot post;

  const UpdatePage({this.post, this.target4});

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

// update.
class _UpdatePageState extends State<UpdatePage> {
  final picker = ImagePicker();
  File image = null;

  Future getMyImage() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
      }
    });
  }

  String description;
  String productname;
  int price;

  getProduct(productname) {
    this.productname = productname;
    print("name");
    print(productname);
  }

  getPrice(price) {
    this.price = int.parse(price); // 잘안되면 double로 하셈.
    print("price");
    print(price);
  }

  getDescription(description) {
    this.description = description;
    print("description");
    print(description);
  }

  UpdateData() async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Product").doc(widget.post.id);

    // String temp = image?.path ?? "https://handong.edu/site/handong/res/img/logo.png";
    String temp = image?.path ?? widget.post.data()['imgurl'];

    // create map
    print("imgurl");
    print(temp);
    Map<String, dynamic> products = {
      "name": productname,
      "price": price,
      "description": description,
      "imgurl": temp,
      "like": widget.post.data()['like'],
      "created": widget.post.data()['created'],
      "modified": FieldValue.serverTimestamp(),
      "create_user" : widget.post.data()['create_user']
    };

    String temp2 = widget.post.data()['imgurl'];

    documentReference.set(products).whenComplete(() {
      print("$description updated");
    });

    // if (image?.path != null) {
    if (temp != temp2) {
      Reference ref = FirebaseStorage.instance.ref();
      TaskSnapshot addImg = await ref
          .child("image/" + image.toString())
          .putFile(image); // 이미지가 들어가기는 하는데 이름을 어떻게 줄까
      if (addImg.state == TaskState.success) {
        print("added to Firebase Storage");
      }
    }

    // setState(() {
    //   image = null;
    // });
  }

  @override
  Widget build(BuildContext context) {
    var _controller4 = TextEditingController(text: widget.post.data()["name"]);
    var _controller5 =
        TextEditingController(text: widget.post.data()["price"].toString());
    var _controller6 =
        TextEditingController(text: widget.post.data()["description"]);

    var key1, key2, key3;

    return Scaffold(
      resizeToAvoidBottomInset: false, //new line
      appBar: AppBar(
        leadingWidth: 80,
        centerTitle: true,
        leading: FlatButton(
            child: Text("Cancle"),
            onPressed: () {
              return Navigator.pop(context);
            }),
        titleSpacing: 0,
        title: Text("Edit"),
        actions: <Widget>[
          FlatButton(
            child: Text("Save"),
            onPressed: () {
              getProduct(_controller4.value.text);
              getPrice(_controller5.value.text);
              getDescription(_controller6.value.text);
              // _controller4.clear();
              // _controller5.clear();
              // _controller6.clear();
              //
              UpdateData();

              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Wrapper(target: widget.target4,)));

              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return DetailPage();
              //     }
              //   )
              // );//navigateToUpdate(snapshot.data[index]),
            },
          ),
        ],
      ),
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.network(widget.post.data()["imgurl"]),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            IconButton(
              onPressed: () {
                getMyImage();
              },
              icon: Icon(Icons.camera_alt),
            )
          ]),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              key: key1,
              controller: _controller4,
              //initialValue: widget.post.data()["name"],
              // onChanged: (String productname) {
              //   getProduct(productname);
              // }
              // onSaved:(val){
              //   getProduct(val);
              //   print("here about name");
              // },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _controller5,
              //initialValue: widget.post.data()["price"].toString(),
              // onChanged: (String price) {
              //   getPrice(price);
              // },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _controller6,
              //initialValue: widget.post.data()["description"],
              // onChanged: (String description) {
              //   getDescription(description);
              // },
            ),
          ),
        ],
      )),
    );
  }
}
