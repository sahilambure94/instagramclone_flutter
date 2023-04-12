import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagramclone_flutter/state/posts/providers/posts_by_search_term_provider.dart';
import 'package:instagramclone_flutter/views/components/animations/data_not_found_animation_view.dart';
import 'package:instagramclone_flutter/views/components/animations/empty_contents_with_texts_animation_view.dart';
import 'package:instagramclone_flutter/views/components/animations/error_animation_view.dart';
import 'package:instagramclone_flutter/views/components/animations/loading_animation_view.dart';
import 'package:instagramclone_flutter/views/components/post/posts_grid_view.dart';
import 'package:instagramclone_flutter/views/components/post/posts_sliver_grid_view.dart';
import 'package:instagramclone_flutter/views/constants/strings.dart';

class SearchGridView extends ConsumerWidget {
  final String searchTerm;
  const SearchGridView({
    super.key,
    required this.searchTerm,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (searchTerm.isEmpty) {
      return const SliverToBoxAdapter(
        child: EmptyContentsWithTextAnimationView(
          text: Strings.enterYourSearchTerm,
        ),
      );
    }
    final posts = ref.watch(
      postsBySearchTermProvider(
        searchTerm,
      ),
    );

    return posts.when(
      data: (posts) {
        if (posts.isEmpty) {
          return const SliverToBoxAdapter(
            child: DataNotFoundAnimationView(),
          );
        } else {
          return PostsSliverGridView(
            posts: posts,
          );
        }
      },
      loading: () {
        return const SliverToBoxAdapter(
          child: LoadingAnimationView(),
        );
      },
      error: (error, stackTrace) {
        return const SliverToBoxAdapter(
          child: ErrorAnimationView(),
        );
      },
    );
  }
}
