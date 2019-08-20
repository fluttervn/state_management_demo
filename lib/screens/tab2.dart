import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_demo/blocs/tab2_bloc.dart';

class Tab2 extends StatefulWidget {
  @override
  _Tab2State createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  @override
  Widget build(BuildContext context) {
    print('build Tab2');
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab2'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
              child: Text('Get Todo'),
              onPressed: () {
                Provider.of<Tab2Bloc>(context, listen: false).getTodoData();
              }),
          Divider(),
          TodoWidget(),
          RaisedButton(
              child: Text('Increase count'),
              onPressed: () {
                Provider.of<Tab2Bloc>(context, listen: false).increaseCount();
              }),
          CounterWidget(),
        ],
      ),
    );
  }
}

class TodoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build TodoWidget');
    var bloc = Provider.of<Tab2Bloc>(context);
    var value = 'No data';
    if (bloc.loading) {
      value = 'Loading...';
    } else {
      if (bloc.todoModel != null) {
        value = bloc.todoModel.toString();
      }
    }
    return Text(value);
  }
}

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build CounterWidget');
    return Text('${Provider.of<Tab2Bloc>(context).count}');
  }
}
