import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MemberPage extends Page<MemberState, Map<String, dynamic>> {
  MemberPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<MemberState>(
              adapter: null, slots: <String, Dependent<MemberState>>{}),
          middleware: <Middleware<MemberState>>[],
        );
}
