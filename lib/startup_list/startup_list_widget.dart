import '../auth/auth_util.dart';
import '../backend/backend.dart';
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
import 'package:text_search/text_search.dart';

class StartupListWidget extends StatefulWidget {
  const StartupListWidget({
    Key? key,
    this.redirectStartupSite,
  }) : super(key: key);

  final String? redirectStartupSite;

  @override
  _StartupListWidgetState createState() => _StartupListWidgetState();
}

class _StartupListWidgetState extends State<StartupListWidget> {
  List<StartupsRecord>? algoliaSearchResults = [];
  TextEditingController? textController;
  List<UserIsLoggedRecord> simpleSearchResults = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      logFirebaseEvent('STARTUP_LIST_StartupList_ON_LOAD');
      logFirebaseEvent('StartupList_Simple-Search');
      await queryUserIsLoggedRecordOnce()
          .then(
            (records) => simpleSearchResults = TextSearch(
              records
                  .map(
                    (record) => TextSearchItem(record, [record.uid!]),
                  )
                  .toList(),
            ).search(currentUserUid).map((r) => r.object).take(1).toList(),
          )
          .onError((_, __) => simpleSearchResults = [])
          .whenComplete(() => setState(() {}));

      if ((simpleSearchResults.length) > 0) {
        if ((widget.redirectStartupSite != null &&
            widget.redirectStartupSite != '')) {
          logFirebaseEvent('StartupList_Navigate-To');
          context.pushNamed(
            'StartupDetail',
            params: {
              'startupSite':
                  serializeParam(widget.redirectStartupSite, ParamType.String),
            }.withoutNulls,
          );
        } else {
          return;
        }
      } else {
        logFirebaseEvent('StartupList_Navigate-To');
        context.pushNamed('IdentifyUser');
      }
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'StartupList'});
    textController = TextEditingController();
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
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
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 20),
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
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
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
                                          .then((r) => algoliaSearchResults = r)
                                          .onError((_, __) =>
                                              algoliaSearchResults = [])
                                          .whenComplete(() => setState(() {}));
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
                      if ((textController!.text == null ||
                          textController!.text == ''))
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            List<StartupsRecord>
                                firebaseListStartupsRecordList = snapshot.data!;
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
                      if ((textController!.text != null &&
                          textController!.text != ''))
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
                            final startup =
                                algoliaSearchResults!?.toList() ?? [];
                            return Wrap(
                              spacing: 20,
                              runSpacing: 20,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children:
                                  List.generate(startup.length, (startupIndex) {
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
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: SvgPicture.asset(
                                'assets/images/logo.svg',
                                height: 31,
                                fit: BoxFit.cover,
                              ),
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
