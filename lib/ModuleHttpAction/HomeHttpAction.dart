
import 'package:life_book/pages/Common/api_list.dart' as API;
import 'package:life_book/pages/Common/HttpManager.dart' as http;

class HomeNetworkAction {

//  var finial_url = API.APIDetails.baseUrl + API.APIDetails.homeAddRecord;

  // 添加数据
  Future submitRecordToService(Map<String, dynamic> param) async {
    http.defaultPostHttpAction(API.APIDetails.homeAddRecord, param).then((val) {
      return val;
    });
  }

}
