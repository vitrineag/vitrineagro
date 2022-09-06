import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../components/mobile_drawer_widget.dart';
import '../components/startup_card_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StartupListWidget extends StatefulWidget {
  const StartupListWidget({
    Key? key,
    this.startupSite,
  }) : super(key: key);

  final String? startupSite;

  @override
  _StartupListWidgetState createState() => _StartupListWidgetState();
}

class _StartupListWidgetState extends State<StartupListWidget> {
  List<StartupsRecord>? algoliaSearchResults = [];
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('STARTUP_LIST_StartupList_ON_LOAD');
      if (widget.startupSite != null && widget.startupSite != '') {
        logFirebaseEvent('StartupList_Navigate-To');
        context.pushNamed(
          'StartupDetail',
          params: {
            'startupSite': serializeParam(widget.startupSite, ParamType.String),
          }.withoutNulls,
        );
      }
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'StartupList'});
    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
      drawer: Drawer(
        elevation: 16,
        child: MobileDrawerWidget(),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(-1, 1),
                child: SvgPicture.asset(
                  'assets/images/bg_dec_left.svg',
                  height: MediaQuery.of(context).size.height * 0.6,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1, 1),
                child: SvgPicture.asset(
                  'assets/images/bg_dec_right.svg',
                  height: MediaQuery.of(context).size.height * 0.35,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  constraints: BoxConstraints(
                    maxWidth: 1100,
                  ),
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25, 16, 25, 16),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/vitrine-horizontal-dark.png',
                                      width: 114,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(30, 0, 30, 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            constraints: BoxConstraints(
                              maxWidth: 1000,
                            ),
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: TextFormField(
                                    controller: textController,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      'textController',
                                      Duration(milliseconds: 1000),
                                      () async {
                                        logFirebaseEvent(
                                            'STARTUP_LIST_TextField_rfxzfyij_ON_TEXTF');
                                        logFirebaseEvent(
                                            'TextField_Algolia-Search');
                                        setState(
                                            () => algoliaSearchResults = null);
                                        await StartupsRecord.search(
                                          term: functions.replaceCommaToSpace(
                                              textController!.text),
                                        )
                                            .then(
                                                (r) => algoliaSearchResults = r)
                                            .onError((_, __) =>
                                                algoliaSearchResults = [])
                                            .whenComplete(
                                                () => setState(() {}));

                                        logFirebaseEvent(
                                            'TextField_Google-Analytics-Event');
                                        logFirebaseEvent(
                                          'filter',
                                          parameters: {
                                            'term': textController!.text,
                                          },
                                        );
                                      },
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Digite a busca',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFEAEAEA),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              17, 13, 25, 8),
                                      suffixIcon: Icon(
                                        Icons.filter_alt_outlined,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF0F0F0F),
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Text(
                                  'Filtre startups por nome, segmento ou qualquer preferência desejada (para separar os temas utilize vírgula)',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (textController!.text == null ||
                            textController!.text == '')
                          StreamBuilder<List<StartupsRecord>>(
                            stream: queryStartupsRecord(
                              queryBuilder: (startupsRecord) =>
                                  startupsRecord.orderBy('isOpenWithoutAuth',
                                      descending: true),
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
                              List<StartupsRecord>
                                  firebaseListStartupsRecordList =
                                  snapshot.data!;
                              return Wrap(
                                spacing: 20,
                                runSpacing: 20,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: List.generate(
                                    firebaseListStartupsRecordList.length,
                                    (firebaseListIndex) {
                                  final firebaseListStartupsRecord =
                                      firebaseListStartupsRecordList[
                                          firebaseListIndex];
                                  return Container(
                                    width: 336,
                                    decoration: BoxDecoration(),
                                    child: StartupCardWidget(
                                      startup: firebaseListStartupsRecord,
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        if (textController!.text != null &&
                            textController!.text != '')
                          Builder(
                            builder: (context) {
                              if (algoliaSearchResults! == null) {
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
                              final startup = algoliaSearchResults!.toList();
                              return Wrap(
                                spacing: 20,
                                runSpacing: 20,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: List.generate(startup.length,
                                    (startupIndex) {
                                  final startupItem = startup[startupIndex];
                                  return Container(
                                    width: 336,
                                    decoration: BoxDecoration(),
                                    child: StartupCardWidget(
                                      startup: startupItem,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: Container(
                            width: 311,
                            decoration: BoxDecoration(),
                          ),
                        ),
                      ],
                    ),
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
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 12),
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
                            color: Color(0x6E000000),
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
                              buttonSize: 60,
                              icon: Icon(
                                Icons.menu,
                                color: Color(0xFF0F0F0F),
                                size: 32,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'STARTUP_LIST_PAGE_menu_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_Drawer');
                                scaffoldKey.currentState!.openDrawer();
                              },
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'STARTUP_LIST_PAGE_FAVORITOS_BTN_ON_TAP');
                                if (valueOrDefault<bool>(
                                    currentUserDocument?.isGuest, false)) {
                                  logFirebaseEvent('Button_Navigate-To');
                                  context.pushNamed('PhoneAuthentication');
                                  return;
                                }
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
                                height: 44,
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
                                elevation: 0,
                                borderSide: BorderSide(
                                  color: Color(0xFF0F0F0F),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(22),
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
                      height: 72,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 32,
                            color: Color(0x29000000),
                            offset: Offset(0, 12),
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
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 36, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'STARTUP_LIST_PAGE_Image_gwplsdqh_ON_TAP');
                                      logFirebaseEvent('Image_Launch-U-R-L');
                                      await launchURL(
                                          'https://www.vitrine.ag/');
                                    },
                                    child: Image.asset(
                                      'assets/images/vitrine-horizontal-dark.png',
                                      height: 38,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 36, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'STARTUP_LIST_PAGE_Text_6nyvee0k_ON_TAP');
                                      logFirebaseEvent('Text_Navigate-To');
                                      context.pushNamed('StartupList');
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
                                          'STARTUP_LIST_PAGE_Text_vx2w7quj_ON_TAP');
                                      logFirebaseEvent('Text_Launch-U-R-L');
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
                                if (loggedIn)
                                  InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'STARTUP_LIST_PAGE_Text_l9uj8asi_ON_TAP');
                                      logFirebaseEvent('Text_Auth');
                                      GoRouter.of(context).prepareAuthEvent();
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
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                              ],
                            ),
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
                                height: 44,
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
                                elevation: 0,
                                borderSide: BorderSide(
                                  color: Color(0xFF0F0F0F),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(22),
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
      ),
    );
  }
}
