import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/favorite_toggle_widget.dart';
import '../components/startup_detail_info_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class StartupDetailWidget extends StatefulWidget {
  const StartupDetailWidget({
    Key? key,
    this.startupSite,
  }) : super(key: key);

  final String? startupSite;

  @override
  _StartupDetailWidgetState createState() => _StartupDetailWidgetState();
}

class _StartupDetailWidgetState extends State<StartupDetailWidget> {
  String _currentPageLink = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'StartupDetail'});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<StartupsRecord>>(
      stream: queryStartupsRecord(
        queryBuilder: (startupsRecord) =>
            startupsRecord.where('site', isEqualTo: widget.startupSite),
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
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<StartupsRecord> startupDetailStartupsRecordList = snapshot.data!;
        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final startupDetailStartupsRecord =
            startupDetailStartupsRecordList.first;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                decoration: BoxDecoration(),
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 16, 0, 32),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  constraints: BoxConstraints(
                                    maxWidth: 768,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 33, 0, 33),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  33, 0, 0, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'STARTUP_DETAIL_PAGE_Text_i0zx6d9j_ON_TAP');
                                              logFirebaseEvent(
                                                  'Text_Navigate-Back');
                                              context.pop();
                                            },
                                            child: Text(
                                              '< voltar',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  13, 0, 13, 0),
                                          child: StartupDetailInfoWidget(
                                            startup:
                                                startupDetailStartupsRecord,
                                          ),
                                        ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 28, 0, 0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
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
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'STARTUP_DETAIL_ENTRAR_EM_CONTATO_BTN_ON_');
                                                      logFirebaseEvent(
                                                          'Button_Backend-Call');

                                                      final userContactCreateData =
                                                          createUserContactRecordData(
                                                        createdDate:
                                                            getCurrentTimestamp,
                                                        startup:
                                                            startupDetailStartupsRecord!
                                                                .reference,
                                                        startupContact:
                                                            startupDetailStartupsRecord!
                                                                .comercialContact
                                                                ?.toString(),
                                                        startupName:
                                                            startupDetailStartupsRecord!
                                                                .name,
                                                        user:
                                                            currentUserReference,
                                                        userEmail:
                                                            currentUserEmail,
                                                        userName:
                                                            currentUserDisplayName,
                                                      );
                                                      await UserContactRecord
                                                          .collection
                                                          .doc()
                                                          .set(
                                                              userContactCreateData);
                                                      logFirebaseEvent(
                                                          'Button_Alert-Dialog');
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Parabéns você vai contactar uma startup'),
                                                            content: Text(
                                                                'Agora é só aguardar que vamos te conectar com essa empresa'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    text: 'entrar em contato',
                                                    options: FFButtonOptions(
                                                      width: 190,
                                                      height: 40,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'Rubik',
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22),
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
                        startup: startupDetailStartupsRecord,
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
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 45,
                                    icon: Icon(
                                      Icons.chevron_left,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'STARTUP_DETAIL_chevron_left_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_Navigate-Back');
                                      context.pop();
                                    },
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'STARTUP_DETAIL_ENTRAR_EM_CONTATO_BTN_ON_');
                                      logFirebaseEvent('Button_Backend-Call');

                                      final userContactCreateData =
                                          createUserContactRecordData(
                                        createdDate: getCurrentTimestamp,
                                        startup: startupDetailStartupsRecord!
                                            .reference,
                                        startupContact:
                                            startupDetailStartupsRecord!
                                                .comercialContact
                                                ?.toString(),
                                        startupName:
                                            startupDetailStartupsRecord!.name,
                                        user: currentUserReference,
                                        userEmail: currentUserEmail,
                                        userName: currentUserDisplayName,
                                      );
                                      await UserContactRecord.collection
                                          .doc()
                                          .set(userContactCreateData);
                                      logFirebaseEvent('Button_Alert-Dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text(
                                                'Parabéns você vai contactar uma startup'),
                                            content: Text(
                                                'Agora é só aguardar que vamos te conectar com essa empresa'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    text: 'entrar em contato',
                                    options: FFButtonOptions(
                                      width: 190,
                                      height: 40,
                                      color: Color(0xFFFFCE60),
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
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 45,
                                    icon: Icon(
                                      Icons.share_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'STARTUP_DETAIL_share_sharp_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_Generate-Current-Page-Link');
                                      _currentPageLink =
                                          await generateCurrentPageLink(
                                              context);
                                      logFirebaseEvent('IconButton_Share');
                                      await Share.share(_currentPageLink);
                                    },
                                  ),
                                  FavoriteToggleWidget(
                                    startup: startupDetailStartupsRecord,
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(24, 10, 24, 12),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 68,
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/logo.svg',
                                    height: 34,
                                    fit: BoxFit.cover,
                                  ),
                                  FavoriteToggleWidget(
                                    startup: startupDetailStartupsRecord,
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
          ),
        );
      },
    );
  }
}
