/// Flutter code sample for ExpansionPanelList

// Here is a simple example of how to implement ExpansionPanelList.

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Item> _books = generateItems(1);
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Search'),
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
            _buildPanel(),
            Container(
                padding: EdgeInsets.only(left: 75, top: 10, bottom: 20),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                )),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_today),
                        Text("Check-in"),
                      ],
                    ),
                    Text(_dateTime == null ? 'Nothing' : _dateTime.toString())
                  ],
                ),
                Column(
                  children: [
                    RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Select Date",
                      ),
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2222),
                        ).then((date) {
                          setState(() {
                            _dateTime = date;
                          });
                        });
                      },
                    )
                  ],
                ),
              ],
            ),

            Center(
                child: RaisedButton(
              child: Text("Search"),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(

                        title: Text("Please Check your choice"),
                        content: SingleChildScrollView(
                          child:  ListBody(
                              children: <Widget>[
                                Container(
                                    width: 10,
                                    child:
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.center,

                                            children: <Widget> [
                                            Icon(Icons.wifi),
                                            Column(
                                      children: <Widget>[
                                        if (check1) Text("No Kids Zone"),
                                        if (check2) Text("Pet-Friendly"),
                                        if (check3) Text("Free BreakFast"),
                                      ],
                                    )
                                    ]
                                )
                                ),
                                Flexible(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,

                                      children: <Widget>[
                                        Icon(Icons.calendar_today),
                                        Text(_dateTime.toString()),
                                      ],
                                    )),
                              ],
                            ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            color: Colors.blue,
                            child: Text("Search"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          FlatButton(
                            child: Text("Cancle"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      );
                    });
              },
            )),

            // SingleChildScrollView(
            //   child: Container(
            //     //padding: EdgeInsets.only(top: 80),
            //     child: _buildPanel(),
            //   ),
            // ),
          ],
        ));
  }

  var check1 = false;
  var check2 = false;
  var check3 = false;

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _books[index].isExpanded = !isExpanded;
        });
      },
      children: _books.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Filter",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                Text("select fitlers"),
              ],
            );
          },
          // body: CheckboxListTile(
          //   title: Text("check! "),
          //   secondary: Icon(Icons.beach_access),
          //   controlAffinity:
          //     ListTileControlAffinity.platform,
          //   value: _checked = false,
          //   onChanged: (bool value){
          //     _checked = value;
          //   },
          //
          //   activeColor: Colors.green,
          //   checkColor: Colors.red,
          //
          //
          //
          // ),
          body: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                      value: check1,
                      onChanged: (bool value) {
                        setState(() {
                          check1 = value;
                        });
                      }),
                  Text("No kids Zone"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                      value: check2,
                      onChanged: (bool value) {
                        setState(() {
                          check2 = value;
                        });
                      }),
                  Text("Pet-Friendly"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                      value: check3,
                      onChanged: (bool value) {
                        setState(() {
                          check3 = value;
                        });
                      }),
                  Text("Free breakfast"),
                ],
              ),
            ],
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Book $index',
      expandedValue: 'Details for Book $index goes here',
    );
  });
}

// ListTile(
// title: Text(item.expandedValue),
// ),
