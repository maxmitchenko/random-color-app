import 'package:flutter/material.dart';
import 'package:random_color_app/blocs/main_page_bloc.dart';

/// [MainPageBlocProvider] is used to provide [MainPageBloc]
/// to the children in a widget tree
class MainPageBlocProvider extends InheritedWidget {
  /// The only argument that should be passed
  final MainPageBloc bloc;

  /// Constructor contains [bloc], [child] and [key].
  const MainPageBlocProvider({
    required this.bloc,
    required super.child,
    super.key,
  });

  static MainPageBloc? _maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MainPageBlocProvider>()
        ?.bloc;
  }

  /// This method returns the nearest [MainPageBloc] instance in a widget tree.
  static MainPageBloc of(BuildContext context) {
    final MainPageBloc? result = _maybeOf(context);
    assert(result != null, 'No BlocProvider found in context');

    return result!;
  }

  @override
  bool updateShouldNotify(covariant MainPageBlocProvider oldWidget) {
    return oldWidget.bloc != bloc;
  }
}
