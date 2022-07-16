import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToggleIconButtonWidget extends StatefulWidget {
  const ToggleIconButtonWidget({
    Key? key,
    this.activeIcon,
    this.inactiveIcon,
    this.isActive,
    this.size,
  }) : super(key: key);

  final Widget? activeIcon;
  final Widget? inactiveIcon;
  final bool? isActive;
  final double? size;

  @override
  _ToggleIconButtonWidgetState createState() => _ToggleIconButtonWidgetState();
}

class _ToggleIconButtonWidgetState extends State<ToggleIconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.isActive ?? true)
          Container(
            width: widget.size,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xFFE2E2E2),
                width: 1,
              ),
            ),
            child: widget.activeIcon!,
          ),
        if ((widget.isActive) == false)
          Container(
            width: widget.size,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xFFE2E2E2),
                width: 1,
              ),
            ),
            child: widget.inactiveIcon!,
          ),
      ],
    );
  }
}
