import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Widget2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateWidget2();
}

class StateWidget2 extends State<Widget2> {
  @override
  Widget build(BuildContext context) {
    print('Widget2 build');

    return Text('Widget2', style: Theme.of(context).textTheme.subhead);
  }
}
