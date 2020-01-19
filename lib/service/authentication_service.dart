import 'package:clean_architecture/service/common/base_service.dart';

// TODO: Use this service in main file as fisrt consumer.
// Ennum for state should be fine, for exemple purpose i let class style states.

// ----------------------------------------------------------------------------
// AuthenticationService states
// ----------------------------------------------------------------------------
abstract class AuthenticationServiceState {}

class AuthenticationUninitialized extends AuthenticationServiceState {}

class AuthenticationAuthenticated extends AuthenticationServiceState {}

class AuthenticationUnauthenticated extends AuthenticationServiceState {}

class AuthenticationLoading extends AuthenticationServiceState {
  @override
  String toString() => 'coucou';
}

// ----------------------------------------------------------------------------
// AuthenticationService class
// ----------------------------------------------------------------------------

class AuthenticationService extends BaseService<AuthenticationServiceState> {
  // AuthenticationService({IApi api}) : _api = api;
  AuthenticationService();

  String _token;

  String get token => _token;

  @override
  get initialState => AuthenticationUninitialized();

  void logIn(String token) {
    _token = token;
    setState(AuthenticationAuthenticated());
  }
}
