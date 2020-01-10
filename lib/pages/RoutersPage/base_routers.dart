import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:life_book/pages/RoutersPage/home_routers.dart';
import './router_urls.dart';

class BaseRouters {
  static String root = '/';
//  static String home_add_record = '/home/add_record';
  static configureRouters(Router router){
    //配置无导航的情况
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> param) {
        print('NO Router VC');
      }

      //绑定页面和Router
    );
    router.define(RouterUrls.home_add_record, handler: home_add_record_handle);
  }
}