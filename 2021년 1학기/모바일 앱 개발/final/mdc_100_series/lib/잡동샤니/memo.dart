future: _data,


@override
initState() {
  super.initState();
  _data = getPosts(false);
}

Future getPosts(bool flag) async {
  var firestore = FirebaseFirestore.instance;
  //firestore.collection("posts").get();
  firestore.collection("Product").get();
  QuerySnapshot qn = await firestore.collection("Product").
  orderBy('price',descending: flag).get();

  return qn.docs;
}

