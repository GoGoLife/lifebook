import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import './pages/index_page.dart';
import 'package:fluro/fluro.dart';
import './pages/RoutersPage/base_routers.dart';
import './pages/RoutersPage/Application.dart';
import './pages/Provide/home_add_record_provide.dart';
import './pages/Provide/HomeListDataProvide.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var router = Router();
    BaseRouters.configureRouters(router);
    Applicaton.router = router;

    return Container(
      child: MaterialApp(
        title: 'LiftBook',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blueAccent
        ),
        home: IndexPageVC(),
      ),
    );
  }
}

void main(){
  //注册状态管理
  var provides = Providers();

  ///实例化一个通知类
  var home_add_recored_provide = AddRecordChangeNotification();
  var home_list_data_provide = HomeGetListDataProvideNotification();

  ///绑定
  provides
    ..provide(Provider<AddRecordChangeNotification>.value(home_add_recored_provide))
    ..provide(Provider<HomeGetListDataProvideNotification>.value(home_list_data_provide));
  ///绑定APP
  runApp(ProviderNode(child: MyApp(), providers: provides));
}
