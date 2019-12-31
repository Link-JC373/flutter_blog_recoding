// const serviceUrl = 'http://rap2api.taobao.org/app/mock/239342/';
// const serviceUrl = 'http://192.168.137.1:7000/';
const serviceUrl = 'http://192.168.43.247:7000/';
// const serviceUrl = 'http://10.112.6.156:7000/';
// const serviceUrl = 'http://47.94.128.127:7000/';
const servicePath = {
  'homePageContext': serviceUrl + 'home/homePageContext',
  'test': serviceUrl + 'default/index',
  'getArticleList': serviceUrl + 'default/getArticleList',
  'getArticleDetail': serviceUrl + 'default/getArticleById',
  'searchSomeThing': serviceUrl + 'default/searchSomeThing',
  'getArticleType': serviceUrl + 'default/getArticleType',
  'login': serviceUrl + 'user/checkLogin',
  'comment': serviceUrl + 'user/comment',
  'addArticlePoint': serviceUrl + 'user/addArticlePoint',
  'reduceArticlePoint': serviceUrl + 'user/reduceArticlePoint',
  'uploadImg': serviceUrl + 'default/uploadImg',
  'changeInfo': serviceUrl + 'user/changeInfo'
};
