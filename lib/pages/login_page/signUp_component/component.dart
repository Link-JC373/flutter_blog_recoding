import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SignUpComponent extends Component<SignUpState> {
  SignUpComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SignUpState>(
                adapter: null,
                slots: <String, Dependent<SignUpState>>{
                }),);

}
