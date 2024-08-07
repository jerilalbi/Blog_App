import 'package:blog_app/domain/models/BlogModel.dart';
import 'package:blog_app/infrastructure/repository/hive_repo.dart';
import 'package:blog_app/presentation/Widgets/ListenBtn.dart';
import 'package:blog_app/presentation/Widgets/Round_FavBtn.dart';
import 'package:blog_app/presentation/Widgets/ToastMsg.dart';
import 'package:flutter/material.dart';

class BlogViewBottm extends StatefulWidget {
  final Blog blog;
  const BlogViewBottm({required this.blog, super.key});

  @override
  State<BlogViewBottm> createState() => _BlogViewBottmState();
}

class _BlogViewBottmState extends State<BlogViewBottm> {
  bool isFavAdded = false;

  @override
  void initState() {
    super.initState();
    isFavAdded = checkFavourite(widget.blog.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 40),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                if (isFavAdded) {
                  removeFromFav(widget.blog.id);
                  toastMsg("Removed from Favourite", Colors.red);
                  isFavAdded = !isFavAdded;
                } else {
                  addFavBlogs(widget.blog);
                  toastMsg("Added to Favourites", Colors.green);
                  isFavAdded = !isFavAdded;
                }
                setState(() {});
              },
              child: RoundFavBtn(
                icon: isFavAdded ? Icons.favorite : Icons.favorite_border,
              ),
            ),
            ListenBtn(
              btnText: "Listen",
              icon: Icons.play_arrow,
            ),
          ],
        ),
      ),
    );
  }
}
