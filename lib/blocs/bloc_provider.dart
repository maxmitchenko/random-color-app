import 'package:flutter/material.dart';
import 'package:random_color_app/blocs/main_page_bloc.dart';

class MainPageBlocProvider extends InheritedWidget {
  final MainPageBloc bloc;
  const MainPageBlocProvider({
    super.key,
    required super.child,
    required this.bloc,
  });

  static MainPageBloc? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MainPageBlocProvider>()
        ?.bloc;
  }

  static MainPageBloc of(BuildContext context) {
    final MainPageBloc? result = maybeOf(context);
    assert(result != null, 'No BlocProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant MainPageBlocProvider oldWidget) {
    return oldWidget.bloc != bloc;
  }
}
