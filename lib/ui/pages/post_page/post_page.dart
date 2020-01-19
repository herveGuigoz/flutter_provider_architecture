import 'package:flutter/material.dart';

import '../../../service/common/locator.dart';
import '../../../service/login_service.dart';

import '../../../domain/entities/post.dart';

import '../../common/app_colors.dart';
import '../../common/text_styles.dart';
import '../../common/ui_helpers.dart';

import 'comments.dart';
import 'like_button.dart';

class PostPage extends StatelessWidget {
  PostPage({this.post});
  final Post post;
  //NOTE1: Get the logged user
  final user = locator<LoginService>().user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge(),
            Text(post.title, style: headerStyle),
            // Display user name
            Text(
              'by ${user.name}',
              style: TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium(),
            Text(post.body),
            // like button widget (like_button.dart)
            LikeButton(
              postId: post.id,
            ),
            // Comments widget (comments.dart)
            Comments(post.id)
          ],
        ),
      ),
    );
  }
}
