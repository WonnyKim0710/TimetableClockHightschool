import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '8x3 Table & Clock',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      home: Scaffold(
        appBar: AppBar(
        ),
        body: const TableAndClock(),
      ),
    );
  }
}

class TableAndClock extends StatefulWidget {
  const TableAndClock({super.key});

  @override
  _TableAndClockState createState() => _TableAndClockState();
}

class _TableAndClockState extends State<TableAndClock> {
  double _tb1rowHeight1 = 60.0;
  double _tb1colWidth1 = 70.0;
  double _tb1colWidth2 = 70.0;
  double _tb1colWidth3 = 160.0;
  double _tb1textSize = 24.0; // New variable for text size
  double _clockNumberSize = 32.0; // New variable for clock number size
  double _tb2rowHeight1 = 60.0;
  double _tb2colWidth1 = 400.0;
  double _tb2textSize = 24.0; // New variable for text size
  List<List<String>> rowData = [
    ["전자기기는 전원 반드시 끄고 제출하기"],
    ["본령 5분전에는 반드시 착석해 있기"],
    ["볼펜 사용 금지 & OMR 카드는 컴싸만 사용"],
    ["학교번호: "]
  ];

  void _increasetb1RowHeight() {
    setState(() {
      _tb1rowHeight1 += 10;
    });
  }

  void _decreasetb1RowHeight() {
    setState(() {
      if (_tb1rowHeight1 > 20) _tb1rowHeight1 -= 10;
    });
  }

  void _increasetb1ColWidth(int colIndex) {
    setState(() {
      if (colIndex == 0) {
        _tb1colWidth1 += 20;
      } else if (colIndex == 1) {
        _tb1colWidth2 += 20;
      } else if (colIndex == 2) {
        _tb1colWidth3 += 20;
      }
    });
  }

  void _decreasetb1ColWidth(int colIndex) {
    setState(() {
      if (colIndex == 0 && _tb1colWidth1 > 50) {
        _tb1colWidth1 -= 20;
      } else if (colIndex == 1 && _tb1colWidth2 > 50) {
        _tb1colWidth2 -= 20;
      } else if (colIndex == 2 && _tb1colWidth3 > 50) {
        _tb1colWidth3 -= 20;
      }
    });
  }

  void _increasetb1TextSize() {
    setState(() {
      _tb1textSize += 2;
    });
  }

  void _decreasetb1TextSize() {
    setState(() {
      if (_tb1textSize > 10) _tb1textSize -= 2;
    });
  }

  void _increaseClockNumberSize() {
    setState(() {
      _clockNumberSize += 2;
    });
  }

  void _decreaseClockNumberSize() {
    setState(() {
      if (_clockNumberSize > 10) _clockNumberSize -= 2;
    });
  }

  void _increasetb2RowHeight() {
    setState(() {
      _tb2rowHeight1 += 10;
    });
  }

  void _decreasetb2RowHeight() {
    setState(() {
      if (_tb2rowHeight1 > 20) _tb2rowHeight1 -= 10;
    });
  }

  void _increasetb2ColWidth(int colIndex) {
    setState(() {
      if (colIndex == 0) {
        _tb2colWidth1 += 20;
      }
    });
  }

  void _decreasetb2ColWidth(int colIndex) {
    setState(() {
      if (colIndex == 0 && _tb2colWidth1 > 50) {
        _tb2colWidth1 -= 20;
      }
    });
  }

  void _increasetb2TextSize() {
    setState(() {
      _tb2textSize += 2;
    });
  }

  void _decreasetb2TextSize() {
    setState(() {
      if (_tb2textSize > 10) _tb2textSize -= 2;
    });
  }

  void _addtb2Row() {
    setState(() {
      rowData.add(["여기를 눌러 공지를 추가하세요"]);
      if (_tb2rowHeight1 > 20) _tb2rowHeight1 -= 10;
    });
  }


