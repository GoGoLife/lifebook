import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provide/provide.dart';
import '../Common/dateTool.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Provide/home_add_record_provide.dart';

class AddRecordsVC extends StatelessWidget {

  int touchIndex = -1;

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

  Widget _isNecessary(BuildContext context) {
    return Provide<ChangeHomeAddRecordIsNecessary>(builder: (context, child, value){
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
                      print('1111111111');
                      Provide.value<ChangeHomeAddRecordIsNecessary>(context)
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
                      print('222222222');
                      Provide.value<ChangeHomeAddRecordIsNecessary>(context)
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
        Provide.value<ChangeHomeAddRecordIsNecessary>(context).changeTouchSelectIndex(index);
      },
      child: Provide<ChangeHomeAddRecordIsNecessary>(
        builder: (context, child, val) {
          ///获取值  并使用
          int getIndex = Provide.value<ChangeHomeAddRecordIsNecessary>
            (context).currentSelectIndex;
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
