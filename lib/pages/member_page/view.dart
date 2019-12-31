import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'state.dart';

Widget memberBuildView(
    MemberState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text('memberPage'),
    ),
    body: Center(
      child: Text('memberPage'),
    ),
  );
}