  void _removetb2Row() {
    setState(() {
      rowData.removeLast();
      _tb2rowHeight1 += 10;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Table1Widget(
                    rowHeight: _tb1rowHeight1,
                    colWidths: [_tb1colWidth1, _tb1colWidth2, _tb1colWidth3],
                    textSize:
                        _tb1textSize, // Pass the text size to Table1Widget
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: AnalogClock(clockNumberSize: _clockNumberSize),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Table2Widget(
                          rowHeight: _tb2rowHeight1,
                          colWidths: [_tb2colWidth1],
                          textSize: _tb2textSize,
                          rowData: rowData, // Pass the rowData
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_left),
                      onPressed: () => _decreasetb1ColWidth(0),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_right),
                      onPressed: () => _increasetb1ColWidth(0),
                    ),
                    Text("구분 / "),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_left),
                      onPressed: () => _decreasetb1ColWidth(1),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_right),
                      onPressed: () => _increasetb1ColWidth(1),
                    ),
                    Text("과목 / "),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_left),
                      onPressed: () => _decreasetb1ColWidth(2),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_right),
                      onPressed: () => _increasetb1ColWidth(2),
                    ),
                    Text("시간 / "),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_drop_up),
                      onPressed: _increasetb1RowHeight,
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_drop_down),
                      onPressed: _decreasetb1RowHeight,
                    ),
                    Text("높이 / "),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_upward),
                      onPressed: _increasetb1TextSize,
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_downward),
                      onPressed: _decreasetb1TextSize,
                    ),
                    Text("글자  //        "),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_upward),
                      onPressed: _increaseClockNumberSize,
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_downward),
                      onPressed: _decreaseClockNumberSize,
                    ),
                    Text("시계 숫자  //       "),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_left),
                      onPressed: () => _decreasetb2ColWidth(0),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_right),
                      onPressed: () => _increasetb2ColWidth(0),
                    ),
                    Text("공지 / "),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_drop_up),
                      onPressed: _increasetb2RowHeight,
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_drop_down),
                      onPressed: _decreasetb2RowHeight,
                    ),
                    Text("높이 / "),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_upward),
                      onPressed: _increasetb2TextSize,
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_downward),
                      onPressed: _decreasetb2TextSize,
                    ),
                    Text("글자 / "),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: _addtb2Row,
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: _removetb2Row,
                    ),
                    Text("공지 추가"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class Table1Widget extends StatefulWidget {
  final double rowHeight;
  final List<double> colWidths;
  final double textSize; // New parameter for text size

  const Table1Widget({
    super.key,
    required this.rowHeight,
    required this.colWidths,
    required this.textSize,
  });

  @override
  _Table1WidgetState createState() => _Table1WidgetState();
}

class _Table1WidgetState extends State<Table1Widget> {
  final List<List<String>> _rowData = [
    ["구분", "과목", "시간"],
    ["1교시", "국어", "08:40~10:00 (80')"],
    ["2교시", "수학", "10:30~12:10 (100')"],
    ["점  심", "", "12:10~13:00"],
    ["3교시", "영어", "13:10~14:20 (70')"],
    ["4교시", "한국사", "14:50~15:20 (30')"],
    ["4교시", "제1선택", "15:35~16:05 (30')"],
    ["4교시", "제2선택", "16:07~16:37 (30')"]
  ];

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.white),
      columnWidths: {
        0: FixedColumnWidth(widget.colWidths[0]),
        1: FixedColumnWidth(widget.colWidths[1]),
        2: FixedColumnWidth(widget.colWidths[2]),
      },
      children: List.generate(8, (row) {
        return TableRow(
          children: List.generate(3, (col) {
            return GestureDetector(
              onTap: () async {
                String? newText =
                    await _showEditDialog(context, _rowData[row][col]);
                if (newText != null) {
                  setState(() {
                    _rowData[row][col] = newText;
                  });
                }
              },
              child: Container(
                height: widget.rowHeight,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _rowData[row][col],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.textSize, // Use the text size
                  ),
                ),
              ),
            );
          }),
        );
      }),
    );
  }

  Future<String?> _showEditDialog(BuildContext context, String currentText) {
    final TextEditingController controller =
        TextEditingController(text: currentText);

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit'),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(labelText: 'Enter new value'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(controller.text);
              },
              child: const Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

class AnalogClock extends StatefulWidget {
  final double clockNumberSize; // New parameter for clock number size

  const AnalogClock({super.key, required this.clockNumberSize});

