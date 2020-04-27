import 'package:flutter/cupertino.dart';
import 'package:life_book/pages/Common/ResultResponse.dart';

class NoticeRefreshHomeUIProvide with ChangeNotifier {
  Response result = new Response(false, new Map());
  updateHomeUI(Response response){
    result = response;
    notifyListeners();
  }
}