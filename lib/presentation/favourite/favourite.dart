import 'package:blog_app/domain/models/BlogModel.dart';
import 'package:blog_app/hive_boxes/fav_blog_box.dart';
import 'package:blog_app/infrastructure/repository/hive_repo.dart';
import 'package:blog_app/presentation/Widgets/BlogTile.dart';
import 'package:blog_app/presentation/routes.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Favourite",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
        ),
        body: FutureBuilder<List<FavBlogsBox>>(
            future: getFavBlogs(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No Favourite Blogs'));
              } else {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.pushReplacementNamed(
                              context, AppRouter.blogPage,
                              arguments: Blog(
                                  id: snapshot.data![index].id!,
                                  imageUrl: snapshot.data![index].imgUrl!,
                                  title: snapshot.data![index].title!)),
                          child: BlogTile(
                              title: snapshot.data![index].title!,
                              imgUrl: snapshot.data![index].imgUrl!),
                        );
                      }),
                );
              }
            }));
  }
}
