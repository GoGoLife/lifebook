import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'charts_page.dart';
import 'ListCellItem.dart';
import '../RoutersPage/Application.dart';
import '../RoutersPage/router_urls.dart';
import '../Common/HttpManager.dart' as HttpManager;
import '../Common/api_list.dart' as API;
import '../../model/HomeModel.dart';

class HomePage extends StatelessWidget {
  Future<dynamic> _futureBuildFuture() {
    return HttpManager.postHttpAction(API.APIDetails.homeListApi, {});
  }

  var _futureParam;

  @override
  Widget build(BuildContext context) {
    _futureParam = _futureBuildFuture();
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Container(
        child: FutureBuilder<dynamic>(
          future: _futureParam,
          builder: _futureBuild,
        ),
      ),
    );
  }

  Widget _futureBuild(BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.active:
      case ConnectionState.waiting:
        return Center(
          child: CupertinoActivityIndicator(),
        );
      case ConnectionState.done:
        if (snapshot.hasError) {
          return Center(
            child: FlatButton(
              onPressed: () {},
              child: Text('重新加载'),
            ),
          );
        } else {
          return loadViewUI(context, snapshot.data);
        }
    }
    return null;
  }

  Widget loadViewUI(BuildContext context, Map<String, dynamic> returnData) {
    //解析数据
    HomeListModel model = HomeListModel.fromJson(returnData);

    return Container(
      width: ScreenUtil.screenWidth,
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              ChartsViewVC(),
              Expanded(
                child: ListView.builder(
                  itemCount: model.data.length,
                  itemBuilder: (context, index) {
                    return ListCellItem(model.data[index]);
                  },
                ),
              ),
            ],
          ),
          Positioned(
            right: 10,
            bottom: 50,
            child: InkWell(
              onTap: () {
                Applicaton.router
                    .navigateTo(context, RouterUrls.home_add_record);
              },
              child: Container(
                height: ScreenUtil().setHeight(140),
                width: ScreenUtil().setWidth(140),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
