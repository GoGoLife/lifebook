
class MineInfoModel {
  String name;
  String nickName;
  String phone;
  String headerUrl;

  MineInfoModel({this.name, this.nickName, this.phone, this.headerUrl});

  /// json转model
  MineInfoModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nickName = json['nickName'];
    phone = json['phone'];
    headerUrl = json['headerUrl'];
  }

  /// model转json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map();
    data['name'] = name;
    data['nickName'] = nickName;
    data['phone'] = phone;
    data['headerUrl'] = headerUrl;
    return data;
  }
}