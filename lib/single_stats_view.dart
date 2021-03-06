import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model1.dart';

class SingleStatsView extends StatelessWidget {
  const SingleStatsView();

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
