import '../backend/backend.dart';
import '../components/startup_detail_info_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartupDetailWidget extends StatefulWidget {
  const StartupDetailWidget({
    Key? key,
    this.startup,
  }) : super(key: key);

  final StartupsRecord? startup;

  @override
  _StartupDetailWidgetState createState() => _StartupDetailWidgetState();
}

class _StartupDetailWidgetState extends State<StartupDetailWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'StartupDetail'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                      ))
                        Container(
                          height: 78,
                          decoration: BoxDecoration(),
                        ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 32),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            constraints: BoxConstraints(
                              maxWidth: 768,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 22,
                                  color: Color(0x2A000000),
                                  offset: Offset(0, 9),
                                )
                              ],
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 33, 0, 33),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        33, 0, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'STARTUP_DETAIL_PAGE_Text_i0zx6d9j_ON_TAP');
                                        logFirebaseEvent('Text_Navigate-Back');
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        '< voltar',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Rubik',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        13, 0, 13, 0),
                                    child: StartupDetailInfoWidget(
                                      startup: widget.startup,
                                    ),
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                  ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 28, 0, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        constraints: BoxConstraints(
                                          maxWidth: 768,
                                        ),
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () {
                                                print('Button pressed ...');
                                              },
                                              text: 'entrar em contato',
                                              options: FFButtonOptions(
                                                width: 190,
                                                height: 40,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Rubik',
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(22),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
              if (responsiveVisibility(
                context: context,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                StartupDetailInfoWidget(
                  startup: widget.startup,
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
                            color: Color(0x6E557C67),
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
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 45,
                              icon: Icon(
                                Icons.chevron_left,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 30,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'STARTUP_DETAIL_chevron_left_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_Navigate-Back');
                                Navigator.pop(context);
                              },
                            ),
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'entrar em contato',
                              options: FFButtonOptions(
                                width: 190,
                                height: 40,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(22),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 45,
                              icon: Icon(
                                Icons.star_border,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 30,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
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
                    padding: EdgeInsetsDirectional.fromSTEB(24, 10, 24, 12),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 68,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 16,
                            color: Color(0x1A000000),
                            offset: Offset(0, 9),
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
                            Image.network(
                              '',
                              fit: BoxFit.cover,
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 45,
                              icon: Icon(
                                Icons.star_border,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 30,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
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
