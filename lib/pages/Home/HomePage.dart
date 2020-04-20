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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: FutureBuilder(
        future: HttpManager.postHttpAction(API.APIDetails.homeListApi, {}),
        builder: _futureBuild,
      ),
    );
  }

  Widget _futureBuild(BuildContext context, AsyncSnapshot<HomeListModel> snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return Container(
          child: Text('none'),
        );
      case ConnectionState.waiting:
        return Container(
          child: Text('waiting'),
        );
      case ConnectionState.active:
        return Container(
          child: Text('active'),
        );
      case ConnectionState.done:
        if (snapshot.hasError) {
          return Container(
            child: Text('Error: ${snapshot.error.toString()}'),
          );
        } else {
          return loadViewUI(context, snapshot.data);
        }
        break;
      default:
        return Container(
          child: Text('data'),
        );
    }
  }

  Widget loadViewUI(BuildContext context, HomeListModel model) {
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
