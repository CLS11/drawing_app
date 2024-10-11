import 'package:drawing_app/flipbook_painter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.title, super.key});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Offset?> _offsets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanStart: (details) {
          final renderBox = context.findRenderObject() as RenderBox;
          final localPosition = renderBox.globalToLocal(details.globalPosition);
          print('localPosition: ${localPosition}');
          setState(() {
            _offsets.add(localPosition);
          });
        },
        onPanUpdate: (details) {
          final renderBox = context.findRenderObject() as RenderBox;
          final localPosition = renderBox.globalToLocal(details.globalPosition);
          print('localPosition: ${localPosition}');
          setState(() {
            _offsets.add(localPosition);
          });
        },
        onPanEnd: (details) {
          setState(() {
            _offsets.add(null);
          });
        },
        child: Center(
          child: CustomPaint(
            painter: FlipbookPainter(
              _offsets.whereType<Offset>().toList(),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
      ),
    );
  }
}
