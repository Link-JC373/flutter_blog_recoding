import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ChangeInfoAction {
  action,
  initInfo,
  onChangeAvatar,
  changeAvatar,
  onChangeDisc,
  changeDisc,
  onChangeUserName,
  changeUserName,
  onChangeInfo,
}

class ChangeInfoActionCreator {
  static Action onAction() {
    return const Action(ChangeInfoAction.action);
  }

  static Action initInfo(var info) {
    return Action(ChangeInfoAction.initInfo, payload: info);
  }

  static Action onChangeAvatar() {
    return Action(ChangeInfoAction.onChangeAvatar);
  }

  static Action onChangeDisc() {
    return Action(ChangeInfoAction.onChangeDisc);
  }

  static Action onChangeUserName() {
    return Action(ChangeInfoAction.onChangeUserName);
  }

  static Action onChangeInfo() {
    return Action(ChangeInfoAction.onChangeInfo);
  }

  static Action changeAvatar(String imgUrl) {
    return Action(ChangeInfoAction.changeAvatar, payload: imgUrl);
  }

  static Action changeDisc(String disc) {
    return Action(ChangeInfoAction.changeDisc, payload: disc);
  }

  static Action changeUserName(String userName) {
    return Action(ChangeInfoAction.changeUserName, payload: userName);
  }
}
