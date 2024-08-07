import 'package:blog_app/core/constants.dart';
import 'package:blog_app/domain/models/BlogModel.dart';
import 'package:blog_app/infrastructure/repository/hive_repo.dart';
import 'package:blog_app/presentation/Widgets/ListenBtn.dart';
import 'package:blog_app/presentation/Widgets/Round_FavBtn.dart';
import 'package:blog_app/presentation/Widgets/ToastMsg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class BlogViewBottm extends StatefulWidget {
  final Blog blog;
  const BlogViewBottm({required this.blog, super.key});

  @override
  State<BlogViewBottm> createState() => _BlogViewBottmState();
}

class _BlogViewBottmState extends State<BlogViewBottm> {
  bool isFavAdded = false;
  bool isSpeaking = false;
  FlutterTts? flutterTts;

  @override
  void initState() {
    super.initState();
    isFavAdded = checkFavourite(widget.blog.id);
    flutterTts = FlutterTts();
    flutterTts!.setCompletionHandler(() {
      setState(() {
        isSpeaking = false;
      });
    });
    setState(() {});
  }

  @override
  void dispose() {
    flutterTts!.stop();
    super.dispose();
  }

  Future textToSpeech(String text) async {
    await flutterTts!.setLanguage("en-US");
    await flutterTts!.setPitch(1.0);
    await flutterTts!.speak(text);
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
              child: RoundBtn(
                icon: isFavAdded ? Icons.favorite : Icons.favorite_border,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (isSpeaking) {
                  flutterTts!.pause();
                  isSpeaking = !isSpeaking;
                } else {
                  textToSpeech(
                      "This is a dummy article of title: ${widget.blog.title} $demoArticle");
                  isSpeaking = !isSpeaking;
                }
                setState(() {});
              },
              child: ListenBtn(
                btnText: isSpeaking ? "Pause" : "Listen",
                icon: isSpeaking ? Icons.pause : Icons.play_arrow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
