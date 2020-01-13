import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'charts_page.dart';
import 'ListCellItem.dart';
import '../RoutersPage/Application.dart';
import '../RoutersPage/router_urls.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(ScreenUtil.screenWidth);
    return Scaffold(
      appBar: AppBar(title: Text('首页'),),
      body: Container(
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
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListCellItem();
//                    return ListTile(title: Text('${index}' + '啊啊啊啊'),);
                      },
                    )
                ),
              ],
            ),
            Positioned(
              right: 10,
              child: InkWell(
                onTap: (){
                  Applicaton.router.navigateTo(context, RouterUrls.home_add_record);
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
        )
      ),
    );
  }
}
