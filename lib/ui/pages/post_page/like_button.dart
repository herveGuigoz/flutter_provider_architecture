import 'package:clean_architecture/ui/base_view.dart';
import 'package:flutter/material.dart';

import '../../../service/posts_service.dart';

class LikeButton extends StatelessWidget {
  LikeButton({
    @required this.postId,
  });
  final int postId;

  @override
  Widget build(BuildContext context) {
    return BaseView<PostsService>(builder: (context, service, child) {
      return Row(
        children: <Widget>[
          Text('${service.getPostLikes(postId)}'),
          MaterialButton(
            color: Colors.white,
            child: Icon(Icons.thumb_up),
            onPressed: () {
              //NOTE3: incrementLikes is a synchronous method so we do not expect errors
              service.incrementLikes(postId);
            },
          )
        ],
      );
    });
  }
}
/*
class LikeButton extends StatelessWidget {
  LikeButton({
    @required this.postId,
  });
  final int postId;

  @override
  Widget build(BuildContext context) {
    //NOTE1: get reactiveModel of PostsService
    final postsServiceRM = Injector.getAsReactive<PostsService>();

    return Row(
      children: <Widget>[
        StateBuilder(
          models: [postsServiceRM],
          builder: (_, __) {
            //NOTE2: Optimizing rebuild. Only Text is rebuild
            return Text('Likes ${postsServiceRM.state.getPostLikes(postId)}');
          },
        ),
        MaterialButton(
          color: Colors.white,
          child: Icon(Icons.thumb_up),
          onPressed: () {
            //NOTE3: incrementLikes is a synchronous method so we do not expect errors
            postsServiceRM.setState((state) => state.incrementLikes(postId));
          },
        )
      ],
    );
  }
}
*/
