import 'package:clean_architecture/data_source/api.dart';
import 'package:clean_architecture/service/common/base_service.dart';

import '../domain/entities/comment.dart';
import 'interfaces/i_api.dart';

// ----------------------------------------------------------------------------
// CommentsServiceState states
// ----------------------------------------------------------------------------
enum CommentsServiceState { INITIAL, LOADED, FAILURE }

// ----------------------------------------------------------------------------
// CommentsService class
// ----------------------------------------------------------------------------
// use case : Fetch comments by post ID,
// cache the obtained comment list in memory
class CommentsService extends BaseService<CommentsServiceState> {
  CommentsService();
  IApi _api = Api();
  List<Comment> _comments;
  List<Comment> get comments => _comments;

  dynamic _error;
  dynamic get error => _error;

  @override
  CommentsServiceState get initialState => CommentsServiceState.INITIAL;

  Future<void> fetchComments(int postId) async {
    try {
      _comments = await _api.getCommentsForPost(postId);
      setState(CommentsServiceState.LOADED);
    } catch (e) {
      _error = e;
      setState(CommentsServiceState.FAILURE);
    }
  }

  @override
  void dispose() {
    print('CounterService disposed');
    super.dispose();
  }
}
