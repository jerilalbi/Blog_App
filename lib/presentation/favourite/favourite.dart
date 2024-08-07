import 'package:blog_app/hive_boxes/fav_blog_box.dart';
import 'package:blog_app/infrastructure/repository/hive_repo.dart';
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
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(
                          snapshot.data![index].imgUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset("assets/images/img_place.jpeg"),
                        ),
                        title: Text(snapshot.data![index].title!),
                      );
                    });
              }
            }));
  }
}
