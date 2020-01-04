import 'package:fish_redux/fish_redux.dart';

class SearchbarComponentState implements Cloneable<SearchbarComponentState> {

  @override
  SearchbarComponentState clone() {
    return SearchbarComponentState();
  }
}

SearchbarComponentState initState(Map<String, dynamic> args) {
  return SearchbarComponentState();
}
