import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Widget1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateWidget1();
}

class StateWidget1 extends State<Widget1> {
  @override
  Widget build(BuildContext context) {
    print('Widget1 build');

    return Text('Widget1', style: Theme.of(context).textTheme.subhead);
  }
}
