import 'package:fish_redux/fish_redux.dart';

class MemberState implements Cloneable<MemberState> {
  @override
  MemberState clone() {
    return MemberState();
  }
}

MemberState initState(Map<String, dynamic> args) {
  return MemberState();
}
