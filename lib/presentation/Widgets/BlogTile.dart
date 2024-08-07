import 'package:blog_app/core/colors.dart';
import 'package:flutter/material.dart';

class BlogTile extends StatelessWidget {
  final String title;
  final String imgUrl;
  const BlogTile({required this.title, required this.imgUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: creamColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Colors.grey, offset: Offset(1, 2), blurRadius: 2)
          ]),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset("assets/images/img_place.jpeg"),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
