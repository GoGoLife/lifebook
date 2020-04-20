import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Home/HomePage.dart';
import './Mine/mine_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPageVC extends StatefulWidget {
  @override
  _IndexPageVCState createState() => _IndexPageVCState();
}

class _IndexPageVCState extends State<IndexPageVC> {
  //底部bottomBar
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: Text('我的')
    ),
  ];

  final List<Widget> viewControllers = [
    HomePage(),
    MinePage()
  ];

  int currentIndex = 0;
  var currentVC;

  @override
  void initState() {
    // TODO: implement initState
    currentVC = viewControllers[currentIndex];
    super.initState();
  }

  void changeVC(int touchIndex){
    setState(() {
      currentIndex = touchIndex;
      currentVC = viewControllers[touchIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
//    获取当前屏幕宽高
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      ///底部Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index){
          changeVC(index);
        },
      ),
      ///内容
      body: IndexedStack(
        index: currentIndex,
        children: viewControllers,
      ),
    );
  }
}
