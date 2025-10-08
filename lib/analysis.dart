import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({super.key});

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  String _selectedPeriod = 'Months'; // Week | Months | Year

  List<String> get _labels => _selectedPeriod == 'Week'
      ? ['Mon', 'Tue', 'Wed', 'Thu', 'Fri']
      : _selectedPeriod == 'Months'
          ? ['Jul', 'Aug', 'Sep']
          : ['2022', '2023', '2024'];

  // Dummy data for demo
  List<int> get _presentValues => _selectedPeriod == 'Week'
      ? [22, 25, 24, 23, 26]
      : _selectedPeriod == 'Months'
          ? [450, 520, 40]
          : [12500, 13100, 13750];

  List<int> get _absentValues => _selectedPeriod == 'Week'
      ? [3, 2, 4, 5, 1]
      : _selectedPeriod == 'Months'
          ? [180, 260, 12]
          : [900, 860, 720];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Analysis',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Color(0xFF1f2b5b),
          ),
        ),
        automaticallyImplyLeading: false,
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            _buildChartCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildChartCard(BuildContext context) {
    final themeText = const TextStyle(color: Color(0xFF1f2b5b));
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE8EBF3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFFEAF2FF),
                  child: Icon(Icons.insights, size: 22, color: Color(0xFF3F51B5)),
                ),
                SizedBox(width: 10),
                Text(
                  'Monthly Attendance',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1f2b5b),
                  ),
                ),
                // Spacer(),
                // Icon(Icons.more_horiz, color: Color(0xFF98A0B3))
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Attendance trends for your class',
              style: TextStyle(color: Colors.grey[600], fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 360,
              child: BarChart(
                BarChartData(
                  maxY: _computeMaxY().toDouble(),
                  gridData: FlGridData(show: true, drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) => FlLine(
                            color: Colors.grey.withOpacity(0.2),
                            strokeWidth: 1,
                          )),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 44,
                        interval: _tickInterval().toDouble(),
                        getTitlesWidget: (value, meta) => Text(
                          value.toInt().toString(),
                          style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        ),
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index < 0 || index >= _labels.length) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(_labels[index], style: TextStyle(color: Colors.grey[700], fontSize: 14)),
                          );
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  barGroups: _buildBarGroups(),
                  barTouchData: BarTouchData(enabled: true),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 14,
              children: [
                Text('Number of Students', style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                _legendDot(color: Colors.green, label: 'Present', textStyle: themeText),
                _legendDot(color: Colors.red, label: 'Absent', textStyle: themeText),
              ],
            ),
            const SizedBox(height: 16),
            Row(children: [
              _periodButton('Week'),
              const SizedBox(width: 8),
              _periodButton('Months'),
              const SizedBox(width: 8),
              _periodButton('Year'),
            ]),
          ],
        ),
      ),
    );
  }

  int _computeMaxY() {
    final maxP = _presentValues.fold<int>(0, (m, v) => v > m ? v : m);
    final maxA = _absentValues.fold<int>(0, (m, v) => v > m ? v : m);
    final maxV = (maxP > maxA ? maxP : maxA).toDouble();
    // Pad 15%
    return (maxV * 1.15).ceil();
  }

  int _tickInterval() {
    final max = _computeMaxY();
    if (max <= 50) return 10;
    if (max <= 200) return 50;
    if (max <= 1000) return 200;
    return 1000;
  }

  List<BarChartGroupData> _buildBarGroups() {
    return List.generate(_labels.length, (index) {
      final present = _presentValues[index].toDouble();
      final absent = _absentValues[index].toDouble();
      return BarChartGroupData(
        x: index,
        barsSpace: 12,
        barRods: [
          BarChartRodData(toY: present, width: 16, borderRadius: BorderRadius.circular(8), color: Colors.green),
          BarChartRodData(toY: absent, width: 16, borderRadius: BorderRadius.circular(8), color: Colors.red),
        ],
      );
    });
  }

  Widget _legendDot({required Color color, required String label, required TextStyle textStyle}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 8),
        Text(label, style: textStyle.copyWith(fontSize: 14, color: Colors.grey[700])),
      ],
    );
  }

  Widget _periodButton(String label) {
    final selected = _selectedPeriod == label;
    return Expanded(
      child: OutlinedButton(
        onPressed: () => setState(() => _selectedPeriod = label),
        style: OutlinedButton.styleFrom(
          backgroundColor: selected ? const Color(0xFFEAF2FF) : Colors.white,
          side: BorderSide(color: selected ? const Color(0xFF3F51B5) : const Color(0xFFE0E3EB)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? const Color(0xFF3F51B5) : const Color(0xFF1f2b5b),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}


