import 'package:flutter/widgets.dart';

abstract class BaseService<State> extends ChangeNotifier {
  State _state;

  State get initialState;

  State get state => _state ?? initialState;

  void setState(State state) {
    print('state ==> ${this.state}, next state ==> $state');
    _state = state;
    notifyListeners();
  }
}
