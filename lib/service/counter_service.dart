import './abstract/base_service.dart';

class CounterService extends BaseService<int> {
  @override
  int get initialState => 0;

  void incrementCounter() {
    int counter = state;
    counter++;
    setState(counter);
  }
}