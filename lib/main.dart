import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/model1.dart';
import 'package:flutter_provider_demo/multi_stats_view.dart';
import 'package:flutter_provider_demo/single_stats_view.dart';
import 'package:flutter_provider_demo/stats_view.dart';
import 'package:provider/provider.dart';

import 'model2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Model1()),
        ChangeNotifierProvider.value(value: Model2()),
      ],
      child: MaterialApp(
        title: 'Flutter Provider Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Provider Demo'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            tabs: [
              Text("SingleStats"),
              Text("MultiStats"),
              Text("Stats"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleStatsView(),
            MultiStatsView(),
            StatsView(),
          ],
        ),
      ),
    );
  }
}
