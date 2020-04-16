class Data{
  String cusID;
  String imageUrl;
  String title;
  int timeStamp;
  int isMust;
  int isIncome;
  String describe;

  Data({this.cusID,this.imageUrl,this.title,this.timeStamp,this.isMust,
    this.isIncome, this.describe});

  Data.fromJson(Map<String, dynamic> json) {
    cusID = json['cus_id'];
    imageUrl = json['image_url'];
    title = json['title'];
    timeStamp = json['time_stamp'];
    isMust = json['is_must'];
    isIncome = json['is_income'];
    describe = json['describe'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cus_id'] = this.cusID;
    data['image_url'] = this.imageUrl;
    data['title'] = this.title;
    data['time_stamp'] = this.timeStamp;
    data['is_must'] = this.isMust;
    data['is_income'] = this.isIncome;
    data['describe'] = this.describe;
    return data;
  }
}

class HomeListModel{
  int state;
  String msg;
  List<Data> data;

  HomeListModel({this.state, this.msg, this.data});

  HomeListModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v)=> v.toJson()).toList();
    }
    return data;
  }
}