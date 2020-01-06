import 'package:blog_flutter/style/login_theme.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SignInState state, Dispatch dispatch, ViewService viewService) {
  Widget buildSignInTextForm() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      width: 300,
      height: 150,
      child: Form(
        key: state.signInFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 10, bottom: 10),
                child: TextFormField(
                  focusNode: state.emailFocusNode,
                  onEditingComplete: () {
                    dispatch(SignInActionCreator.onEditText());
                  },
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      hintText: "邮箱地址",
                      border: InputBorder.none),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "邮箱不能为空";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    dispatch(SignInActionCreator.saveUserName(value));
                  },
                ),
              ),
            ),
            Container(
              height: 1,
              width: 250,
              color: Colors.grey[400],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                child: TextFormField(
                  focusNode: state.passwordFocusNode,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    hintText: "密码",
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  obscureText: !state.isShowPassWord,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  validator: (value) {
                    print(value);
                    if (value == null || value.isEmpty) {
                      return "密码不能为空";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    print(value);

                    dispatch(SignInActionCreator.savePassWord(value));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

//登录按钮
  Widget buildSignInButton() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(42, 10, 42, 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            gradient: LoginTheme.primaryGradient),
        child: Text(
          "登录",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      onTap: () async {
        dispatch(SignInActionCreator.onHandleLogin());
      },
    );
  }

  return Container(
    padding: EdgeInsets.only(top: 23),
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            buildSignInTextForm(),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Text(
                "忘记密码?",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    decoration: TextDecoration.underline),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 1,
                    width: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white10, Colors.white]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      'or',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 100,
                    decoration: BoxDecoration(
                        gradient: new LinearGradient(colors: [
                      Colors.white,
                      Colors.white10,
                    ])),
                  ),
                ],
              ),
            ),
            //第三方登录按钮
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.weixin,
                      color: Color(0xFF0084ff),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.qq,
                        color: Color(0xFF0084ff),
                      ),
                      onPressed: null),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          child: buildSignInButton(),
          top: 160,
        )
      ],
    ),
  );
}
