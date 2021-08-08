// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//import 'package:Shrine/favorite.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'model/products_repository.dart';
import 'model/product.dart';
import 'login.dart';
import 'detail.dart';
import 'search.dart';
import 'mypage.dart';

//const _url = "https://www.handong.edu/";

List<bool> isSelected = [true,false];

var flag = 0;

//void _launchURL() async =>
//await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
var savedList = [];

class HomePage extends StatefulWidget {
  HomePage1 createState() => HomePage1();
}

//Your code here
class HomePage1 extends State<HomePage> {
  //get isSelected => false;

  launchURL() {
    launch('https://www.handong.edu/');
  }

  //List<bool> _selections = List.generate(2, (_) => false);
  //List<bool> isSelected;

  void initState() {
    //isSelected = [true, false];
    super.initState();
  }
  List<Product> products = ProductsRepository.loadProducts(Category.all);

  // TODO: Make a collection of cards (102)
  List<Card> _buildGridCards(BuildContext context) {
    if (products == null || products.isEmpty) {
      return const <Card>[];
    }
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
            Hero(
                tag: product.id,
                child: Image.asset(
                  product.assetName,
                  //fit: BoxFit.fitWidth
                )),



            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.0, 12.0, 16.0, 8.0),
                child: ListView(
                  // TODO: Align labels to the bottom and center (103)
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  // TODO: Change innermost Column (103)
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                        ]),

                    // TODO: Handle overflowing labels (103)
                    Text(
                      product.name,
                      style: theme.textTheme.headline6,
                      maxLines: 1,
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.pin_drop_outlined,
                            color: Colors.blue,
                          ),
                          Text(
                            product.location,
                            style: theme.textTheme.bodyText1,
                            maxLines: 1,
                          )
                        ]),

                    //SizedBox(height: 8.0),
                    // Text(
                    //   formatter.format(product.price),
                    //   style: theme.textTheme.subtitle2,
                    // ),
                    // SizedBox(height: 8.0),
                    // Text( // 여기를 수정해주면, 로케이션이랑 등등 내용 추가 가능.
                    //   formatter.format(product.id),
                    //   //style: theme.textTheme.subtitle2,
                    // ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
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
                        ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }


  List<ListTile> _buildList (BuildContext context) {
    if (products == null || products.isEmpty) {
      return const <ListTile>[];
    }
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return ListTile(
        title: Text('test'),
        subtitle: Row(children: [
          Text('test 2'),
          Text('test 3'),

        ],),
      );
    }).toList();
  }


  List<ListTile> _buildlist(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);
    if (products == null || products.isEmpty) {
      return const <ListTile>[];
    }
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return ListTile(
          title: Row(children: <Widget>[
            Hero(
                tag: product.id,
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset(
                    product.assetName,
                    //fit: BoxFit.fitWidth
                )
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


  // TODO: Add a variable for Category (104)
  Widget  test1(){
    return GridView.count(
        shrinkWrap: true,
        primary: true,
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context) // Changed code
    );
  }



  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Main'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
          ),
          IconButton(
              icon: Icon(
                Icons.language,
                semanticLabel: 'filter',
              ),
              onPressed: launchURL),
        ],
      ),
      // TODO: Add a grid view (102)

      body: ListView(
          //crossAxisAlignment: CrossAxisAlignment.end,
          // mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
                alignment: Alignment.topRight,
                child: ToggleButtons(
                  children: <Widget>[
                    Icon(Icons.list),
                    Icon(Icons.grid_view),
                  ],
                  isSelected: isSelected,
                  selectedColor: Colors.blue,
                  onPressed: (int index) {
                    setState(() {
                      // for (int i = 0; i < isSelected.length; i++) {
                      //   isSelected[i] = (i == index);
                      // }
                      flag = index;
                      isSelected[index] = !isSelected[index];
                      if(flag == 1){
                        isSelected[index-1] = !isSelected[index-1];
                      }else{
                        isSelected[index+1] = !isSelected[index+1];
                      }
                    });
                  },
                )),


            isSelected[0] == true? test2() : test1()
            //if (isSelected[0])
            // ListTile(
            //   title: Row(children: <Widget>[
            //       Hero(
            //           tag: Text("id"),
            //           child: Image.asset(
            //             "images/1.jpeg",
            //         fit: BoxFit.fitWidth
            //       )),
            //     Column(
            //       children: <Widget>[
            //         Icon(
            //           Icons.star,
            //           color: Colors.yellow,
            //           size: 20,
            //         ),
            //
            //         Text(
            //           "product.name",
            //           //style: theme.\textTheme.headline6,
            //           maxLines: 1,
            //         ),
            //
            //         Text(
            //           "product.location",
            //           //style: theme.textTheme.bodyText1,
            //           maxLines: 1,
            //         ),
            //
            //         FlatButton(
            //           child: Text('more',
            //               style: TextStyle(color: Colors.blue)),
            //           // onPressed: () {
            //           //   Navigator.push(context,
            //           //       MaterialPageRoute(builder: (context) {
            //           //         return DetailPage(id: product.id);
            //           //       }));
            //           // },
            //         )
            //       ],
            //     )
            //
            //
            //
            //   ])
            //
            //   )


        // GridView.count(
        // shrinkWrap: true,
        // primary: true,
        // crossAxisCount: 2,
        // padding: EdgeInsets.all(16.0),
        // childAspectRatio: 8.0 / 9.0,
        // children: _buildGridCards(context)
        // ),








          ]),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Pages',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 41,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: Text('Home'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.search,
                color: Colors.blue,
              ),
              title: Text('Search'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.location_city,
                color: Colors.blue,
              ),
              title: Text('Favorite Hotel'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FavoritePage();
                }));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              title: Text('My Page'),
              onTap: () {
                Navigator.pushNamed(context, 'mypage');
              },
            ),
          ],
        ),
      ),

      //resizeToAvoidBottom: false,

      resizeToAvoidBottomInset: false,
    );
  }
}
