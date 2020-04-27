import 'package:flutter/material.dart';
import './MineHeader.dart';
class MinePage extends StatelessWidget {

  // 列表项
  Widget _buildListItem(BuildContext context, int index){
    return ListTile(
        title: Text('list tile index $index')
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('个人中心'),),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: MineHeaderView(),
          ),

          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(_buildListItem, childCount: 30,),
              itemExtent: 48.0,
          ),
        ],
      ),
    );
  }
}