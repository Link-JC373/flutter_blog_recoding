import 'package:fish_redux/fish_redux.dart';
import 'view.dart';
import 'reducer.dart';
import 'effect.dart';
import 'state.dart';

class MemberPage extends Page<MemberState, Map<String, dynamic>> {
  MemberPage()
      : super(
          initState: initState,
          // effect: buildEffect(),
          // reducer: buildReducer(),
          view: memberBuildView,
        );
}
