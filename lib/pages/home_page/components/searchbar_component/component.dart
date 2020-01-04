import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SearchbarComponentComponent extends Component<SearchbarComponentState> {
  SearchbarComponentComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SearchbarComponentState>(
                adapter: null,
                slots: <String, Dependent<SearchbarComponentState>>{
                }),);

}
