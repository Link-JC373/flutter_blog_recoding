import 'package:flutter/material.dart';
import './router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static String root = '/';
  static String detailsPage = '/detail';
  static String addArticlePage = '/addArticle';
  static String loginPage = '/login';
  static String changeInfoPage = '/changeInfo';
  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ERROR=====> Route was not found');
    });
    router.define(detailsPage, handler: detailsHandler);
    // router.define(addArticlePage, handler: addArticleHandler);
    // router.define(loginPage, handler: loginHandler);
    // router.define(changeInfoPage, handler: changeInfoHandler);
  }
}
