import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart' as charts;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartsViewVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return chartsView();
  }

  Widget chartsView() {
    return Container(
      height: ScreenUtil().setHeight(150 * ScreenUtil.pixelRatio),
      width: ScreenUtil().setWidth(ScreenUtil.screenWidth),
      margin: EdgeInsets.only(top: 15, right: 15),
      child: charts.LineChart(
        samples(),
        swapAnimationDuration: Duration(milliseconds: 250),
      ),
    );
  }

  charts.LineChartData samples(){
    return charts.LineChartData(
        titlesData: charts.FlTitlesData(
          bottomTitles: charts.SideTitles(
            ///数据间隔 （只显示 间隔的倍数 数据）
            interval: 2,
            showTitles: true,
            ///可设置下边距距离X轴的间距
            reservedSize: 22,
            textStyle: TextStyle(
              color: const Color(0xff72719b),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            margin: 5,
            getTitles: (value) {
              return value.toInt().toString();
            },
          ),
          leftTitles: charts.SideTitles(
            showTitles: true,
            ///可设置左边距离Y轴的宽度
            reservedSize: 52,
            textStyle: TextStyle(
              color: const Color(0xff75729e),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            margin: 5,
            getTitles: (value) {
              switch (value.toInt()){
                case 1:
                  return 'zhong';
                case 2:
                  return 'wen';
                case 3:
                  return 'bin';
                case 4:
                  return 'chen';
              }
              return 'll';
            },
          ),
        ),
        minX: 0,
        minY: 0,
        maxX: 14,
        maxY: 4,
        lineBarsData: lineBarDataFirst()
    );
  }

  List<charts.LineChartBarData> lineBarDataFirst() {
    charts.LineChartBarData lineChartDataFirst = const charts.LineChartBarData(
        spots: [
          charts.FlSpot(1, 1),
          charts.FlSpot(2, 3),
          charts.FlSpot(2, 4),
          charts.FlSpot(5, 3),
          charts.FlSpot(7, 2),
          charts.FlSpot(8, 2),
          charts.FlSpot(9, 1),
          charts.FlSpot(10, 1),
          charts.FlSpot(12, 3),
          charts.FlSpot(14, 2),
        ],
        ///是否处理拐角
        isCurved: true,
        colors: [Colors.yellow],
        barWidth: 2,
        ///线条是否圆角化处理
        isStrokeCapRound: true,
        ///显示点
        dotData: charts.FlDotData(
          show: false,
        ),
        ///点之间覆盖的区域
        belowBarData: charts.BarAreaData(
          show: true,
        ),
    );
    return [lineChartDataFirst];
  }
}