  @override
  _AnalogClockState createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: CustomPaint(
          painter: ClockPainter(
              clockNumberSize: widget
                  .clockNumberSize), // Pass the clock number size to ClockPainter
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final double clockNumberSize; // New parameter for clock number size

  ClockPainter({required this.clockNumberSize});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    final now = DateTime.now();

    // Draw clock outline
    final outlinePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;
    canvas.drawCircle(center, radius, outlinePaint);

    // Draw clock numbers
    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    for (int i = 1; i <= 12; i++) {
      final angle = (i * 30) * pi / 180;
      final x = center.dx + radius * 0.85 * cos(angle - pi / 2);
      final y = center.dy + radius * 0.85 * sin(angle - pi / 2);
      textPainter.text = TextSpan(
        text: '$i',
        style: TextStyle(
          color: Colors.white,
          fontSize: clockNumberSize, // Use the clock number size
        ),
      );
      textPainter.layout();
      textPainter.paint(canvas,
          Offset(x - textPainter.width / 2, y - textPainter.height / 2));
    }

    // Draw hour and minute ticks
    for (int i = 0; i < 60; i++) {
      final angle = pi / 30 * i;
      final startRadius = radius - (i % 5 == 0 ? 14 : 8);
      final endRadius = radius;
      final startX = center.dx + startRadius * cos(angle - pi / 2);
      final startY = center.dy + startRadius * sin(angle - pi / 2);
      final endX = center.dx + endRadius * cos(angle - pi / 2);
      final endY = center.dy + endRadius * sin(angle - pi / 2);
      final tickPaint = Paint()
        ..color = Colors.white
        ..strokeWidth = (i % 5 == 0 ? 6 : 3);

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), tickPaint);
    }

    // Draw clock hands
    final hourPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;
    final minutePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;
    final secondPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final hourHandX = center.dx +
        radius *
            0.5 *
            cos((now.hour % 12 + now.minute / 60) * 30 * pi / 180 - pi / 2);
    final hourHandY = center.dy +
        radius *
            0.5 *
            sin((now.hour % 12 + now.minute / 60) * 30 * pi / 180 - pi / 2);
    final minuteHandX = center.dx +
        radius *
            0.7 *
            cos((now.minute + now.second / 60) * 6 * pi / 180 - pi / 2);
    final minuteHandY = center.dy +
        radius *
            0.7 *
            sin((now.minute + now.second / 60) * 6 * pi / 180 - pi / 2);
    final secondHandX =
        center.dx + radius * 0.9 * cos(now.second * 6 * pi / 180 - pi / 2);
    final secondHandY =
        center.dy + radius * 0.9 * sin(now.second * 6 * pi / 180 - pi / 2);

    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourPaint);
    canvas.drawLine(center, Offset(minuteHandX, minuteHandY), minutePaint);
    canvas.drawLine(center, Offset(secondHandX, secondHandY), secondPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Table2Widget extends StatefulWidget {
  final double rowHeight;
  final List<double> colWidths;
  final double textSize; // New parameter for text size
  final List<List<String>> rowData; // New parameter for row data

  const Table2Widget({
    super.key,
    required this.rowHeight,
    required this.colWidths,
    required this.textSize,
    required this.rowData,
  });

  @override
  _Table2WidgetState createState() => _Table2WidgetState();
}

class _Table2WidgetState extends State<Table2Widget> {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.white),
      columnWidths: {0: FixedColumnWidth(widget.colWidths[0])},
      children: List.generate(widget.rowData.length, (row) {
        return TableRow(
          children: List.generate(1, (col) {
            return GestureDetector(
              onTap: () async {
                String? newText =
                    await _showEditDialog(context, widget.rowData[row][col]);
                if (newText != null) {
                  setState(() {
                    widget.rowData[row][col] = newText;
                  });
                }
              },
              child: Container(
                height: widget.rowHeight,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.rowData[row][col],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.textSize,
                  ),
                ),
              ),
            );
          }),
        );
      }),
    );
  }

  Future<String?> _showEditDialog(BuildContext context, String currentText) {
    final TextEditingController controller =
        TextEditingController(text: currentText);

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit'),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(labelText: 'Enter new value'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(controller.text);
              },
              child: const Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
