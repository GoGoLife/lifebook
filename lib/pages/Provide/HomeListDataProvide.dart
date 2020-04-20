import 'package:flutter/cupertino.dart';
import 'package:life_book/model/HomeModel.dart';

class HomeGetListDataProvideNotification with ChangeNotifier {
  List<Data> listData = [];

  updateHomeListData(List<Data> listInfo) {
    listData.addAll(listInfo);
    notifyListeners();
  }

}