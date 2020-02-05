import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MoreComponent extends Component<MoreState> {
  MoreComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MoreState>(
                adapter: null,
                slots: <String, Dependent<MoreState>>{
                }),);

}
