// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom widget code
class CustomCircularProgressIndicador extends StatefulWidget {
  const CustomCircularProgressIndicador({
    Key? key,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? color;

  @override
  _CustomCircularProgressIndicadorState createState() =>
      _CustomCircularProgressIndicadorState();
}

class _CustomCircularProgressIndicadorState
    extends State<CustomCircularProgressIndicador> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: CircularProgressIndicator(
          color: widget.color,
        ),
      ),
    );
  }
}
