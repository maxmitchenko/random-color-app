import 'package:flutter/material.dart';
import 'package:random_color_app/blocs/bloc_provider.dart';
import 'package:random_color_app/blocs/main_page_bloc.dart';
import 'package:random_color_app/localization/localization_manager.dart';
import 'package:random_color_app/repository/base_color_repository.dart';
import 'package:random_color_app/repository/color_repository_impl.dart';
import 'package:random_color_app/view/pages/main_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late BaseColorRepository _colorRepository;

  @override
  void initState() {
    _colorRepository = ColorRepositoryImpl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainPageBlocProvider(
      bloc: MainPageBloc(
        _colorRepository,
      ),
      child: MaterialApp(
        title: LocalizationManager.getTitle(),
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
