import 'package:fish_redux/fish_redux.dart';
import 'view.dart';
import 'reducer.dart';
import 'effect.dart';
import 'state.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          // reducer: buildReducer(),
          view: homeBuildView,
        );
}
