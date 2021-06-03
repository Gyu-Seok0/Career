import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Startup Name',
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
  // @override
  // Widget build(BuildContext context){
  //   final wordPair = WordPair.random();
  //   return Text(wordPair.asPascalCase);
  // }

  // updata version
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('여기가 타이틀을 바꾸는 곳 같다.'),
      ),
        body: _buildSuggestions(),
    );
  }

  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);


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
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

}
