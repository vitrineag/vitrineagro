import '../backend/backend.dart';
import '../components/toggle_icon_button_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../startup_detail/startup_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StartupCardWidget extends StatefulWidget {
  const StartupCardWidget({
    Key? key,
    this.startup,
    this.isFavorite,
  }) : super(key: key);

  final StartupsRecord? startup;
  final bool? isFavorite;

  @override
  _StartupCardWidgetState createState() => _StartupCardWidgetState();
}

class _StartupCardWidgetState extends State<StartupCardWidget> {
  @override
  Widget build(BuildContext context) {
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
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                            fit: BoxFit.cover,
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
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Text(
                              widget.startup!.name!,
                              textAlign: TextAlign.start,
                              style:
                                  FlutterFlowTheme.of(context).title1.override(
                                        fontFamily: 'Rubik',
                                        color: Color(0xFF022B43),
                                        fontWeight: FontWeight.w500,
                                      ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFD6EFE8),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                              child: Text(
                                widget.startup!.category!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: Color(0xFF12654E),
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 6, 0),
                              child: Text(
                                widget.startup!.country!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: Color(0xFF576771),
                                      fontSize: 12,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                              child: Text(
                                widget.startup!.state!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: Color(0xFF576771),
                                      fontSize: 12,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: Text(
                            widget.startup!.city!,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Rubik',
                                      color: Color(0xFF576771),
                                      fontSize: 12,
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
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
              child: Text(
                widget.startup!.valueProposalText!,
                maxLines: 1,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Rubik',
                      color: Color(0xFF032B44),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
              child: Text(
                widget.startup!.problemResolutionText!,
                maxLines: 3,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Rubik',
                      color: Color(0xFF032B44),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
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
                      'Setores que atua',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Rubik',
                            color: Color(0xA7032B44),
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      widget.startup!.businessModel!,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
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
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Rubik',
                            color: Color(0xA7032B44),
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      widget.startup!.customerNiche!,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
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
                      'assets/images/graph.svg',
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
                      'Maturidade da startup',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Rubik',
                            color: Color(0xA5032B44),
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      widget.startup!.maturity!,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
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
              padding: EdgeInsetsDirectional.fromSTEB(0, 36, 0, 0),
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
                          onPressed: () {
                            print('Share pressed ...');
                          },
                        ),
                      ),
                      ToggleIconButtonWidget(
                        activeIcon: Icon(
                          Icons.star_sharp,
                          color: Color(0xFFFCC800),
                        ),
                        inactiveIcon: Icon(
                          Icons.star_outline,
                        ),
                        isActive: widget.isFavorite,
                        size: 44.0,
                      ),
                    ],
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('STARTUP_CARD_COMP_MoreInfo_ON_TAP');
                      logFirebaseEvent('MoreInfo_Navigate-To');
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StartupDetailWidget(
                            startup: widget.startup,
                          ),
                        ),
                      );
                    },
                    text: 'saiba mais',
                    options: FFButtonOptions(
                      width: 160,
                      height: 44,
                      color: Color(0xFF032B45),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
