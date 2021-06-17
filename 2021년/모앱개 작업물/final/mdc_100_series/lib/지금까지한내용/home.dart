import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '/model/products_repository.dart';
import '/model/product.dart';

import 'detail.dart';
import 'add.dart';
import 'profile.dart';


var savedList = [];
class HomePage extends StatelessWidget {
  // TODO: Add a variable for Category (104)
  //
  // press:(){
  //   setState(){
  //  ///products 변수를 다시  ProductRepository.getProducts(); 로 업데이트 해주며 ㄴ됨
  // }
  // }
  List<Card> _buildGridCards(BuildContext context) {

    //List<Product> products = ProductsRepository.loadProducts(Category.all);
    Future <List<Product>> temp = ProductsRepository().getProudcts();


    //final var temp = await getUserid();



    if (temp == null) {
      return const <Card>[];
    }

    //var temp  = Product <List>(products).collection;
    List <Product> products = temp as List<Product>;
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        // TODO: Adjust card heights (103)
        child: Column(
          // TODO: Center items on the card (103)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.name,
                      style: theme.textTheme.headline6,
                      maxLines: 1,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.subtitle2,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                      MaterialButton(
                        child:
                        Text("more",style:TextStyle(color: Colors.blue) ),
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return DetailPage(id: product.id);
                              }));
                        }
                      )
                    ]),
                    SizedBox(height: 8.0),



                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.person ,
            //semanticLabel: 'menu',
          ),

          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return profile();
            }));
            print('Filter button');
          },
        ),
        title: Text('Main'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Add();
              }));
              print('Filter button');
            },
          ),
        ],
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          childAspectRatio: 8.0 / 9.0,
          children: _buildGridCards(context),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
