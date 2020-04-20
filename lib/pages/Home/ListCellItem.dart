import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_book/model/HomeModel.dart';

class ListCellItem extends StatelessWidget {
  final Data itemData;

  ListCellItem(this.itemData);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(140),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      child: InkWell(
        onTap: () {
          print('点击了item');
        },
        child: Stack(
          alignment: Alignment.centerLeft,
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
//              width: 160,
              left: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.book),
                  Text('     '),
                  Column(
                    children: <Widget>[
                      Text(this.itemData.title),
                      Text('饮食消费'),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 15,
              child: Text(
                '2019-1-14',
                style: TextStyle(fontSize: 12),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: _returnWidgetWithIsNecessary(this.itemData.isMust == 1
                  ? true : false),
            )
          ],
        ),
      ),
    );
  }

  ///返回是否必要的widget
  Widget _returnWidgetWithIsNecessary(bool isNecessary) {
    if (isNecessary) {
      return Container(
        width: 30,
        height: 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          color: Colors.green,
        ),
        child: Text(
          '必要',
          style: TextStyle(
            fontSize: 10,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Container(
        width: 30,
        height: 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          color: Colors.red,
        ),
        child: Text(
          '非要',
          style: TextStyle(
            fontSize: 10,
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
