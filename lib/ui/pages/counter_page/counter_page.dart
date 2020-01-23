import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base_view.dart';
import '../../../service/counter_service.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterService(),
      child: _CounterPageBody(),
    );
  }
}

class _CounterPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<CounterService>(
      builder: (context, service, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${service.state}',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => service.incrementCounter(),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
