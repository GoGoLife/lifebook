import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MineHeaderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      width: ScreenUtil.screenWidth,
      height: ScreenUtil().setHeight(200),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Positioned(
            left: 20,
            top: 15,
            child: Text('data'),
          ),
          Positioned(
            left: 20,
            child: Text('nickName'),
          ),
          Positioned(
            right: 20,
            child: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}
