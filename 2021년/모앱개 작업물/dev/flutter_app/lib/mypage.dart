import 'package:Shrine/app.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'detail.dart';
import 'home.dart';
import 'model/products_repository.dart';
import 'model/product.dart';
import 'package:rive/rive.dart';
import 'package:flutter/rendering.dart';

class MyPage extends StatefulWidget {
  var list;
  MyPage({Key key, this.list}) : super(key: key);

  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  final riveFileName = 'images/knight063.riv';
  Artboard _riveArtboard;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
  }

  void _loadRiveFile() async {
    final bytes = await rootBundle.load(riveFileName);
    final file = RiveFile();

    if (file.import(bytes)) {
      setState(() {
        _riveArtboard = file.mainArtboard
          ..addController(SimpleAnimation('idle'));
      });
    }
  }

  bool state = false;
  double rateZero = 0;
  double rateOne = 0;
  double rateTwo = 0;
  double rateThree = 0;
  double rateFour = 0;
  double rateFive = 0;
  double rateSix = 0;
  double rateSeven = 0;
  double rateEight = 90;
  String asset;
  double top;

  Widget parellel() {
    return NotificationListener(
      onNotification: (v) {
        if (v is ScrollUpdateNotification) {
          //only if scroll update notification is triggered
          setState(() {
            rateEight -= v.scrollDelta / 1;
            rateSeven -= v.scrollDelta / 1.5;
            rateSix -= v.scrollDelta / 2;
            rateFive -= v.scrollDelta / 2.5;
            rateFour -= v.scrollDelta / 3;
            rateThree -= v.scrollDelta / 3.5;
            rateTwo -= v.scrollDelta / 4;
            rateOne -= v.scrollDelta / 4.5;
            rateZero -= v.scrollDelta / 5;
          });
        }
      },
      child: Stack(
        children: <Widget>[
          //ParallaxWidget(top: rateZero, asset: "0"),
          ParallaxWidget(top: rateOne, asset: "1"),
          ParallaxWidget(top: rateTwo, asset: "2"),
          ParallaxWidget(top: rateThree, asset: "3"),
          ParallaxWidget(top: rateFour, asset: "4"),
          ParallaxWidget(top: rateFive, asset: "5"),
          ParallaxWidget(top: rateSix, asset: "6"),
        ],
      ),
    );
  }


  List<ListTile> _buildlist(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);
    if (products == null || products.isEmpty) {
      return const <ListTile>[];
    }
    final ThemeData theme = Theme.of(context);
    // final NumberFormat formatter = NumberFormat.simpleCurrency(
    //     locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return ListTile(
        onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return DetailPage(id: product.id);
            }));
      },
          title: Row(children: <Widget>[
            Hero(
                tag: product.id,
                child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset(

                      product.assetName,

                      //fit: BoxFit.fitWidth
                    ),
                )
            ),
            Column(
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 20,
                ),

                Text(
                  product.name,
                  style: theme.textTheme.headline6,
                  maxLines: 1,
                ),

                Text(
                  product.location,
                  style: theme.textTheme.bodyText1,
                  maxLines: 1,
                ),

                FlatButton(
                  child: Text('more',
                      style: TextStyle(color: Colors.blue)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return DetailPage(id: product.id);
                        }));
                  },
                )
              ],
            )
          ])
      );
    }).toList();
  }


  Widget  test2(){
    return ListView(
        shrinkWrap: true,
        primary: true,
        //crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        //childAspectRatio: 8.0 / 9.0,
        children: _buildlist(context) // Changed code
    );
  }

  @override
  Widget build(BuildContext context) {
    print("build here");
    print(savedList);

    return new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(" My page "),
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
        body: ListView(children: <Widget>[
          Center(
              child: ClipOval(
            //clipper: Myclipper(),
            child: _riveArtboard == null
                ? const SizedBox()
                : SizedBox(
                    width: 200,
                    height: 100,
                    child: Rive(
                      artboard: _riveArtboard,
                    )),
          )),
          Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wb_sunny, color: state ? null : Colors.yellow),
                Switch(
                    value: state,
                    onChanged: (bool s) {
                      setState(() {
                        state = s;
                      });
                    }),
                Icon(Icons.nightlight_round,
                    color: state ? Colors.yellow : null),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("GyuSeok Lee"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("21500468"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("MY favoirtie Hotel",
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ],
            ),
            ListView(
            shrinkWrap: true,
            primary: true,
            //crossAxisCount: 2,
            padding: EdgeInsets.all(16.0),
            //childAspectRatio: 8.0 / 9.0,
            children: _buildlist(context) // Changed code
            ),

          ])
        ])

        );
  }
}

class RiveAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: 700,
          height: 300,
          child: FlareActor(
            "assets/knight063.riv",
            animation: "My Test",
          ),
        ),
      ),
    ]));
  }
}

/*    parallel scrolling         */

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Center(
//           child: ExampleParallax(),
//         ),
//       ),
//     );
//   }
// }

class Myclipper extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    return Rect.fromLTRB(50, 0, 200, 100);
  }

  bool shouldReclip(oldClipper) {
    return true;
  }
}

class ParallaxWidget extends StatelessWidget {
  const ParallaxWidget({
    Key key,
    @required this.top,
    @required this.asset,
  }) : super(key: key);

  final double top;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -45,
      top: top,
      child: Container(
        height: 550,
        width: 900,
        child: Image.asset("images/$asset.jpeg", fit: BoxFit.cover),
      ),
    );
  }
}
