import 'package:flutter/material.dart';

class OnScreenRulerWidget extends StatefulWidget {
  ///Your main widget
  final Widget child;

  ///Show or hide ruler
  final bool show;
  ///Size of the grid default is 8px
  final double gridSize;
  ///Color line of the grid, default is Colors.black12
  final Color gridColor;
  ///Background of activate button, default is Colors.black12
  final Color activateBgColor;
  ///Icon of activate overlay grid
  final Icon? activateIcon;

  OnScreenRulerWidget(
      {required this.child,
      this.show = false,
      this.gridSize = 8.0,
      this.gridColor = Colors.black12,
      this.activateBgColor = Colors.black12,
      this.activateIcon = const Icon(Icons.expand)});

  @override
  _OnScreenRulerWidgetState createState() => _OnScreenRulerWidgetState();
}

class _OnScreenRulerWidgetState extends State<OnScreenRulerWidget> {
  var _isVisible;

  @override
  void initState() {
    super.initState();
    _isVisible = widget.show;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        widget.child,
        if (_isVisible)
          Center(
            child: IgnorePointer(
              child: CustomPaint(
                painter: GridPainter(
                    width, height, widget.gridColor, widget.gridSize),
              ),
            ),
          ),
        Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onDoubleTap: () {
              setState(() {
                _isVisible = !_isVisible;
              });
            },
            child: SafeArea(
              child: Container(
                height: 20,
                color: widget.activateBgColor,
                child: widget.activateIcon,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class GridPainter extends CustomPainter {
  double devWidth;
  double devHeight;
  Color gridColor;
  double gridSize;

  GridPainter(this.devWidth, this.devHeight, this.gridColor, this.gridSize);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = gridColor
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for (var i = -(devHeight / 2); i < devHeight; i += gridSize) {
      for (var j = -(devWidth / 2); j < devWidth; j += gridSize) {
        canvas.drawRect(
            Offset(j.toDouble(), i.toDouble()) & Size(gridSize, gridSize),
            paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
