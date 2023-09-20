import 'package:flutter/material.dart';
import 'package:random_color_app/blocs/main_page_bloc.dart';
import 'package:random_color_app/blocs/main_page_bloc_provider.dart';
import 'package:random_color_app/localization/localization_manager.dart';
import 'package:random_color_app/repository/base_color_repository.dart';
import 'package:random_color_app/repository/color_repository_impl.dart';
import 'package:random_color_app/view/pages/main_page.dart';

/// The root widget of the app
class MyApp extends StatefulWidget {
  // ignore: public_member_api_docs
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final BaseColorRepository _colorRepository = ColorRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return MainPageBlocProvider(
      bloc: MainPageBloc(
        _colorRepository,
      ),
      child: MaterialApp(
        title: LocalizationManager.getTitleText(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        home: const MainPage(),
      ),
    );
  }
}
