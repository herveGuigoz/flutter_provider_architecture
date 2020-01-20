import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/comment.dart';
import '../../../service/comments_service.dart';
import '../../base_view.dart';
import '../../exceptions/error_handler.dart';
import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';

class Comments extends StatelessWidget {
  final int postId;
  Comments(this.postId);

  @override
  Widget build(BuildContext context) {
    final _service = Provider.of<CommentsService>(context, listen: false);
    return BaseView<CommentsService>(
      service: _service,
      onServiceReady: (service) => _service.fetchComments(postId),
      //onAfterBuild: (context, service) => service.fetchComments(postId),
      builder: (context, service, child) {
        if (service.state == CommentsServiceState.INITIAL) {
          return Center(child: CircularProgressIndicator());
        }
        if (service.state == CommentsServiceState.FAILURE) {
          // Display empty container on error. An AlertDialog should be displayed
          ErrorHandler.showErrorDialog(context, service.error);
          return Container();
        }
        return Expanded(
          child: ListView(
            children: service.comments
                .map((comment) => CommentItem(comment))
                .toList(),
          ),
        );
      },
    );
  }
}

/// Renders a single comment given a comment model
class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: commentColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          UIHelper.verticalSpaceSmall(),
          Text(comment.body),
        ],
      ),
    );
  }
}
