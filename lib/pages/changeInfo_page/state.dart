import 'dart:io';

import 'package:blog_flutter/global_store/state.dart';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class ChangeInfoState implements GlobalBaseState, Cloneable<ChangeInfoState> {
  File imageFile;
  TextEditingController textNameCT = new TextEditingController();
  TextEditingController textDiscCT = new TextEditingController();
  String imgUrl = "";
  String userName = "";
  String disc = "";
  int id = 0;
  @override
  ChangeInfoState clone() {
    return ChangeInfoState()
      ..imageFile = imageFile
      ..textDiscCT = textDiscCT
      ..textNameCT = textNameCT
      ..imgUrl = imgUrl
      ..userName = userName
      ..disc = disc
      ..id = id;
  }

  @override
  Color themeColor;

  @override
  var userInfo;
}

ChangeInfoState initState(Map<String, dynamic> args) {
  return ChangeInfoState();
}

// class ChangeUserNameCon extends ConnOp<ChangeInfoState, ChangeUserNameState> {
//   // ChangeAvatorState get(ChangeInfoState state) {
//   //   final ChangeAvatorState subState = ChangeAvatorState();
//   //   subState.
//   // }
//   @override
//   void set(ChangeInfoState state, ChangeUserNameState subState) {
//     state.userName = subState.userName;
//   }
// }
