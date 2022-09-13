import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingLinkedinWidget extends StatefulWidget {
  const LoadingLinkedinWidget({
    Key? key,
    this.startupSite,
  }) : super(key: key);

  final String? startupSite;

  @override
  _LoadingLinkedinWidgetState createState() => _LoadingLinkedinWidgetState();
}

class _LoadingLinkedinWidgetState extends State<LoadingLinkedinWidget> {
  ApiCallResponse? linkedinJwt;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOADING_LINKEDIN_LoadingLinkedin_ON_LOAD');
      logFirebaseEvent('LoadingLinkedin_Backend-Call');
      linkedinJwt = await GetLinkedinJwtCall.call(
        redirectUri: 'https://vitrine-agro-mfma7u.flutterflow.app/linkedinSign',
        authCode: functions.getQueryParam('code'),
      );
      if ((linkedinJwt?.succeeded ?? true)) {
        logFirebaseEvent('LoadingLinkedin_Auth');
        GoRouter.of(context).prepareAuthEvent();
        final user = await signInWithJwtToken(
          context,
          getJsonField(
            (linkedinJwt?.jsonBody ?? ''),
            r'''$.jwt''',
          ).toString(),
        );
        if (user == null) {
          return;
        }

        logFirebaseEvent('LoadingLinkedin_Custom-Action');
        await actions.setUserEmail(
          getJsonField(
            (linkedinJwt?.jsonBody ?? ''),
            r'''$.email''',
          ).toString(),
        );
        logFirebaseEvent('LoadingLinkedin_Backend-Call');

        final usersUpdateData = createUsersRecordData(
          email: getJsonField(
            (linkedinJwt?.jsonBody ?? ''),
            r'''$.email''',
          ).toString(),
          displayName: valueOrDefault<String>(
            getJsonField(
              (linkedinJwt?.jsonBody ?? ''),
              r'''$.name''',
            ).toString(),
            '\$.name',
          ),
        );
        await currentUserReference!.update(usersUpdateData);
        logFirebaseEvent('LoadingLinkedin_Navigate-To');

        context.goNamedAuth('Loading', mounted);
      } else {
        logFirebaseEvent('LoadingLinkedin_Navigate-To');

        context.pushNamedAuth('PhoneAuthentication', mounted);

        logFirebaseEvent('LoadingLinkedin_Show-Snack-Bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Não foi possível realizar o login via linkedin, tente novamente mais tarde',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Color(0x00000000),
          ),
        );
      }
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LoadingLinkedin'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: SvgPicture.asset(
                    'assets/images/bg_dec_bot.svg',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
                          child: Image.asset(
                            'assets/images/vitrine-horizontal-dark.png',
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        child: custom_widgets.CustomCircularProgressIndicador(
                          width: 60,
                          height: 60,
                          color: Color(0xFFFFA133),
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
    );
  }
}
