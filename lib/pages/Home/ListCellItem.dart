import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListCellItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(ScreenUtil.screenWidth),
      height: ScreenUtil().setHeight(120),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      child: InkWell(
        onTap: (){print('点击了item');},
        child: Stack(
          alignment: Alignment.centerLeft,
          textDirection: TextDirection.ltr,
          fit: StackFit.loose,
          children: <Widget>[
            Positioned(
              left: 10,
              child: Icon(Icons.book),
            ),
            Positioned(
              left: 30,
              right: 50,
              child: _contentWidget(),
            ),
            Positioned(
              right: 20,
              child: Text('aaa'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contentWidget(){
    return Container(
      padding: EdgeInsets.only(left: 10, top: 5),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            '2019-1-6',
            style: TextStyle(fontSize: ScreenUtil().setSp(30),fontWeight: FontWeight.w700),
          ),
          Container(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              '饮食消费',
              style: TextStyle(fontSize: ScreenUtil().setSp(24)),
            ),
          )
        ],
      ),
    );
  }
}
