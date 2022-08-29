import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/activity_horizontal_list_widget.dart';
import '../components/social_login_widget.dart';
import '../components/toggle_icon_button_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:text_search/text_search.dart';

class StartupCardWidget extends StatefulWidget {
  const StartupCardWidget({
    Key? key,
    this.startup,
  }) : super(key: key);

  final StartupsRecord? startup;

  @override
  _StartupCardWidgetState createState() => _StartupCardWidgetState();
}

class _StartupCardWidgetState extends State<StartupCardWidget> {
  List<StartupTrackingRecord> simpleSearchResults1 = [];
  List<StartupTrackingRecord> simpleSearchResults2 = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserFavoritiesStartupsRecord>>(
      stream: queryUserFavoritiesStartupsRecord(
        queryBuilder: (userFavoritiesStartupsRecord) =>
            userFavoritiesStartupsRecord
                .where('startup', isEqualTo: widget.startup!.reference)
                .where('user', isEqualTo: currentUserReference),
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
        List<UserFavoritiesStartupsRecord>
            cardUserFavoritiesStartupsRecordList = snapshot.data!;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 7,
                color: Color(0x2F1D2429),
                offset: Offset(0, 3),
              )
            ],
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 350,
                  constraints: BoxConstraints(
                    maxWidth: 356,
                  ),
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 19, 0, 22),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 24, 0),
                          child: Container(
                            width: 128,
                            height: 128,
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8,
                                  color: Color(0x2A000000),
                                  offset: Offset(0, 12),
                                  spreadRadius: 1,
                                )
                              ],
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.network(
                                widget.startup!.logo!,
                                width: 128,
                                height: 128,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 180,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  widget.startup!.name!,
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Rubik',
                                        color: Color(0xFF022B43),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              width: 180,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (widget.startup!.country == 'Brasil')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 4, 0),
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/1200px-Flag_of_Brazil.svg.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 0, 0, 0),
                                            child: Text(
                                              widget.startup!.country!,
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        color:
                                                            Color(0xFF576771),
                                                        fontSize: 12,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 160,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: AutoSizeText(
                                  '${widget.startup!.city}, ${widget.startup!.state}',
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Rubik',
                                        color: Color(0xFF576771),
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFEEC9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      child: Text(
                        functions.getCategory(widget.startup!),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Rubik',
                              color: FlutterFlowTheme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 65,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.startup!.valueProposalText!
                              .maybeHandleOverflow(
                            maxChars: 100,
                            replacement: '…',
                          ),
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Rubik',
                                    color: Color(0xFF032B44),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 160,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        functions
                            .removeAllLineBreaks(
                                widget.startup!.problemResolutionText!)
                            .maybeHandleOverflow(
                              maxChars: 300,
                              replacement: '…',
                            ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Rubik',
                              color: Color(0xFF032B44),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 24),
                    child: ActivityHorizontalListWidget(
                      startup: widget.startup,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 14, 0),
                      child: Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(),
                        child: SvgPicture.asset(
                          'assets/images/suitcase.svg',
                          width: 46,
                          height: 46,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Modelo de negócio',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Rubik',
                                    color: Color(0xA7032B44),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        Text(
                          widget.startup!.businessModel!.maybeHandleOverflow(
                            maxChars: 30,
                            replacement: '…',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Rubik',
                                    color: Color(0xFF032B44),
                                    fontSize: 16,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  height: 12,
                  thickness: 2,
                  color: Color(0xFFEFEFEF),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 14, 0),
                      child: Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(),
                        child: SvgPicture.asset(
                          'assets/images/goal.svg',
                          width: 46,
                          height: 46,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nicho de clientes',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Rubik',
                                    color: Color(0xA7032B44),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        Text(
                          widget.startup!.customerNiche!,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Rubik',
                                    color: Color(0xFF032B44),
                                    fontSize: 16,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: FlutterFlowIconButton(
                              borderColor: Color(0xFFE2E2E2),
                              borderRadius: 300,
                              borderWidth: 1,
                              buttonSize: 44,
                              icon: Icon(
                                Icons.share_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'STARTUP_CARD_COMP_ShareStartup_ON_TAP');
                                logFirebaseEvent('ShareStartup_Share');
                                await Share.share(
                                    'https://app.vitrine.ag/#/loadingDeepLink/${functions.encodeUri(widget.startup!.site!)}');
                                logFirebaseEvent(
                                    'ShareStartup_Google-Analytics-Event');
                                logFirebaseEvent(
                                  'share_startup',
                                  parameters: {
                                    'startup_name': widget.startup!.name,
                                  },
                                );
                                logFirebaseEvent('ShareStartup_Simple-Search');
                                await queryStartupTrackingRecordOnce()
                                    .then(
                                      (records) => simpleSearchResults1 =
                                          TextSearch(
                                        records
                                            .map(
                                              (record) => TextSearchItem(record,
                                                  [record.startupSite!]),
                                            )
                                            .toList(),
                                      )
                                              .search(widget.startup!.site!)
                                              .map((r) => r.object)
                                              .take(1)
                                              .toList(),
                                    )
                                    .onError(
                                        (_, __) => simpleSearchResults1 = [])
                                    .whenComplete(() => setState(() {}));

                                logFirebaseEvent('ShareStartup_Backend-Call');

                                final startupTrackingUpdateData = {
                                  'share': FieldValue.increment(1),
                                };
                                await functions
                                    .getFirstStartupTracking(
                                        simpleSearchResults1.toList())
                                    .reference
                                    .update(startupTrackingUpdateData);
                              },
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'STARTUP_CARD_COMP_FavoriteStartup_ON_TAP');
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.isGuest, false)) {
                                logFirebaseEvent(
                                    'FavoriteStartup_Bottom-Sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Color(0xFFFFFEFE),
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        child: SocialLoginWidget(
                                          user: currentUserReference,
                                        ),
                                      ),
                                    );
                                  },
                                );
                                return;
                              }
                              if (cardUserFavoritiesStartupsRecordList.length >
                                  0) {
                                logFirebaseEvent(
                                    'FavoriteStartup_Backend-Call');
                                await functions
                                    .getFirstFavoritiesStartups(
                                        cardUserFavoritiesStartupsRecordList
                                            .toList())
                                    .reference
                                    .delete();
                              } else {
                                logFirebaseEvent(
                                    'FavoriteStartup_Backend-Call');

                                final userFavoritiesStartupsCreateData =
                                    createUserFavoritiesStartupsRecordData(
                                  createDate: getCurrentTimestamp,
                                  startup: widget.startup!.reference,
                                  user: currentUserReference,
                                  userName: currentUserDisplayName,
                                  userPhone: currentPhoneNumber,
                                );
                                await UserFavoritiesStartupsRecord.collection
                                    .doc()
                                    .set(userFavoritiesStartupsCreateData);
                              }

                              logFirebaseEvent('FavoriteStartup_Simple-Search');
                              await queryStartupTrackingRecordOnce()
                                  .then(
                                    (records) => simpleSearchResults2 =
                                        TextSearch(
                                      records
                                          .map(
                                            (record) => TextSearchItem(
                                                record, [record.startupSite!]),
                                          )
                                          .toList(),
                                    )
                                            .search(widget.startup!.site!)
                                            .map((r) => r.object)
                                            .take(1)
                                            .toList(),
                                  )
                                  .onError((_, __) => simpleSearchResults2 = [])
                                  .whenComplete(() => setState(() {}));

                              logFirebaseEvent('FavoriteStartup_Backend-Call');

                              final startupTrackingUpdateData = {
                                'favorited': FieldValue.increment(1),
                              };
                              await functions
                                  .getFirstStartupTracking(
                                      simpleSearchResults2.toList())
                                  .reference
                                  .update(startupTrackingUpdateData);
                            },
                            child: ToggleIconButtonWidget(
                              activeIcon: Icon(
                                Icons.star_sharp,
                                color: Color(0xFFFCC800),
                              ),
                              inactiveIcon: Icon(
                                Icons.star_outline,
                              ),
                              isActive:
                                  cardUserFavoritiesStartupsRecordList.length >
                                      0,
                              size: 44.0,
                            ),
                          ),
                        ],
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'STARTUP_CARD_COMP_SaibaMaisLista_ON_TAP');
                          if (valueOrDefault<bool>(
                              currentUserDocument?.isGuest, false)) {
                            logFirebaseEvent('SaibaMaisLista_Bottom-Sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Color(0xFFFFFEFE),
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    child: SocialLoginWidget(
                                      user: currentUserReference,
                                    ),
                                  ),
                                );
                              },
                            );
                            return;
                          }
                          logFirebaseEvent('SaibaMaisLista_Navigate-To');
                          context.pushNamed(
                            'StartupDetail',
                            params: {
                              'startupSite': serializeParam(
                                  widget.startup!.site, ParamType.String),
                            }.withoutNulls,
                          );
                        },
                        text: 'saiba mais',
                        options: FFButtonOptions(
                          width: 160,
                          height: 44,
                          color: Color(0xFFFFCE60),
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Rubik',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontWeight: FontWeight.normal,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
