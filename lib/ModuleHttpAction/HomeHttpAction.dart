import 'package:flutter/cupertino.dart';
import 'package:life_book/pages/Common/api_list.dart' as API;
import 'package:life_book/pages/Common/HttpManager.dart' as http;
import 'package:life_book/pages/Provide/NoticeRefreshHomeUI.dart';
import 'package:provide/provide.dart';
import 'package:life_book/pages/Common/ResultResponse.dart';

class HomeNetworkAction {

  /// 获取首页数据  并通知
  static void getHomeDataAndNotification(BuildContext context) {
    http.HttpManager.post(API.APIDetails.homeListApi, (data){
      Response res = Response(true, data);
      Provide.value<NoticeRefreshHomeUIProvide>(context).updateHomeUI(res);
    }, params: {}, errorCallback: (error){
      Response res = Response(false, error);
      Provide.value<NoticeRefreshHomeUIProvide>(context).updateHomeUI(res);
    });
  }

  // 添加数据
  Future submitRecordToService(Map<String, dynamic> param) async {
    http.defaultPostHttpAction(API.APIDetails.homeAddRecord, param).then((val) {
      return val;
    });
  }

}
