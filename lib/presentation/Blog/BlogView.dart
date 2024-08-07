import 'package:blog_app/core/constants.dart';
import 'package:blog_app/domain/models/BlogModel.dart';
import 'package:blog_app/presentation/Widgets/BlogView_Bottom.dart';
import 'package:blog_app/presentation/Widgets/RoundBtn.dart';
import 'package:flutter/material.dart';

class BlogviewPage extends StatelessWidget {
  final Blog blog;
  const BlogviewPage({required this.blog, super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isDarkMode = ValueNotifier(false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Image.network(
              blog.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Image.asset("assets/images/img_place.jpeg"),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .32,
            left: 0,
            right: 0,
            bottom: 0,
            child: ValueListenableBuilder(
                valueListenable: isDarkMode,
                builder: (context, bool value, child) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        color: value ? Colors.black : Colors.white),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "This is a dummy article of title: ${blog.title} $demoArticle",
                            style: TextStyle(
                                color: value ? Colors.white : Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          BlogViewBottm(
            blog: blog,
          ),
          Positioned(
            right: 15,
            top: 25,
            child: GestureDetector(
                onTap: () {
                  isDarkMode.value = !isDarkMode.value;
                },
                child: const RoundBtn(icon: Icons.remove_red_eye)),
          )
        ],
      ),
    );
  }
}
