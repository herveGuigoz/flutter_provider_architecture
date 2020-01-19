import '../service/common/base_service.dart';
import '../domain/entities/user.dart';
import 'common/input_parser.dart';
import 'interfaces/i_api.dart';

// ----------------------------------------------------------------------------
// LoginService states
// ----------------------------------------------------------------------------
enum LoginServiceState { INITIAL, LOADING, SUCCES, FAILURE }

// ----------------------------------------------------------------------------
// LoginService class
// ----------------------------------------------------------------------------

/// LoginService is responsible for fetching for user form input id
/// and caching the obtained user in memory (the getter user).
class LoginService extends BaseService<LoginServiceState> {
  LoginService({
    IApi api,
  }) : _api = api;

  IApi _api;
  User _fetchedUser;
  dynamic _error;

  User get user => _fetchedUser;
  dynamic get error => _error;

  @override
  get initialState => LoginServiceState.INITIAL;

  Future<bool> login(String userIdText) async {
    setState(LoginServiceState.LOADING);

    try {
      // Delegate the input parsing and validation
      var userId = InputParser.parse(userIdText);

      _fetchedUser = await _api.getUserProfile(userId);

      setState(LoginServiceState.SUCCES);
      return true;
    } catch (e) {
      _error = e;
      setState(LoginServiceState.FAILURE);
      return false;
    }

    // // TODO1 : throw unhandled exception
    // throw Exception();

    //TODO2: Instantiate a value object in a bad state.
    // Comment(
    //   id: 1,
    //   email: Email('email.com'), //Bad email
    //   name: 'Joe',
    //   body: 'comment',
    //   postId: 2,
    // );

    //TODO3: try to persist an entity is bad state.
    //   Comment(
    //     id: 1,
    //     email: Email('email@m.com'), //Bad email
    //     name: 'Joe',
    //     body: 'comment',
    //     postId: 2,
    //   )
    //     ..postId = null
    //     ..toJson();
  }
}
