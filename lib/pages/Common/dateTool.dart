import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class DateTool {
  factory DateTool() => _getInstance();
  static DateTool get instance => _getInstance();
  static DateTool _instance;

  //私有构造函数
  DateTool._internal(){
    //初始化
  }

  // 静态、同步、私有访问点
  static DateTool _getInstance(){
    if (_instance == null) {
      _instance = DateTool._internal();
    }
    return _instance;
  }

  //返回当前时间字符串 yyyy-mm-dd
  String returnCurrentDate() {
    DateTime time = DateTime.now();
    return formatDate(time, [yyyy, '-', mm, '-', dd]);
  }
}