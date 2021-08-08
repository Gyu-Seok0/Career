import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Startup Name',
      theme: ThemeData(
        primaryColor: Colors.blue.shade100,
      ),
      home: RandomWords(),

      // title: 'Welcome to Flutter',
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Welcome to Flutter'),
      //   ),
      //   body: Center(
      //     //child: Text('Hello World'),
      //     //child: Text(wordPair.asPascalCase),
      //     child: RandomWords(),
      //   ),
      // ),
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = TextStyle(fontSize: 18.0);

  // favorite만 모여져 있는 웹페이지를 만들 때 사용합니다.
  void _pushSaved(){
     Navigator.of(context).push(
       MaterialPageRoute<void>(
         // NEW lines from here...
         builder: (BuildContext context) {
           final tiles = _saved.map(
                 (WordPair pair) {
               return ListTile(
                 title: Text(
                   pair.asPascalCase,
                   style: _biggerFont,
                 ),
               );
             },
           );
           final divided = ListTile.divideTiles(
             context: context,
             tiles: tiles,
           ).toList();

           return Scaffold(
             appBar: AppBar(
               title: Text('Saved Suggestions'),
             ),
             body: ListView(children: divided),
           );
         }, // ...to here.
       ),
     );
  }


  // updata version
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('21500468 Gyu-Seok Lee'),
        actions:[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; //*3* 2로 나눈 몫을 의미한다.
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    leading: Icon( // leading or trailing
      alreadySaved ? Icons.star : Icons.star_border,
      color: alreadySaved? Colors.yellow: null,
       ),
    onTap: (){
        setState(() {
          if (alreadySaved){
            _saved.remove(pair);
          }
          else{
            _saved.add(pair);
          }
        });
    },

    );
  }

}
