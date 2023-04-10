import 'package:flutter/material.dart';
import 'package:instagramclone_flutter/state/posts/models/post.dart';
import 'package:instagramclone_flutter/views/components/post/post_thumbnail_view.dart';
import 'package:instagramclone_flutter/views/post_comments/post_comments_view.dart';

class PostsGridView extends StatelessWidget {
  final Iterable<Post> posts;
  const PostsGridView({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts.elementAt(index);
        return PostThumbnailView(
          post: post,
          onTapped: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PostCommentsView(
                  postId: post.postId,
                ),
              ),
            );
            // TODO: remove this code before nagvigation

            // TODO: navigate to post detailed view
          },
        );
      },
    );
  }
}
