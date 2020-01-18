import 'package:fish_redux/fish_redux.dart';

class ComListState implements Cloneable<ComListState> {

  @override
  ComListState clone() {
    return ComListState();
  }
}

ComListState initState(Map<String, dynamic> args) {
  return ComListState();
}
