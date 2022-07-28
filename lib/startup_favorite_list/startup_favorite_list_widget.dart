import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/mobile_drawer_widget.dart';
import '../components/startup_card_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StartupFavoriteListWidget extends StatefulWidget {
  const StartupFavoriteListWidget({Key? key}) : super(key: key);

  @override
  _StartupFavoriteListWidgetState createState() =>
      _StartupFavoriteListWidgetState();
}

class _StartupFavoriteListWidgetState extends State<StartupFavoriteListWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'StartupFavoriteList'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFFEEC9),
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
                alignment: AlignmentDirectional(0, -1),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30, 16, 30, 16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/logo.svg',
                                    width: 114,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 12),
                        child: Text(
                          'Favoritos',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Rubik',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontSize: 24,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child:
                            StreamBuilder<List<UserFavoritiesStartupsRecord>>(
                          stream: queryUserFavoritiesStartupsRecord(
                            queryBuilder: (userFavoritiesStartupsRecord) =>
                                userFavoritiesStartupsRecord.where('user',
                                    isEqualTo: currentUserReference),
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
                                wrapUserFavoritiesStartupsRecordList =
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
                                  wrapUserFavoritiesStartupsRecordList.length,
                                  (wrapIndex) {
                                final wrapUserFavoritiesStartupsRecord =
                                    wrapUserFavoritiesStartupsRecordList[
                                        wrapIndex];
                                return StreamBuilder<StartupsRecord>(
                                  stream: StartupsRecord.getDocument(
                                      wrapUserFavoritiesStartupsRecord
                                          .startup!),
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
                                    final containerStartupsRecord =
                                        snapshot.data!;
                                    return Container(
                                      width: 336,
                                      decoration: BoxDecoration(),
                                      child: StartupCardWidget(
                                        startup: containerStartupsRecord,
                                      ),
                                    );
                                  },
                                );
                              }),
                            );
                          },
                        ),
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
                                    'STARTUP_FAVORITE_LIST_menu_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_Drawer');
                                scaffoldKey.currentState!.openDrawer();
                              },
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'STARTUP_FAVORITE_LIST_VITRINE_BTN_ON_TAP');
                                logFirebaseEvent('Button_Navigate-To');
                                context.pushNamed('StartupList');
                              },
                              text: 'Vitrine',
                              icon: Icon(
                                Icons.assignment_outlined,
                                color: Color(0xFFFCC800),
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
                                  child: SvgPicture.asset(
                                    'assets/images/logo.svg',
                                    height: 31,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 36, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'STARTUP_FAVORITE_LIST_Text_z4pjtsdx_ON_T');
                                      logFirebaseEvent('Text_Launch-U-R-L');
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
                                          'STARTUP_FAVORITE_LIST_Text_535hdwcb_ON_T');
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
                                InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'STARTUP_FAVORITE_LIST_Text_mhwo5b0y_ON_T');
                                    logFirebaseEvent('Text_Auth');
                                    GoRouter.of(context).prepareAuthEvent();
                                    await signOut();
                                    context.goNamedAuth(
                                        'PhoneAuthentication', mounted);
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
                                    'STARTUP_FAVORITE_LIST_FAVORITOS_BTN_ON_T');
                                logFirebaseEvent('Button_Navigate-To');
                                context.pushNamed('StartupList');
                              },
                              text: 'favoritos',
                              icon: Icon(
                                Icons.star_sharp,
                                color: Color(0xFFFFCE60),
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
