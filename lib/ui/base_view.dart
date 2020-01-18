import 'package:clean_architecture/infrastructure/locator.dart';
import 'package:clean_architecture/service/abstract/base_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseService> extends StatefulWidget {
  final Widget Function(BuildContext context, T service, Widget child) builder;
  final Function(T) onServiceReady;

  BaseView({this.builder, this.onServiceReady});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseService> extends State<BaseView<T>> {
  T service = locator<T>();

  @override
  void initState() {
    if (widget.onServiceReady != null) {
      widget.onServiceReady(service);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: service,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
