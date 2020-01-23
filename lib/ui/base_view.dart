import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/common/base_service.dart';

class BaseView<T extends BaseService> extends StatefulWidget {
  final Widget Function(BuildContext context, T service, Widget child) builder;
  final Function(T service) onServiceReady;
  final Function(BuildContext context, T service) onAfterBuild;
  final Function deactivate;
  final Function dispose;

  BaseView({
    @required this.builder,
    this.onServiceReady,
    this.onAfterBuild,
    this.deactivate,
    this.dispose,
  });

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseService> extends State<BaseView<T>> {
  ChangeNotifier _service;

  @override
  void initState() {
    _service = Provider.of<T>(context, listen: false);
    if (widget.onServiceReady != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onServiceReady(_service);
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
    if (widget.onAfterBuild != null) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => widget.onAfterBuild(context, _service));
    }
    return Consumer<T>(builder: widget.builder);
  }
}
