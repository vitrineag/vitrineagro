// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:vitrine_ag/backend/backend.dart';
import 'package:vitrine_ag/flutter_flow/flutter_flow_theme.dart';
import 'package:vitrine_ag/flutter_flow/custom_functions.dart';

class ActivityHorizontalListCustom extends StatefulWidget {
  const ActivityHorizontalListCustom({
    Key? key,
    this.width,
    this.height,
    required this.startup,
  }) : super(key: key);

  final double? width;
  final double? height;
  final StartupsRecord startup;

  @override
  _ActivityHorizontalListCustomState createState() =>
      _ActivityHorizontalListCustomState();
}

class _ActivityHorizontalListCustomState
    extends State<ActivityHorizontalListCustom> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SectorsOfActivityRecord>>(
      stream: querySectorsOfActivityRecord(
          queryBuilder: (sectorsOfActivityRecord) => sectorsOfActivityRecord),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<SectorsOfActivityRecord> rowSectorsOfActivityRecordListFull =
            snapshot.data!;
        final rowSectorsOfActivityRecordList =
            rowSectorsOfActivityRecordListFull.where((sectorOfActivity) {
          final startupSectors = getSectorsOfActivity(widget.startup!);
          return startupSectors.contains(sectorOfActivity.description);
        }).toList();
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(rowSectorsOfActivityRecordList.length,
                (rowIndex) {
              final rowSectorsOfActivityRecord =
                  rowSectorsOfActivityRecordList[rowIndex];
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Color(0xFF707070),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: Image.network(
                            rowSectorsOfActivityRecord!.icon!,
                            height: 18,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          rowSectorsOfActivityRecord!.description!,
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
