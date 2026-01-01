part of '../home_view.dart';

class UserGrowthChart extends StatefulWidget {
  const UserGrowthChart({super.key, required this.barStacks});
  final List<BarStack> barStacks;
  @override
  State<UserGrowthChart> createState() => _UserGrowthChartState();
}

class _UserGrowthChartState extends State<UserGrowthChart> {
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    init();
    super.initState();
  }

  defineToolTip() {
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      builder:
          (
            dynamic data,
            dynamic point,
            dynamic series,
            int pointIndex,
            int seriesIndex,
          ) {
            if (data == null || !mounted) return const SizedBox.shrink();

            final chartData = data as ChartData;
            // final totalUsers = (( chartData.users) / 1000)
            //     .round();
            // final totalRevenue = (chartData.revenue / 1000).round();
            final totalRevenue = chartData.revenue > 1000
                ? "$currency ${(chartData.revenue / 1000).toStringAsFixed(2)}k"
                : "$currency ${chartData.revenue}";
            final totalUsers = chartData.users > 1000
                ? "${(chartData.users / 1000).toStringAsFixed(2)}k"
                : "${chartData.users}";

            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${chartData.month} 2025',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 12),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildTooltipInfoItem(
                        label: 'Total User',
                        value: totalUsers,
                        color: primaryColor,
                      ),
                      const SizedBox(width: 24),
                      _buildTooltipInfoItem(
                        label: 'Total Revenue',
                        value: totalRevenue,
                        color: primaryContainer,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
    );
  }

  List<ChartData> chartData = [];

  double maxPick = 10;
  double divisor = 2;

  convertToFullYearChartData(List<BarStack> barStacks) {
    // List of all months in order

    // Create a map for fast lookup
    final barMap = {for (var b in barStacks) b.month: b};

    // Build chart data with all months
    chartData = shortMonthNames.map((month) {
      if (barMap.containsKey(month)) {
        final b = barMap[month]!;
        return ChartData(month, b.totalUsers.toDouble(), b.totalRevenue);
      } else {
        return ChartData(month, 0, 0);
      }
    }).toList();

    print(chartData);
    setState(() {
      getMaxPickWithDivisor(chartData);
    });
  }

  getMaxPickWithDivisor(List<ChartData> chartData) {
    maxPick = chartData
        .map((data) => data.users + data.revenue)
        .reduce((a, b) => a > b ? a : b);

    // 2️⃣ Find a suitable divisor (at least 4 parts)
    double rawDivisor = maxPick / 4;

    // Round to a "nice" number for chart scale
    // We round up to nearest 10, 50, 100, 500, 1000, etc.
    double exponent = rawDivisor > 0
        ? (log(rawDivisor) / ln10).floorToDouble()
        : 0;
    double magnitude = pow(10, exponent).toDouble();

    maxPick = maxPick + divisor;
    divisor = (rawDivisor / magnitude).ceil() * magnitude;
    setState(() {});
  }

  init() {
    defineToolTip();
    convertToFullYearChartData(widget.barStacks);

    // convertToFullYearChartData(widget.barStacks);
  }

  @override
  void dispose() {
    _tooltipBehavior = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryContainer.withAlpha(80),
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'User Growth & Revenue',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'User growth and revenue trends',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),

              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Legend
                      _buildLegendItem(color: primaryColor, label: 'Users'),
                      const SizedBox(width: 24),
                      _buildLegendItem(
                        color: primaryContainer,
                        label: 'Revenue',
                      ),
                      hPad20,
                      SizedBox(
                        width: 100,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                defaultRadius,
                              ),
                              borderSide: BorderSide(
                                color: customGrey.withAlpha(150),
                              ),
                            ),
                          ),

                          borderRadius: BorderRadius.circular(defaultRadius),
                          dropdownColor: primaryContainer,
                          items: [
                            DropdownMenuItem(
                              value: "2025",
                              child: Text(
                                "2025",
                                style: titleSmall(
                                  fontWeight: FontWeight.w600,
                                  color: customGrey,
                                ),
                              ),
                            ),
                          ],
                          onChanged: (e) {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 32),

          // Chart
          Expanded(
            child: SfCartesianChart(
              backgroundColor: Colors.transparent,

              // title: ChartTitle(text: "salkdfmalsk dfakjlsd fk"),
              tooltipBehavior: _tooltipBehavior,
              plotAreaBorderWidth: 0,
              primaryXAxis: CategoryAxis(
                majorGridLines: const MajorGridLines(width: 0),
                axisLine: const AxisLine(width: 0),
                labelStyle: const TextStyle(
                  fontSize: 12,
                  // color: Colors.black54,
                ),
              ),
              primaryYAxis: NumericAxis(
                interval: divisor < 1 ? 1 : null,
                maximum: maxPick,
                majorGridLines: MajorGridLines(
                  width: 0.5,
                  dashArray: [4, 4],
                  color: customGrey.withAlpha(150),
                ),
                axisLine: const AxisLine(width: 0),
                labelFormat: '{value}',
                labelStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
                axisLabelFormatter: (AxisLabelRenderDetails args) {
                  final value = args.value > 1000
                      ? "${(args.value / 1000).toStringAsFixed(1)}k"
                      : args.value.toStringAsFixed(1);
                  return ChartAxisLabel(
                    value,
                    const TextStyle(fontSize: 12, color: Colors.black54),
                  );
                },
              ),
              series: <CartesianSeries<ChartData, String>>[
                StackedColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.month,
                  yValueMapper: (ChartData data, _) => data.users,
                  color: primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                  width: 0.6,
                  spacing: 0,
                  enableTooltip: true,
                ),
                StackedColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.month,
                  yValueMapper: (ChartData data, _) => data.revenue,
                  color: primaryContainer,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  width: 0.6,
                  spacing: 0,
                  enableTooltip: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem({required Color color, required String label}) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildInfoItem({
    required String label,
    required String value,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTooltipInfoItem({
    required String label,
    required String value,
    required Color color,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.month, this.users, this.revenue);
  final String month;
  final double users;
  final double revenue;
}
