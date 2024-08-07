import 'package:blog_app/application/bloc/blog/blog_bloc.dart';
import 'package:blog_app/application/bloc/connectivity/connectivity_bloc.dart';
import 'package:blog_app/core/colors.dart';
import 'package:blog_app/presentation/Widgets/BlogTile.dart';
import 'package:blog_app/presentation/Widgets/OfflineMode_Tag.dart';
import 'package:blog_app/presentation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.favouritePage);
              },
            ),
          ],
          backgroundColor: primaryColor,
        ),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              padding: const EdgeInsets.all(70),
              color: primaryColor,
              child: SvgPicture.asset(
                'assets/logo/logo.svg',
              ),
            ),
            context.read<ConnectivityBloc>().state is ConnectivityDisconnected
                ? const Align(
                    alignment: Alignment.topRight,
                    child: OfflineModeTag(),
                  )
                : const SizedBox(
                    height: 0,
                  ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(top: 20),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .25),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white),
              child:
                  BlocBuilder<BlogBloc, BlogState>(builder: (context, state) {
                if (state is BlogLoad) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is BlogDone) {
                  return ListView.builder(
                      itemCount: state.blogs.blogs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, AppRouter.blogPage,
                              arguments: state.blogs.blogs[index]),
                          child: BlogTile(
                            title: state.blogs.blogs[index].title,
                            imgUrl: state.blogs.blogs[index].imageUrl,
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: Text("No data"),
                  );
                }
              }),
            )
          ],
        ));
  }
}
