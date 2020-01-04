import 'package:blog_flutter/custom_widgets/state_with_ticker_provider.dart';
import 'package:fish_redux/fish_redux.dart';
import 'components/list_component/component.dart';
import 'view.dart';
import 'reducer.dart';
import 'effect.dart';
import 'state.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  @override
  StateWithTickerProvider createState() => StateWithTickerProvider();
  HomePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: homeBuildView,
            dependencies: Dependencies<HomeState>(
                adapter: null,
                slots: <String, Dependent<HomeState>>{
                  'list0': ListFiConnector() + ListComponent(),
                  'list1': ListSeConnector() + ListComponent(),
                  'list2': ListThConnector() + ListComponent(),
                  'list3': ListFoConnector() + ListComponent()
                }));
}
