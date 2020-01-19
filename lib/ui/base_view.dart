import 'package:clean_architecture/infrastructure/locator.dart';
import 'package:clean_architecture/service/abstract/base_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  // Either our factory or singleton is created here.
  T service = locator<T>();

  @override
  void initState() {
    if (widget.onServiceReady != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onServiceReady(service);
      });
      // widget.onServiceReady(service);
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
          .addPostFrameCallback((_) => widget.onAfterBuild(context, service));
    }
    return ChangeNotifierProvider.value(
      value: service,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
