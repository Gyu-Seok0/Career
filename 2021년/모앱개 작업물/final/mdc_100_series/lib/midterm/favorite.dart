import 'package:Shrine/%EC%A7%80%EA%B8%88%EA%B9%8C%EC%A7%80%ED%95%9C%EB%82%B4%EC%9A%A9/home.dart';
import 'package:flutter/material.dart';
import 'model/products_repository.dart';
import 'model/product.dart';

class FavoritePage extends StatefulWidget{
  var list;
  FavoritePage({Key key, this.list}) : super(key: key);

  @override
  FavoritePageState createState()=> FavoritePageState();
}

class FavoritePageState extends State<FavoritePage> {
  List<Product> products = ProductsRepository.loadProducts(Category.all);
  //final List<String> items = new List <String>.generate(30, (i) => "Items ${i+1}");
  //final items = List<String>.generate(20, (i) => "Item ${i + 1}");


  @override
  Widget build(BuildContext context) {
    //var arg = ModalRoute.of(context).settings.arguments;

    //print(savedList);

    // print("here");
    // print(widget.list);
    // var temp = widget.list;


    // var i = 0;
    //
    // final tiles = temp.map(
    //         (Product pair) {
    //   if(pair.id == widget.list[i]){
    //     i++;
    //     return ListTile(
    //       title: Text(
    //         pair.id.toString(),
    //       ),
    //     );
    //   }
    // },



    // final divided = ListTile.divideTiles(
    //   context: context,
    //   tiles: tiles,
    // ).toList();


    List<Product> savedL = ProductsRepository.loadProducts(Category.all);
    var idx = 0;

    List<Product> favoriteL = [];

    for (int i = 0; i < savedL.length; i++){
      if(savedL[i].id == savedList[idx]){
        favoriteL.add(savedL[i]);
        if(idx == savedList.length - 1) break;
        else idx++;
      }
    }


    //List<String> fL = [];

    final List<String> items = [];
    for(int i = 0; i < favoriteL.length; i++){
      items.add(favoriteL[i].name.toString());
    }

    //print('fL = ${fL.length}');

    final tiles = favoriteL.map((Product pair) {
        {return ListTile(
            title: Text(
              pair.name.toString(),
            ),
          );
        }
      }
    );

    final divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();




    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Favorite Hotels"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            semanticLabel: 'back',
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

        //body: ListView(children: divided));
      body:  ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return Dismissible(
          // Each Dismissible must contain a Key. Keys allow Flutter to
          // uniquely identify widgets.
          key: Key(item),
          // Provide a function that tells the app
          // what to do after an item has been swiped away.
          onDismissed: (direction) {
            // Remove the item from the data source.
            setState(() {
              items.removeAt(index);
            });

            // Then show a snackbar.
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("$item dismissed")));
          },
          // Show a red background as the item is swiped away.
          background: Container(color: Colors.red),
          child: ListTile(title: Text('$item')),
        );
      },
    ),

    );


  }

}

