import 'package:blog_flutter/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    RegisterState state, Dispatch dispatch, ViewService viewService) {
  double headerHeight = Adapt.screenH() / 3;

  Widget _buildSubmit() {
    var submitWidth = CurvedAnimation(
      parent: state.submitAnimationController,
      curve: Interval(
        0.0,
        0.5,
        curve: Curves.ease,
      ),
    );
    var loadCurved = CurvedAnimation(
      parent: state.submitAnimationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.ease,
      ),
    );
    return new AnimatedBuilder(
      animation: state.submitAnimationController,
      builder: (ctx, w) {
        double buttonWidth = Adapt.screenW() * 0.8;
        return Container(
          margin: EdgeInsets.only(top: Adapt.px(60)),
          height: Adapt.px(100),
          child: Stack(
            children: <Widget>[
              Container(
                height: Adapt.px(100),
                width: Tween<double>(begin: buttonWidth, end: Adapt.px(100))
                    .animate(submitWidth)
                    .value,
                child: FlatButton(
                  color: Colors.blue[600],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Adapt.px(50))),
                  child: Text('注册',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Tween<double>(begin: Adapt.px(35), end: 0.0)
                              .animate(submitWidth)
                              .value)),
                  onPressed: () => dispatch(RegisterActionCreator.onRegister()),
                ),
              ),
              ScaleTransition(
                scale: Tween(begin: 0.0, end: 1.0).animate(loadCurved),
                child: Container(
                  width: Adapt.px(100),
                  height: Adapt.px(100),
                  padding: EdgeInsets.all(Adapt.px(20)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Adapt.px(50))),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildRegisterBody() {
    var cardCurve = CurvedAnimation(
      parent: state.animationController,
      curve: Interval(
        0,
        0.3,
        curve: Curves.ease,
      ),
    );
    var accountCurve = CurvedAnimation(
      parent: state.animationController,
      curve: Interval(
        0.2,
        0.4,
        curve: Curves.ease,
      ),
    );
    var passwordCurve = CurvedAnimation(
      parent: state.animationController,
      curve: Interval(
        0.3,
        0.5,
        curve: Curves.ease,
      ),
    );
    var checkPWCurve = CurvedAnimation(
      parent: state.animationController,
      curve: Interval(
        0.4,
        0.6,
        curve: Curves.ease,
      ),
    );
    var submitCurve = CurvedAnimation(
      parent: state.animationController,
      curve: Interval(
        0.5,
        0.7,
        curve: Curves.ease,
      ),
    );
    return Center(
      child: SlideTransition(
        position:
            Tween(begin: Offset(0, 1), end: Offset.zero).animate(cardCurve),
        child: Card(
          elevation: 10,
          child: Container(
            height: Adapt.screenH() * 2 / 3,
            width: Adapt.screenW() * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SlideTransition(
                  position: Tween(begin: Offset(0, 1), end: Offset.zero)
                      .animate(accountCurve),
                  child: FadeTransition(
                    opacity: Tween(begin: 0.0, end: 1.0).animate(accountCurve),
                    child: Padding(
                      padding: EdgeInsets.all(Adapt.px(40)),
                      child: TextField(
                        focusNode: state.accountFocusNode,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(fontSize: Adapt.px(35)),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            hintText: '账号',
                            hasFloatingPlaceholder: true,
                            filled: true,
                            prefixStyle: TextStyle(
                                color: Colors.black, fontSize: Adapt.px(35)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87))),
                        onChanged: (String t) =>
                            dispatch(RegisterActionCreator.accountChanged(t)),
                        onSubmitted: (s) {
                          state.accountFocusNode.nextFocus();
                        },
                      ),
                    ),
                  ),
                ),
                SlideTransition(
                  position: Tween(begin: Offset(0, 1), end: Offset.zero)
                      .animate(passwordCurve),
                  child: FadeTransition(
                    opacity: Tween(begin: 0.0, end: 1.0).animate(passwordCurve),
                    child: Padding(
                      padding: EdgeInsets.all(Adapt.px(40)),
                      child: TextField(
                        focusNode: state.pwdFocusNode,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(fontSize: Adapt.px(35)),
                        cursorColor: Colors.black,
                        obscureText: true,
                        decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            hintText: '密码',
                            hasFloatingPlaceholder: true,
                            filled: true,
                            prefixStyle: TextStyle(
                                color: Colors.black, fontSize: Adapt.px(35)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87))),
                        onChanged: (String t) =>
                            dispatch(RegisterActionCreator.pwdChanged(t)),
                        onSubmitted: (s) {
                          state.pwdFocusNode.nextFocus();
                        },
                      ),
                    ),
                  ),
                ),
                SlideTransition(
                  position: Tween(begin: Offset(0, 1), end: Offset.zero)
                      .animate(checkPWCurve),
                  child: FadeTransition(
                    opacity: Tween(begin: 0.0, end: 1.0).animate(checkPWCurve),
                    child: Padding(
                      padding: EdgeInsets.all(Adapt.px(40)),
                      child: TextField(
                        obscureText: true,
                        focusNode: state.checkPWFocusNode,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(fontSize: Adapt.px(35)),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            hintText: '确认密码',
                            hasFloatingPlaceholder: true,
                            filled: true,
                            prefixStyle: TextStyle(
                                color: Colors.black, fontSize: Adapt.px(35)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87))),
                        onChanged: (String t) =>
                            dispatch(RegisterActionCreator.checkPWChanged(t)),
                        onSubmitted: (s) {
                          dispatch(RegisterActionCreator.onRegister());
                        },
                      ),
                    ),
                  ),
                ),
                SlideTransition(
                    position: Tween(begin: Offset(0, 1), end: Offset.zero)
                        .animate(submitCurve),
                    child: FadeTransition(
                      opacity: Tween(begin: 0.0, end: 1.0).animate(submitCurve),
                      child: _buildSubmit(),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  return Scaffold(
    body: Stack(
      children: <Widget>[
        // _buildHeader(),
        _buildRegisterBody(),
        Container(
          height: Adapt.screenH(),
          width: Adapt.screenW(),
          padding: EdgeInsets.only(bottom: Adapt.px(20)),
          alignment: Alignment.bottomCenter,
          child: SafeArea(
            child: FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: state.animationController,
                  curve: Interval(
                    0.7,
                    1.0,
                    curve: Curves.ease,
                  ),
                )),
                child: Text('Powered by The Movie DB')),
          ),
        ),
        // _buildAppbar()
      ],
    ),
  );
}
