import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DemoChart extends StatelessWidget {
  const DemoChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      tooltipBehavior: TooltipBehavior(elevation: 2),

      series: [
        StackedColumnSeries(
          xValueMapper: xValueMapper,
          yValueMapper: yValueMapper,
        ),
      ],
    );
  }
}
