// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp()); // 클래스명이라고 생각하면 되고, new가 생략

class MyApp extends StatelessWidget {
  @override //메타 정보라고 한다.
  Widget build(BuildContext context) { //리턴값은 widget
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold( //비개: 공사장에서 틀
        appBar: AppBar( //named parameter --> par
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

// 기본은 public이고, _ 는 private 지시자를 의미합니다


