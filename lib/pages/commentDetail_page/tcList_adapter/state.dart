import 'package:fish_redux/fish_redux.dart';

class TcListState implements Cloneable<TcListState> {

  @override
  TcListState clone() {
    return TcListState();
  }
}

TcListState initState(Map<String, dynamic> args) {
  return TcListState();
}
