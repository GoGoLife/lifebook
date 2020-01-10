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
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              _PriceTextField(),
              _isNecessary(context),
              _WrapVC(),
            ],
          ),
        ),
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
        width: ScreenUtil.instance.setWidth(ScreenUtil.screenWidth),
        height: ScreenUtil.instance.setHeight(150),
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
      );
    });
  }

  //流式布局
  Widget _WrapVC() {
    List<Widget> widgetList = [];
    for (int i = 0; i < 10; i++) {
      widgetList.add(Text('${i}' + '个Text'));
    }
    return Container(
      width: ScreenUtil.instance.setWidth(ScreenUtil.screenWidth),
      height: ScreenUtil.instance.setHeight(400),
      padding: EdgeInsets.all(5.0),
      color: Colors.blueAccent,
      child: Wrap(
        spacing: 30,
        runSpacing: 30,
        children: widgetList,
      ),
    );
  }
}
