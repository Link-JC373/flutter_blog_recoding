import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
// import 'package:flutter_shop/pages/login_page.dart';
// import '../pages/detail_fluro.dart';
// import '../pages/addArticle_fluro.dart';
// import '../pages/changeInfo.dart';

Handler detailsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String articleId = params['id']?.first;
  print(params['id']);
  int userId = int.parse(params['userId']?.first);
  print('index>details goodsID is $articleId');
  // return DetailsPage(articleId, userId);
});

// Handler addArticleHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return AddArticlePage();
// });
// Handler loginHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return LoginPage();
// });
// Handler changeInfoHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return ChangeInfo();
// });
