import 'package:bloc/bloc.dart';
import 'package:blog_app/domain/models/BlogModel.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc() : super(BlogInitial()) {
    on<FetchBlogs>((event, emit) {});
  }
}
