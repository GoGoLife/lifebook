import 'package:flutter/material.dart';

class ChangeHomeAddRecordIsNecessary with ChangeNotifier {
  ///是否必要支出
  String isNecessary = '';
  int currentSelectIndex = -1;

  ///修改是否必要支出
  changeIsNecessaryAction(String currentNecessary) {
    isNecessary = currentNecessary;
    print(isNecessary);
    notifyListeners();
  }

  ///修改当前点击的index
  changeTouchSelectIndex(int touchIndex) {
    currentSelectIndex = touchIndex;
    notifyListeners();
  }
}