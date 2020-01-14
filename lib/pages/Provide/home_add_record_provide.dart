import 'package:flutter/material.dart';

class AddRecordChangeNotification with ChangeNotifier {
//  是否必要支出
  String isNecessary = '是';
  /*图标的点击index*/
  int currentSelectIndex = -1;
  /*支出  或者  收入*/
  String isIncome = '支出';

  ///修改是否必要支出
  changeIsNecessaryAction(String currentNecessary) {
    isNecessary = currentNecessary;
    notifyListeners();
  }

  ///修改当前点击的index
  changeTouchSelectIndex(int touchIndex) {
    currentSelectIndex = touchIndex;
    notifyListeners();
  }

  changeIsIncomeAction(String string){
    isIncome = string;
    notifyListeners();
  }
}