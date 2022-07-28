import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityHorizontalListWidget extends StatefulWidget {
  const ActivityHorizontalListWidget({
    Key? key,
    this.startup,
  }) : super(key: key);

  final StartupsRecord? startup;

  @override
  _ActivityHorizontalListWidgetState createState() =>
      _ActivityHorizontalListWidgetState();
}

class _ActivityHorizontalListWidgetState
    extends State<ActivityHorizontalListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      child: custom_widgets.ActivityHorizontalListCustom(
        width: 100,
        height: 50,
        startup: widget.startup!,
      ),
    );
  }
}
