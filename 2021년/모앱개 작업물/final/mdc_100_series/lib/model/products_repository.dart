
import 'package:cloud_firestore/cloud_firestore.dart';
import 'product.dart';

class ProductsRepository {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // get함수를 통해서 firebase에 있는 document값들을 모두 가져올 수 있다.
  //Future <List<Product>> getProducts() async {

  Future<List<Product>> getProudcts() async {
    List<Product> products = [];
    QuerySnapshot _product = await _firebaseFirestore
        .collection('Product').get(); // orderby쓰면 정렬이 가능하다.
    _product.docs.forEach((ds){
      products.add(Product.fromSnapshot(ds));
    });
    return products;
  }




}