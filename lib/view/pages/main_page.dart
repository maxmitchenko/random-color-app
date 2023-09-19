import 'package:flutter/material.dart';
import 'package:random_color_app/blocs/bloc_provider.dart';
import 'package:random_color_app/blocs/main_page_bloc.dart';
import 'package:random_color_app/localization/localization_manager.dart';
import 'package:random_color_app/utils/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late MainPageBloc _bloc;

  @override
  void didChangeDependencies() {
    _bloc = MainPageBlocProvider.of(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Color>(
      stream: _bloc.colorStream,
      builder: (innerContext, snapshot) {
        Color? backgroundColor;
        if (!snapshot.hasData || snapshot.data == null) {
          backgroundColor = defaultBackgroundColor;
        } else {
          backgroundColor = snapshot.data;
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              LocalizationManager.getTitle(),
            ),
          ),
          backgroundColor: backgroundColor,
          body: Center(
            child: ElevatedButton(
              onPressed: () => _bloc.changeColor(),
              child: Text(
                LocalizationManager.getButtonText(),
              ),
            ),
          ),
        );
      },
    );
  }
}
