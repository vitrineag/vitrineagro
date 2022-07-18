import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/startup_card_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StartupListWidget extends StatefulWidget {
  const StartupListWidget({Key? key}) : super(key: key);

  @override
  _StartupListWidgetState createState() => _StartupListWidgetState();
}

class _StartupListWidgetState extends State<StartupListWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'StartupList'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(1, 1),
                child: SvgPicture.asset(
                  'assets/images/bg-decoration.svg',
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                      ))
                        Container(
                          height: 122,
                          decoration: BoxDecoration(),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Container(
                            width: 336,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 20,
                                        color: Color(0x29000000),
                                        offset: Offset(8, 1),
                                        spreadRadius: 1,
                                      )
                                    ],
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 12, 12, 12),
                                    child: SvgPicture.asset(
                                      'assets/images/logo.svg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Text(
                                  'Encontre sua startup',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Rubik',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontSize: 24,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      StreamBuilder<List<StartupsRecord>>(
                        stream: queryStartupsRecord(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          List<StartupsRecord> wrapStartupsRecordList =
                              snapshot.data!;
                          return Wrap(
                            spacing: 24,
                            runSpacing: 16,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: List.generate(
                                wrapStartupsRecordList.length, (wrapIndex) {
                              final wrapStartupsRecord =
                                  wrapStartupsRecordList[wrapIndex];
                              return Container(
                                width: 336,
                                decoration: BoxDecoration(),
                                child: StreamBuilder<
                                    List<UserFavoritiesStartupsRecord>>(
                                  stream: queryUserFavoritiesStartupsRecord(
                                    queryBuilder:
                                        (userFavoritiesStartupsRecord) =>
                                            userFavoritiesStartupsRecord
                                                .where('startup',
                                                    isEqualTo:
                                                        wrapStartupsRecord!
                                                            .reference)
                                                .where('user',
                                                    isEqualTo:
                                                        currentUserReference),
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    List<UserFavoritiesStartupsRecord>
                                        startupCardUserFavoritiesStartupsRecordList =
                                        snapshot.data!;
                                    final startupCardUserFavoritiesStartupsRecord =
                                        startupCardUserFavoritiesStartupsRecordList
                                            .first;
                                    return StartupCardWidget(
                                      isFavorite:
                                          startupCardUserFavoritiesStartupsRecord!
                                              .active,
                                      startup: wrapStartupsRecord,
                                      favoriteDocument:
                                          startupCardUserFavoritiesStartupsRecord,
                                    );
                                  },
                                ),
                              );
                            }),
                          );
                        },
                      ),
                      Container(
                        width: 0,
                        height: 90,
                        decoration: BoxDecoration(),
                      ),
                    ],
                  ),
                ),
              ),
              if (responsiveVisibility(
                context: context,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 12),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 72,
                      constraints: BoxConstraints(
                        maxWidth: 768,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 36,
                            color: Color(0xFF557C67),
                            offset: Offset(0, 14),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'STARTUP_LIST_PAGE_FAVORITOS_BTN_ON_TAP');
                                logFirebaseEvent('Button_Navigate-To');
                                context.pushNamed('StartupFavoriteList');
                              },
                              text: 'favoritos',
                              icon: Icon(
                                Icons.star_border,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                width: 130,
                                height: 48,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'filtros',
                              icon: Icon(
                                Icons.filter_alt_outlined,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                height: 48,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    18, 0, 18, 0),
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(31),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                Align(
                  alignment: AlignmentDirectional(0, -1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 68,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 36,
                            color: Color(0x27557C67),
                            offset: Offset(0, 14),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              'assets/images/logo.svg',
                              fit: BoxFit.cover,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'STARTUP_LIST_PAGE_FAVORITOS_BTN_ON_TAP');
                                    logFirebaseEvent('Button_Navigate-To');
                                    context.pushNamed('StartupFavoriteList');
                                  },
                                  text: 'favoritos',
                                  icon: Icon(
                                    Icons.star_border,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 48,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Rubik',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: 'filtros',
                                  icon: Icon(
                                    Icons.filter_alt_outlined,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    height: 48,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        18, 0, 18, 0),
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Rubik',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(31),
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
            ],
          ),
        ),
      ),
    );
  }
}
