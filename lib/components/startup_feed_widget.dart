import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class StartupFeedWidget extends StatefulWidget {
  const StartupFeedWidget({
    Key? key,
    this.startup,
  }) : super(key: key);

  final StartupsRecord? startup;

  @override
  _StartupFeedWidgetState createState() => _StartupFeedWidgetState();
}

class _StartupFeedWidgetState extends State<StartupFeedWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<StartupNewsRecord>>(
      stream: queryStartupNewsRecord(
        queryBuilder: (startupNewsRecord) => startupNewsRecord
            .where('startupSite', isEqualTo: widget.startup!.site),
        limit: 3,
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
        List<StartupNewsRecord> rowStartupNewsRecordList = snapshot.data!;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children:
                List.generate(rowStartupNewsRecordList.length, (rowIndex) {
              final rowStartupNewsRecord = rowStartupNewsRecordList[rowIndex];
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4, 20, 4, 20),
                child: InkWell(
                  onTap: () async {
                    logFirebaseEvent('STARTUP_FEED_COMP_StartupNews_ON_TAP');
                    logFirebaseEvent('StartupNews_Launch-U-R-L');
                    await launchURL(rowStartupNewsRecord!.newsUrl!);
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(14, 12, 14, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 121,
                              height: 48,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Text(
                                rowStartupNewsRecord!.title!,
                                maxLines: 3,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: Color(0xFF032B44),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 6, 0),
                                  child: FaIcon(
                                    FontAwesomeIcons.solidNewspaper,
                                    color: FlutterFlowTheme.of(context)
                                        .backgroundComponents,
                                    size: 16,
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Text(
                                    rowStartupNewsRecord!.siteName!,
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Rubik',
                                          color: Color(0xFF909090),
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
