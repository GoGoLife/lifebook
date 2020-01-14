import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provide/provide.dart';
import '../Common/dateTool.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Provide/home_add_record_provide.dart';

class AddRecordsVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(DateTool.instance.returnCurrentDate()),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                _PriceTextField(),
                _SpendingOrIncomeView(context),
                _isNecessary(context),
                _WrapVC(context),
              ],
            ),
          ),
        )
      ),
    );
  }

  ///价格输入框
  Widget _PriceTextField(){
    TextEditingController CustomController = TextEditingController();
    CustomController.addListener((){
      print('input content: ${CustomController.text.toString()}');
    });
    return Container(
      color: Colors.blueAccent,
      child: TextField(
        controller: CustomController,
        maxLines: 1,
        maxLength: 20,
        keyboardType: TextInputType.number,
        autofocus: false,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: '请输入价格',
        ),
      ),
    );
  }

  ///支出  还是收入
  Widget _SpendingOrIncomeView(BuildContext context){
    return Provide<AddRecordChangeNotification>(
      builder: (context, child, val) {
        return Container(
          padding: EdgeInsets.only(left: 15),
          color: Colors.blueAccent,
          child: Row(
            children: <Widget>[
              Text('支出 / 收入：'),
              Flexible(
                child: RadioListTile<String>(
                    value: '支出',
                    title: Text('支出'),
                    groupValue: val.isIncome,
                    activeColor: Colors.red,
                    onChanged: (value) {
                      Provide.value<AddRecordChangeNotification>(context)
                          .changeIsIncomeAction(value);
                    }
                ),
              ),
              Flexible(
                child: RadioListTile<String>(
                    value: '收入',
                    title: Text('收入'),
                    groupValue: val.isIncome,
                    activeColor: Colors.red,
                    onChanged: (value) {
                      Provide.value<AddRecordChangeNotification>(context)
                          .changeIsIncomeAction(value);
                    }
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  ///是否必要支出
  Widget _isNecessary(BuildContext context) {
    return Provide<AddRecordChangeNotification>(builder: (context, child, value){
      return Container(
        color: Colors.blueAccent,
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.instance.setHeight(150),
        child: Container(
          padding: EdgeInsets.only(left: 15),
          child: Row(
            children: <Widget>[
              Text('是否是必要支出：'),
              Flexible(
                child: RadioListTile<String>(
                    value: '是',
                    title: Text('是'),
                    groupValue: value.isNecessary,
                    activeColor: Colors.red,
                    onChanged: (val) {
                      Provide.value<AddRecordChangeNotification>(context)
                          .changeIsNecessaryAction(val);
                    }
                ),
              ),
              Flexible(
                child: RadioListTile<String>(
                    value: '否',
                    title: Text('否'),
                    groupValue: value.isNecessary,
                    activeColor: Colors.red,
                    onChanged: (val) {
                      Provide.value<AddRecordChangeNotification>(context)
                          .changeIsNecessaryAction(val);
                    }
                ),
              ),
            ],
          ),
        )
      );
    });
  }

  //流式布局
  Widget _WrapVC(BuildContext context) {
    List<Widget> widgetList = [];
    for (int i = 0; i < 8; i++) {
      widgetList.add(
        _eachItemView(context, i, 'lib/LocalImages/diet_1_3@3x.png', '水果'),
      );
    }
    return Container(
      width: ScreenUtil.screenWidth,
      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
      color: Colors.black12,
      child: Wrap(
        spacing: 30,
        runSpacing: 20,
        children: widgetList,
      ),
    );
  }

  Widget _eachItemView(BuildContext context, int index, String imageNamed,
      String text) {
    return InkWell(
      onTap: (){
        ///改变值
        Provide.value<AddRecordChangeNotification>(context).changeTouchSelectIndex(index);
      },
      child: Provide<AddRecordChangeNotification>(
        builder: (context, child, val) {
          ///获取值  并使用
//          int getIndex = Provide.value<AddRecordChangeNotification>
//            (context).currentSelectIndex;
          int getIndex = val.currentSelectIndex;
          if (getIndex == index) {
            imageNamed = 'lib/LocalImages/diet_1_2@3x.png';
          } else {
            imageNamed = 'lib/LocalImages/diet_1_3@3x.png';
          }

          return Container(
            alignment: Alignment.center,
            width: (ScreenUtil.screenWidthDp - 30 * 5) / 4,
            child: Column(
              children: <Widget>[
                Image.asset(imageNamed),
                Text(text),
              ],
            ),
          );
        },
      ),
    );
  }
}
