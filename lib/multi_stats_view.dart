import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model1.dart';
import 'model2.dart';


class MultiStatsView extends StatelessWidget {

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);


  @override
  Widget build(BuildContext context) {

    _counter.value = Provider.of<Model1>(context).count;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            color: Colors.blue,
            child: Text('Model1 count++'),
            onPressed: () {
              Provider.of<Model1>(context, listen: false).count++;
            },
          ),
          FlatButton(
            color: Colors.blue,
            child: Text('Model2 count++'),
            onPressed: () {
              Provider.of<Model2>(context, listen: false).count++;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text('Model count值变化监听',
                style: Theme.of(context).textTheme.title),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text('Model1 count:${Provider.of<Model1>(context).count}',
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .copyWith(color: Colors.green)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Text('Model2 count:${Provider.of<Model2>(context).count}',
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .copyWith(color: Colors.red)),
          ),
          ValueListenableBuilder(
            valueListenable: _counter,
            builder: (context, count, child) => Text(
                'ValueListenableBuilder count:$count',
                style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.green)),
          ),
        ],
      ),
    );
  }
}
