import 'package:clean_architecture/ui/base_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../service/login_service.dart';
import '../../exceptions/error_handler.dart';
import '../../common/app_colors.dart';
import '../../widgets/login_header.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: _LoginBody(),
    );
  }
}

class _LoginBody extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _service = Provider.of<LoginService>(context, listen: false);
    return BaseView<LoginService>(
      // Disposing TextEditingController to free resources.
      service: _service,
      dispose: () => controller.dispose(),
      builder: (context, service, child) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginHeader(
              controller: controller,
            ),
            service.state == LoginServiceState.LOADING
                ? CircularProgressIndicator()
                : FlatButton(
                    color: Colors.white,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      bool _isLoginSucceeded =
                          await service.login(controller.text);

                      if (_isLoginSucceeded) {
                        Navigator.pushReplacementNamed(context, '/');
                      }
                      if (service.state == LoginServiceState.FAILURE) {
                        // ErrorHandler is a class method used to center error handling.
                        ErrorHandler.showSnackBar(context, service.error);
                      }
                    },
                  )
          ],
        );
      },
    );
  }
}
