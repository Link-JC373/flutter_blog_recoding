import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AddFavPage extends Page<AddFavState, Map<String, dynamic>> {
  AddFavPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AddFavState>(
                adapter: null,
                slots: <String, Dependent<AddFavState>>{
                }),
            middleware: <Middleware<AddFavState>>[
            ],);

}
