import 'package:fish_redux/fish_redux.dart';

class GlobalStoreState implements Cloneable<GlobalStoreState> {

  @override
  GlobalStoreState clone() {
    return GlobalStoreState();
  }
}

GlobalStoreState initState(Map<String, dynamic> args) {
  return GlobalStoreState();
}
