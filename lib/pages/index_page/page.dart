import 'package:fish_redux/fish_redux.dart';
import 'view.dart';
import 'reducer.dart';
import 'effect.dart';
import 'state.dart';

class IndexPage extends Page<IndexState, Map<String, dynamic>> {
  IndexPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
        );
}
