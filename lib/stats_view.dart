import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model1.dart';
import 'model2.dart';
import 'user.dart';
import 'widget1.dart';
import 'widget2.dart';
import 'widget3.dart';
import 'widget4.dart';

class StatsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateStatsView();
}

class StateStatsView extends State<StatsView> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  var widget4;

  @override
  void initState() {
    widget4 = Widget4();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _counter.value = Provider.of<Model1>(context).count;

    return Center(
      child: SingleChildScrollView(
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
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Selector<Model1, int>(
                builder: (context, count, child) => Text(
                  "Selector示例演示: $count",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.green),
                ),
                selector: (context, model) => model.count,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Text('Selector2示例演示',
                  style: Theme.of(context).textTheme.title),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Selector2<Model1, Model2, int>(
                selector: (context, model1, model2) {
                  return model1.count + model2.count;
                },
                builder: (context, totalCount, child) {
                  print('Selector2 build');
                  return Text('Model1和Model2 count合计:$totalCount',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subhead);
                },
                shouldRebuild: (previous, next) => true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('Consumer示例演示',
                  style: Theme.of(context).textTheme.title),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Consumer<Model1>(
                builder: (context, model, child) {
                  print('Model1 Consumer build');
                  return Text('Model1 count:${model.count}',
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(color: Colors.green));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Consumer<Model2>(
                builder: (context, model, child) {
                  print('Model2 Consumer build');
                  return Text(
                    'Model2 count:${model.count}',
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(color: Colors.red),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('Widget build?',
                  style: Theme.of(context).textTheme.title),
            ),
            ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, count, child) => Text(
                  'ValueListenableBuilder count:$count',
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(color: Colors.green)),
            ),
            Widget1(),
            Widget2(),
            Widget3(),
            widget4,
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text('其他Provider',
                  style: Theme.of(context).textTheme.title),
            ),
            FutureProvider<Model1>(
              create: (context) {
                return Future.delayed(Duration(seconds: 2))
                    .then((value) => Model1()..count = 11);
              },
              initialData: Model1(),
              builder: (context, child) => Text(
                  'FutureProvider ${Provider.of<Model1>(context).count}',
                  style: Theme.of(context).textTheme.title.copyWith(color: Colors.green)),
            ),
            ProxyProvider<Model1, User>(
              update: (context, value, previous) =>
                  User("change value ${value.count}"),
              builder: (context, child) => Text(
                  'ProxyProvider: ${Provider.of<User>(context).name}',
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.green)),
            ),
            StreamProvider(
              create: (context) {
                return Stream.periodic(
                    Duration(seconds: 2), (data) => Model1()..count = data);
              },
              initialData: Model1(),
              builder: (context, child) => Text(
                  'StreamProvider: ${Provider.of<Model1>(context).count}',
                  style: Theme.of(context).textTheme.title.copyWith(color: Colors.green)),
            ),
          ],
        ),
      ),
    );
  }
}
