import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

var count = 41;
var flag = true;

void pushSaved(){
  if (flag) {
    Icon(Icons.star);
    count ++;
  }
  else{
    Icon(Icons.star_border);
    count --;
  }
  flag = !flag;
}
// 추가 해본내
class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var c = 41;
  var t = false;
  @override
  Widget build(BuildContext context) {
    Color color = Colors.black;
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.message, 'MESSAGE'),
          _buildButtonColumn(color, Icons.email, 'EMAIL'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
          _buildButtonColumn(color, Icons.description, 'ETC'),
        ],
      ),
    );
    Widget textSection = Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.message,
              size: 40,
            ),
            //Text(),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: EdgeInsets.fromLTRB(10,0,10,0),
                  child: Text(
                    'Recent Message',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding:  EdgeInsets.fromLTRB(10,0,10,0),
                  child:Text(
                    'Long time no see!',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ],
            )
            ),
          ],
        )
    );


    return MaterialApp(
      title: 'Homework2',
      home: Scaffold(
        body:
        ListView(

          children: [
            Image.asset(
              'images/jaechang.jpeg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),

            Container(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  Expanded(
                    /*1*/
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*2*/
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Lee Gyu Seok',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          '21500468',
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*3*/

                  IconButton(
                      icon: t? Icon(Icons.star, color: Colors.yellow,):Icon(Icons.star_border, color: Colors.yellow),
                      onPressed: () {
                        setState(() {
                          t = !t;
                          t? c++ : c--;
                        });
                      }
                  ),
                  Text(c.toString()),
                ],
              ),
            ),


            Divider(
              height: 1.0,
              color: Colors.black,


            ),
            buttonSection,
            Divider(
              height: 1.0,
              color: Colors.black,
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
        Container(
          child: Icon(icon, color: color),
          margin: EdgeInsets.only(top: 10),
        ) ,
        Container(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
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
}