part of 'blog_bloc.dart';

class BlogState {
  List<BlogModel> blogs = [];
  BlogState({required this.blogs});
}

final class BlogInitial extends BlogState {
  BlogInitial() : super(blogs: []);
}
