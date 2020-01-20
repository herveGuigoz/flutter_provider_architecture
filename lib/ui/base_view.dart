import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/common/base_service.dart';

class BaseView<T extends BaseService> extends StatefulWidget {
  final ChangeNotifier service;
  final Widget Function(BuildContext context, T service, Widget child) builder;
  final Function(T service) onServiceReady;
  final Function(BuildContext context, T service) onAfterBuild;
  final Function deactivate;
  final Function dispose;

  BaseView({
    @required this.service,
    @required this.builder,
    this.onServiceReady,
    this.onAfterBuild,
    this.deactivate,
    this.dispose,
  });

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>(service);
}

class _BaseViewState<T extends BaseService> extends State<BaseView<T>> {
  _BaseViewState(this.service);
  final ChangeNotifier service;

  @override
  void initState() {
    if (widget.onServiceReady != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onServiceReady(service);
      });
    }
    super.initState();
  }

  @override
  void deactivate() {
    if (widget.deactivate != null) {
      widget.deactivate();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    if (widget.dispose != null) {
      widget.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('BASE_VIEW ===> $service BUILDED');
    if (widget.onAfterBuild != null) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => widget.onAfterBuild(context, service));
    }
    return Consumer<T>(builder: widget.builder);
  }
}
