import 'package:blog_app/application/bloc/blog/blog_bloc.dart';
import 'package:blog_app/application/bloc/connectivity/connectivity_bloc.dart';
import 'package:blog_app/infrastructure/repository/connectivity_service.dart';
import 'package:blog_app/presentation/Widgets/AppBarTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const AppBarTitle(),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: context.watch<ConnectivityBloc>().state
                      is ConnectivityConnected
                  ? Colors.green
                  : Colors.red,
              size: 30,
            ),
            onPressed: () {
              // getBlogsDataLocal();
              print(ConnectivityService.instance.isOnline);
            },
          )
        ],
        backgroundColor: Colors.grey[850],
      ),
      body: BlocBuilder<BlogBloc, BlogState>(builder: (context, state) {
        if (state is BlogLoad) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BlogDone) {
          return ListView.builder(
              itemCount: state.blogs.blogs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                    state.blogs.blogs[index].imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset("assets/images/img_place.jpeg"),
                  ),
                  title: Text(state.blogs.blogs[index].title),
                );
              });
        } else {
          return const Center(
            child: Text("No data"),
          );
        }
      }),
    );
  }
}
