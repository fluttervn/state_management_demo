import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/tab1_bloc.dart';
import 'blocs/tab2_bloc.dart';
import 'blocs/tab3_bloc.dart';
import 'tab_container.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => Tab1Bloc()),
        ChangeNotifierProvider(builder: (_) => Tab2Bloc()),
        Provider(builder: (_) => Tab3Bloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TabContainer(),
      ),
    );
  }
}
