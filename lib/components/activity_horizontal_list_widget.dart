import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
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
    return StreamBuilder<List<SectorsOfActivityRecord>>(
      stream: querySectorsOfActivityRecord(
        queryBuilder: (sectorsOfActivityRecord) =>
            sectorsOfActivityRecord.where('description',
                whereIn: functions.splitByChar(
                    widget.startup!.sectorsOfActivity!, ', \\n')),
        limit: 2,
      ),
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
        List<SectorsOfActivityRecord> rowSectorsOfActivityRecordList =
            snapshot.data!;
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children:
              List.generate(rowSectorsOfActivityRecordList.length, (rowIndex) {
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
        );
      },
    );
  }
}
