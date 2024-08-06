part of 'blog_bloc.dart';

class BlogState {}

class BlogInitial extends BlogState {}

class BlogLoad extends BlogState {}

class BlogDone extends BlogState {
  BlogModel blogs;
  BlogDone(this.blogs);
}

class BlogError extends BlogState {}
