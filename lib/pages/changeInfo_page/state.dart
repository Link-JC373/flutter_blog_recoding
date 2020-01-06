import 'package:fish_redux/fish_redux.dart';

class ChangeInfoState implements Cloneable<ChangeInfoState> {

  @override
  ChangeInfoState clone() {
    return ChangeInfoState();
  }
}

ChangeInfoState initState(Map<String, dynamic> args) {
  return ChangeInfoState();
}
