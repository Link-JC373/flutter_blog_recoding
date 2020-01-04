import 'package:blog_flutter/pages/home_page/state.dart';
import 'package:fish_redux/fish_redux.dart';

class ListComponentState implements Cloneable<ListComponentState> {
  int typeIndex;
  @override
  ListComponentState clone() {
    return ListComponentState()..typeIndex = typeIndex;
  }
}

ListComponentState initState(Map<String, dynamic> args) {
  return ListComponentState();
}
