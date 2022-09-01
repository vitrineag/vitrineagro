import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../components/favorite_toggle_widget.dart';
import '../components/social_login_widget.dart';
import '../components/startup_detail_info_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:text_search/text_search.dart';

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
  List<StartupTrackingRecord> simpleSearchResults = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('STARTUP_DETAIL_StartupDetail_ON_LOAD');
      logFirebaseEvent('StartupDetail_Update-Local-State');
      setState(() => FFAppState().startupSiteRedirect = '');
      logFirebaseEvent('StartupDetail_Simple-Search');
      await queryStartupTrackingRecordOnce()
          .then(
            (records) => simpleSearchResults = TextSearch(
              records
                  .map(
                    (record) => TextSearchItem(record, [record.startupSite!]),
                  )
                  .toList(),
            ).search(widget.startupSite!).map((r) => r.object).take(1).toList(),
          )
          .onError((_, __) => simpleSearchResults = [])
          .whenComplete(() => setState(() {}));

      logFirebaseEvent('StartupDetail_Backend-Call');

      final startupTrackingUpdateData = {
        'views': FieldValue.increment(1),
      };
      await functions
          .getFirstStartupTracking(simpleSearchResults.toList())
          .reference
          .update(startupTrackingUpdateData);
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'StartupDetail'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
            startupDetailStartupsRecordList.isNotEmpty
                ? startupDetailStartupsRecordList.first
                : null;
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
                                    maxWidth: 900,
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
                                                  'Text_Navigate-To');
                                              context.goNamed(
                                                'StartupList',
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .rightToLeft,
                                                  ),
                                                },
                                              );
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
                                            startupTracking: functions
                                                .getFirstStartupTracking(
                                                    simpleSearchResults
                                                        .toList()),
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
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'STARTUP_DETAIL_EnterInContact_ON_TAP');
                                                      if (!loggedIn) {
                                                        logFirebaseEvent(
                                                            'EnterInContact_Bottom-Sheet');
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Color(0xFFFFFEFE),
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child: Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.2,
                                                                child:
                                                                    SocialLoginWidget(
                                                                  user:
                                                                      currentUserReference,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                        return;
                                                      }
                                                      logFirebaseEvent(
                                                          'EnterInContact_Backend-Call');

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
                                                          'EnterInContact_Alert-Dialog');
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
                                                      logFirebaseEvent(
                                                          'EnterInContact_Backend-Call');

                                                      final startupTrackingUpdateData =
                                                          {
                                                        'enterInContact':
                                                            FieldValue
                                                                .increment(1),
                                                      };
                                                      await functions
                                                          .getFirstStartupTracking(
                                                              simpleSearchResults
                                                                  .toList())
                                                          .reference
                                                          .update(
                                                              startupTrackingUpdateData);
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
                        startupTracking: functions.getFirstStartupTracking(
                            simpleSearchResults.toList()),
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
                                          'IconButton_Navigate-To');
                                      context.goNamed(
                                        'StartupList',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );
                                    },
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'STARTUP_DETAIL_EnterInContact_ON_TAP');
                                      if (!loggedIn) {
                                        logFirebaseEvent(
                                            'EnterInContact_Bottom-Sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Color(0xFFFFFEFE),
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    3,
                                                child: SocialLoginWidget(
                                                  user: currentUserReference,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                        return;
                                      }
                                      logFirebaseEvent(
                                          'EnterInContact_Backend-Call');

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
                                      logFirebaseEvent(
                                          'EnterInContact_Alert-Dialog');
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
                                      logFirebaseEvent(
                                          'EnterInContact_Backend-Call');

                                      final startupTrackingUpdateData = {
                                        'enterInContact':
                                            FieldValue.increment(1),
                                      };
                                      await functions
                                          .getFirstStartupTracking(
                                              simpleSearchResults.toList())
                                          .reference
                                          .update(startupTrackingUpdateData);
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
                                      logFirebaseEvent('IconButton_Share');
                                      await Share.share(
                                          'https://app.vitrine.ag/#/loadingDeepLink/${functions.encodeUri(widget.startupSite!)}');
                                      logFirebaseEvent(
                                          'IconButton_Backend-Call');

                                      final startupTrackingUpdateData = {
                                        'share': FieldValue.increment(1),
                                      };
                                      await functions
                                          .getFirstStartupTracking(
                                              simpleSearchResults.toList())
                                          .reference
                                          .update(startupTrackingUpdateData);
                                    },
                                  ),
                                  FavoriteToggleWidget(
                                    startup: startupDetailStartupsRecord,
                                    startupTracking:
                                        functions.getFirstStartupTracking(
                                            simpleSearchResults.toList()),
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
                              EdgeInsetsDirectional.fromSTEB(24, 8, 24, 12),
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
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 36, 0),
                                        child: Image.asset(
                                          'assets/images/vitrine-horizontal-dark.png',
                                          height: 38,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 36, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'STARTUP_DETAIL_PAGE_Text_dtr9j1mc_ON_TAP');
                                            logFirebaseEvent(
                                                'Text_Launch-U-R-L');
                                            await launchURL(
                                                'https://www.vitrine.ag/');
                                          },
                                          child: Text(
                                            'Home',
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
                                            0, 0, 36, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'STARTUP_DETAIL_PAGE_Text_lck3bfvw_ON_TAP');
                                            logFirebaseEvent(
                                                'Text_Launch-U-R-L');
                                            await launchURL(
                                                'https://zl4i46dyz9l.typeform.com/to/fARsydsp?typeform-source=www.vitrine.ag');
                                          },
                                          child: Text(
                                            'Cadastre sua Startup',
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
                                            0, 0, 36, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'STARTUP_DETAIL_CompanyRegister_ON_TAP');
                                            logFirebaseEvent(
                                                'CompanyRegister_Launch-U-R-L');
                                            await launchURL(
                                                'https://zl4i46dyz9l.typeform.com/to/xlokvahD');
                                          },
                                          child: Text(
                                            'Cadastre sua Empresa',
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
                                      InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'STARTUP_DETAIL_PAGE_Text_ob7a6kcc_ON_TAP');
                                          logFirebaseEvent('Text_Auth');
                                          GoRouter.of(context)
                                              .prepareAuthEvent();
                                          await signOut();
                                          context.goNamedAuth(
                                              'StartupList', mounted);
                                        },
                                        child: Text(
                                          'Sair',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Rubik',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  FavoriteToggleWidget(
                                    startup: startupDetailStartupsRecord,
                                    startupTracking:
                                        functions.getFirstStartupTracking(
                                            simpleSearchResults.toList()),
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
