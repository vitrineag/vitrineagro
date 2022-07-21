import '../backend/backend.dart';
import '../components/startup_card_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StartupListWidget extends StatefulWidget {
  const StartupListWidget({Key? key}) : super(key: key);

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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: Container(
                          width: 311,
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
                                  autofocus: true,
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
                                'Filtre startups por nome, segmento ou qualquer preferência desejada.',
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
                      Builder(
                        builder: (context) {
                          if (algoliaSearchResults! == null) {
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
                          final startup = algoliaSearchResults!?.toList() ?? [];
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: startup.length,
                            itemBuilder: (context, startupIndex) {
                              final startupItem = startup[startupIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 20),
                                child: StartupCardWidget(
                                  startup: startupItem,
                                ),
                              );
                            },
                          );
                        },
                      ),
                      if ((random_data.randomInteger(1, 99)) == 0)
                        FutureBuilder<List<StartupsRecord>>(
                          future: StartupsRecord.search(
                            term: functions
                                .replaceCommaToSpace(textController!.text),
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
                            List<StartupsRecord> wrapStartupsRecordList =
                                snapshot.data!;
                            // Customize what your widget looks like with no search results.
                            if (snapshot.data!.isEmpty) {
                              return Container(
                                height: 100,
                                child: Center(
                                  child: Text('No results.'),
                                ),
                              );
                            }
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
                                  child: StartupCardWidget(
                                    startup: wrapStartupsRecord,
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
            ],
          ),
        ),
      ),
    );
  }
}
