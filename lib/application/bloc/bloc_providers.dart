import 'package:blog_app/application/bloc/blog/blog_bloc.dart';
import 'package:blog_app/application/bloc/connectivity/connectivity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final blocProviders = [
  BlocProvider<ConnectivityBloc>(
      create: (BuildContext context) =>
          ConnectivityBloc()..add(CheckConnectivity())),
  BlocProvider<BlogBloc>(
      create: (BuildContext context) => BlogBloc()..add(FetchBlogs())),
];
