import 'package:fish_redux/fish_redux.dart';

class SignUpState implements Cloneable<SignUpState> {

  @override
  SignUpState clone() {
    return SignUpState();
  }
}

SignUpState initState(Map<String, dynamic> args) {
  return SignUpState();
}
