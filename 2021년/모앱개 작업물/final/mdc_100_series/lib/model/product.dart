
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

enum Category { all, accessories, clothing, home, }

class Product {
  const Product({
    @required this.category,
    @required this.id,
    //@required this.isFeatured,
    @required this.name,
    @required this.price,
    @required this.imgurl,
    @required this.like,
    @required this.description,


  })  : assert(category != null),
        assert(id != null),
        //assert(isFeatured != null),
        assert(name != null),
        assert(price != null),
        assert(imgurl != null),
        assert(like != null),
        assert(description != null);

  final Category category;
  final int id;
  //final bool isFeatured;
  final String name;
  final int price;
  final String imgurl;
  final int like;
  final String description;
  //final FieldValue time;

  String get assetName => '$id-0.jpg';
  String get assetPackage => 'shrine_images';

  @override
  String toString() => "$name (id=$id)";

  // 아까만든거임.
  factory Product.fromSnapshot(DocumentSnapshot ds){
    return Product(
      category: ds['category'],
      id : ds['id'],
      //isFeatured : ds['isFeatured'],
      name : ds['name'],
      price : ds['price'],
      imgurl: ds['imgurl'],
      like: ds['like'],
      description: ds['description']

    );
  }
}
