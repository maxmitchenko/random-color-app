import 'package:flutter/material.dart';
import 'package:random_color_app/blocs/main_page_bloc.dart';
import 'package:random_color_app/blocs/main_page_bloc_provider.dart';
import 'package:random_color_app/localization/localization_manager.dart';
import 'package:random_color_app/utils/colors.dart';
import 'package:random_color_app/utils/extensions/text_style_theme_extension.dart';

/// The main and actually the only page in the app.
/// Contains a simple text and a colorful background that changes its color
/// when user clicks on a screen.
class MainPage extends StatefulWidget {
  // ignore: public_member_api_docs
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainPageBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Color>(
      stream: _bloc?.colorStream,
      builder: (innerContext, snapshot) {
        Color? backgroundColor;
        backgroundColor = !snapshot.hasData || snapshot.data == null
            ? defaultBackgroundColor
            : snapshot.data;

        return Scaffold(
          backgroundColor: backgroundColor,
          body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => _bloc?.changeColor(),
            child: Center(
              child: Text(
                LocalizationManager.getHelloText(),
                style: Theme.of(context).textTheme.baseTextStyle,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    _bloc = MainPageBlocProvider.of(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bloc?.close();
    super.dispose();
  }
}
