import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Dashbord extends StatelessWidget {
  final Map<String, double> dataMap = {
    "veg": 25,
    "Non-veg": 15,
  };

  Dashbord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Dashboard',
          ),
        ),
        body: PieChart(
          // chartValuesOptions: ChartValuesOptions(
          //     showChartValues: true,
          //     decimalPlaces: 0,
          //     showChartValuesOutside: true),
          dataMap: dataMap,
          colorList: [
            Colors.blue[800]!,
            Colors.blue[300]!,
          ],
        ));
  }
}
