import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/post.dart';
import '../providers/async_value.dart';
import '../providers/post_provider.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  1 - Get the post provider
    final PostProvider postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
            // 2- Fetch the posts
            onPressed: () => postProvider.fetchPosts(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      // 3 -  Display the posts
      body: Center(child: _buildBody(postProvider)),
    );
  }

  Widget _buildBody(PostProvider postProvider) {
    final postsValue = postProvider.postsValue;

    if (postsValue == null) {
      return const Text(
        'Tap refresh to display posts',
      ); // display an empty state
    }

    switch (postsValue.state) {
      case AsyncValueState.loading:
        return const CircularProgressIndicator(); // display a progress indicator

      case AsyncValueState.error:
        return Text('Error: ${postsValue.error}'); // display an error message

      case AsyncValueState.success:
        return ListView.builder(
          itemCount: postsValue.data!.length,
          itemBuilder: (context, index) {
            final post = postsValue.data![index];
            return PostCard(post: post);
          },
        ); // display the list of posts
    }
  }
}

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(post.title), subtitle: Text(post.description));
  }
}
