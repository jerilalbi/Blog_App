import 'package:bloc/bloc.dart';
import 'package:blog_app/domain/models/BlogModel.dart';
import 'package:blog_app/infrastructure/repository/blog_repo.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc() : super(BlogInitial()) {
    on<FetchBlogs>((event, emit) async {
      emit(BlogLoad());
      try {
        BlogModel blog = await fetchBlogData();
        emit(BlogDone(blog));
      } catch (e) {
        emit(BlogError());
      }
    });
  }
}
