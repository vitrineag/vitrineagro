import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileDrawerWidget extends StatefulWidget {
  const MobileDrawerWidget({Key? key}) : super(key: key);

  @override
  _MobileDrawerWidgetState createState() => _MobileDrawerWidgetState();
}

class _MobileDrawerWidgetState extends State<MobileDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(41, 71, 32, 33),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/vitrine-horizontal-dark.png',
              height: 46,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 28),
                  child: InkWell(
                    onTap: () async {
                      logFirebaseEvent('MOBILE_DRAWER_COMP_Home_ON_TAP');
                      logFirebaseEvent('Home_Launch-U-R-L');
                      await launchURL('https://www.vitrine.ag/');
                    },
                    child: Text(
                      'Home',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Rubik',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 28),
                  child: InkWell(
                    onTap: () async {
                      logFirebaseEvent('MOBILE_DRAWER_StartupRegister_ON_TAP');
                      logFirebaseEvent('StartupRegister_Launch-U-R-L');
                      await launchURL(
                          'https://zl4i46dyz9l.typeform.com/to/fARsydsp?typeform-source=www.vitrine.ag');
                    },
                    child: Text(
                      'Cadastre sua Startup',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Rubik',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 28),
                  child: InkWell(
                    onTap: () async {
                      logFirebaseEvent('MOBILE_DRAWER_CompanyRegister_ON_TAP');
                      logFirebaseEvent('CompanyRegister_Launch-U-R-L');
                      await launchURL(
                          'https://zl4i46dyz9l.typeform.com/to/xlokvahD');
                    },
                    child: Text(
                      'Cadastre sua Empresa',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Rubik',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    logFirebaseEvent('MOBILE_DRAWER_COMP_Logout_ON_TAP');
                    logFirebaseEvent('Logout_Auth');
                    GoRouter.of(context).prepareAuthEvent();
                    await signOut();
                    context.goNamedAuth('PhoneAuthentication', mounted);
                  },
                  child: Text(
                    'Sair',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Rubik',
                          color: FlutterFlowTheme.of(context).alternate,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'versão 1.0',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
