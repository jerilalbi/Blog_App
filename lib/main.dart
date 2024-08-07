import 'package:blog_app/application/bloc/bloc_providers.dart';
import 'package:blog_app/infrastructure/data_sources/Hive_DataSource.dart';
import 'package:blog_app/presentation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  final hiveDataSource = HiveDatasource();
  await hiveDataSource.initHive();
  runApp(MultiBlocProvider(providers: blocProviders, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subspace Blogs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.home,
      routes: AppRouter.routes,
    );
  }
}
