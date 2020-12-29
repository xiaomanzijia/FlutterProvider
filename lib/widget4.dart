import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model1.dart';

class Widget4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateWidget4();
}

class StateWidget4 extends State<Widget4> {
  Selector<Model1, int> selector;

  @override
  void initState() {
    selector = buildSelector();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Widget4 build');
    return selector;
  }

  Selector<Model1, int> buildSelector() {
    return Selector<Model1, int>(
      builder: (context, count, child) {
        return Text(
          'Widget4 Model1 count:$count',
          style:
              Theme.of(context).textTheme.subhead.copyWith(color: Colors.green),
        );
      },
      selector: (context, model) => model.count,
    );
  }
}
