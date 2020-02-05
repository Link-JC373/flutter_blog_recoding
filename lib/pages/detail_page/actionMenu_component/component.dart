import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ActionMenuComponent extends Component<ActionMenuState> {
  ActionMenuComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ActionMenuState>(
                adapter: null,
                slots: <String, Dependent<ActionMenuState>>{
                }),);

}
