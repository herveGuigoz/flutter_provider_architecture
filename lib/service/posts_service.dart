import 'package:clean_architecture/data_source/api.dart';
import 'package:clean_architecture/service/abstract/base_service.dart';

import '../domain/entities/post.dart';
import 'interfaces/i_api.dart';

// ----------------------------------------------------------------------------
// PostsService states
// ----------------------------------------------------------------------------
enum PostsServiceState { INITIAL, LOADED, FAILURE }

// ----------------------------------------------------------------------------
// PostsService class
// ----------------------------------------------------------------------------
// use case : Fetch posts by user ID, cache the obtained post list in memory
// and encapsulation of its processing
class PostsService extends BaseService<PostsServiceState> {
  PostsService();
  IApi _api = Api();
  List<Post> _posts = [];
  List<Post> get posts => _posts;

  dynamic _error;
  dynamic get error => _error;

  @override
  PostsServiceState get initialState => PostsServiceState.INITIAL;

  void getPostsForUser(int userId) async {
    try {
      _posts = await _api.getPostsForUser(userId);
      setState(PostsServiceState.LOADED);
    } catch (e) {
      _error = e;
      setState(PostsServiceState.FAILURE);
    }
  }

  // Encapsulation of the logic of getting post likes.
  int getPostLikes(int postId) {
    return _posts.firstWhere((post) => post.id == postId).likes;
  }

  // Encapsulation of the logic of incrementing the like of a post.
  void incrementLikes(int postId) {
    _posts.firstWhere((post) => post.id == postId).incrementLikes();
    notifyListeners();
  }
}
