import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_demo/blocs/tab1_bloc.dart';

class Tab1 extends StatefulWidget {
  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    print('build Tab1');
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab1'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
              child: Text('Get Todo'),
              onPressed: () {
                Provider.of<Tab1Bloc>(context, listen: false).getTodoData();
              }),
          Divider(),
          Consumer<Tab1Bloc>(builder: (context, bloc, child) {
            var value = 'No data';
            if (bloc.loading) {
              value = 'Loading...';
            } else {
              if (bloc.todoModel != null) {
                value = bloc.todoModel.toString();
              }
            }
            return Text(value);
          }),
        ],
      ),
    );
  }
}
