import 'package:flutter/material.dart';
import 'home.dart';
import '../model/products_repository.dart';
import '../model/product.dart';
//import 'favorite.dart';


//final _saved = <int>{};
//final _saved = <Product>{};


class DetailPage extends StatefulWidget{
  final int id;
  DetailPage({Key key, this.id}) : super(key: key);

  @override
  DetailPageState createState()=> DetailPageState();
}

class DetailPageState extends State<DetailPage>{
  //List<Product> products = ProductsRepository.loadProducts(Category.all);
  // if (products == null || products.isEmpty) {
  // return const <Card>[];
  // }



  //Your code here
  final int temp = 0;
  
  // showOverlay(BuildContext context) async {
  //   OverlayState overlayState = Overlay.of(zcontext);
  //   OverlayEntry overlayEntry = OverlayEntry(
  //       builder: (context) => Positioned(
  //             top: 24.0,
  //             right: 10.0,
  //             child: Icon(Icons.favorite),
  //           ));
  //   overlayState.insert(overlayEntry);
  //
  //   await Future.delayed(Duration(seconds: 2));
  //
  //   overlayEntry.remove();
  // }





  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Row(children: <Widget>[
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
              ]),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(children: <Widget>[
                Icon(Icons.location_on, color: Colors.blue),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Icon(Icons.phone, color: Colors.blue),
                Text(
                  '+ 010 1234 5678',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ]),
            ],
          ),
        ),
      ],
    ),
  );


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    int temp = widget.id;
    final alreadySaved = savedList.contains(temp);

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Detail page'),
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
        body: ListView(
          children: <Widget>[
            Stack(children: <Widget>[
              Hero(
                  tag: temp,
                  child: GestureDetector(
                      onDoubleTap: (){
                          setState(() {
                            if (alreadySaved) {

                              savedList.remove(temp);
                            } else {
                              savedList.add(temp);
                              savedList.sort();
                            }
                          });


                          // Navigator.push(context, MaterialPageRoute(builder: (context) {
                          //   return FavoritePage(list: _saved);
                          // }
                          // )
                          // );

                          },
                      child: Image.asset(
                    'images/$temp.jpeg',
                    width: 600,
                    height: 240,
                    fit: BoxFit.cover,
                  ))
              ),
              Align(
                alignment: Alignment.topRight,
                child: Icon(
                    alreadySaved? Icons.favorite :Icons.favorite_border,
                    color: alreadySaved ? Colors.red : null,
                ),
              )
            ]),
            titleSection,
            Divider(
              thickness: 1,
            ),
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

// class DetailPage extends StatefulWidget{
//   DetailPage({Key key, this.id}) : super(key:key);
//   final String id;
//   @override
//   _DetailPageState createState() => _DetailPageState(id);
// }
//
// class _DetailPageState extends State<DetailPage> {
//   Widget titleSection = Container(
//     padding: const EdgeInsets.all(32),
//     child: Row(
//       children: [
//         Expanded(
//           /*1*/
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /*2*/
//               Container(
//                 padding: const EdgeInsets.only(bottom: 8),
//                 child: Text(
//                   'Oeschinen Lake Campground',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Text(
//                 'Kandersteg, Switzerland',
//                 style: TextStyle(
//                   color: Colors.grey[500],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         /*3*/
//         Icon(
//           Icons.star,
//           color: Colors.red[500],
//         ),
//         Text('41'),
//       ],
//     ),
//   );
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     Color color = Theme.of(context).primaryColor;
//     Widget buttonSection = Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _buildButtonColumn(color, Icons.call, 'CALL'),
//           _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
//           _buildButtonColumn(color, Icons.share, 'SHARE'),
//         ],
//       ),
//     );
//     Widget textSection = Container(
//       padding: const EdgeInsets.all(32),
//       child: Text(
//         'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
//             'Alps. Situated 1,578 meters above sea level, it is one of the '
//             'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
//             'half-hour walk through pastures and pine forest, leads you to the '
//             'lake, which warms to 20 degrees Celsius in the summer. Activities '
//             'enjoyed here include rowing, and riding the summer toboggan run.',
//         softWrap: true,
//       ),
//     );
//
//
//     return MaterialApp(
//       title: 'Flutter layout demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter layout demo'),
//         ),
//         body: ListView(
//           children: [
//             Image.asset(
//               'images/1.jpeg',
//               width: 600,
//               height: 240,
//               fit: BoxFit.cover,
//             ),
//             titleSection,
//             buttonSection,
//             textSection,
//           ],
//         ),
//       ),
//     );
//   }
//
//   Column _buildButtonColumn(Color color, IconData icon, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(icon, color: color),
//         Container(
//           margin: const EdgeInsets.only(top: 8),
//           child: Text(
//             label,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w400,
//               color: color,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
