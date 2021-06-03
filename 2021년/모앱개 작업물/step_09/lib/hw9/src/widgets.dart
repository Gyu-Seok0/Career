import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../main.dart';

class Header extends StatelessWidget {
  const Header(this.heading);
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          heading,
          style: TextStyle(fontSize: 24),
        ),
      );
}

class Paragraph extends StatelessWidget {
  const Paragraph(this.content, this.msgUser ,this.currentUser, this.idx);
  final String content;
  final String msgUser;
  final String? currentUser;
  final int idx;


  @override
  Widget build(BuildContext context) {

    // FirebaseFirestore rootRef = FirebaseFirestore.getInstance();
    // CollectionReference deliveryRef = rootRef.collection("delivery");
    // Query nameQuery = deliveryRef.whereEqualTo("itemName", "eggroll");
    // nameQuery.get().addOnCompleteListener(new OnCompleteListener<QuerySnapshot>() {
    // @Override
    // public void onComplete(@NonNull Task<QuerySnapshot> task) {
    // if (task.isSuccessful()) {
    // for (QueryDocumentSnapshot document : task.getResult()) {
    // Log.d(TAG, document.getId());
    // }
    // }
    // }
    // });
    var collectionRef = FirebaseFirestore.instance.collection('guestbook');
    var doc = collectionRef.doc().get();
    //print("doc");
    //print(doc.reference.id);



    // 방법 1
    CollectionReference users = FirebaseFirestore.instance.collection("guestbook");
    Future <void> deleteUser(int temp){
      return users
          .doc(temp.toString())
          .delete()
          .then((value) => print("User Deleted"))
          .catchError((error) => print("Failed to delete user: $error"));
    }
    // 방법2
    DocumentReference doc_ref=FirebaseFirestore.instance.collection("guestbook").doc();
    //   DocumentSnapshot docSnap = await doc_ref.get();

    //print(await doc_ref.get().reference.);


    // Future<String> get_data(DocumentReference doc_ref) async {
    //   DocumentSnapshot docSnap = await doc_ref.get();
    //   var doc_id2 = docSnap.reference.id;
    //   // print(doc_id2);
    //   // print(FirebaseFirestore.instance.collection("guestbook").doc(doc_id2).get().
    //   //   then((DocumentSnapshot documentSnapshot){
    //   //     if (documentSnapshot.exists){
    //   //       print("document data: ${documentSnapshot.data()}");
    //   //     }
    //   //     else{
    //   //       print("there is not exist data");
    //   //     }
    //   //   })
    //   // );
    //   return doc_id2;
    // }

    //var documentID = get_data(doc_ref);
    //print("documentID");
    //print(FirebaseFirestore.instance.collection("guestbook").doc(documentID.toString()).get());
    //print(documentID.);




    //print(msgUser);
    //print(currentUser);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
          Text(
          content,
          style: TextStyle(fontSize: 18))
            ,
            msgUser == currentUser?
            IconButton(
                onPressed: (){
                  deleteUser(idx);
                  print(idx);
                  //print("here2");
                },
                icon: Icon(Icons.delete_outline)):
            Text(''),
          ],
        ),
      );}
}

class IconAndDetail extends StatelessWidget {
  const IconAndDetail(this.icon, this.detail);
  final IconData icon;
  final String detail;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 8),
            Text(
              detail,
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      );
}

class StyledButton extends StatelessWidget {
  const StyledButton({required this.child, required this.onPressed});
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.deepPurple)),
        onPressed: onPressed,
        child: child,
      );
}
