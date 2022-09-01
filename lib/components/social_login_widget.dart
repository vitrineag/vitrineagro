import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialLoginWidget extends StatefulWidget {
  const SocialLoginWidget({
    Key? key,
    this.user,
    this.isInLogin,
  }) : super(key: key);

  final DocumentReference? user;
  final bool? isInLogin;

  @override
  _SocialLoginWidgetState createState() => _SocialLoginWidgetState();
}

class _SocialLoginWidgetState extends State<SocialLoginWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBtnText,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (widget.isInLogin ?? true)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 19),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 14, 0),
                    child: SvgPicture.asset(
                      'assets/images/star.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gostou da vitrine?',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Rubik',
                              fontSize: 24,
                            ),
                      ),
                      Text(
                        'Faça o login e veja muito mais',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Rubik',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 22),
            child: Container(
              width: MediaQuery.of(context).size.width,
              constraints: BoxConstraints(
                maxWidth: 274,
              ),
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(1, 1, 1, 1),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'SOCIAL_LOGIN_Container_nenhhv5p_ON_TAP');
                          logFirebaseEvent('Container_Auth');
                          GoRouter.of(context).prepareAuthEvent();
                          final user = await signInWithGoogle(context);
                          if (user == null) {
                            return;
                          }
                          context.goNamedAuth('Loading', mounted);
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: Color(0x3314181B),
                                offset: Offset(0, 0),
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: SvgPicture.asset(
                            'assets/images/google.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    if (widget.isInLogin ?? true)
                      InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'SOCIAL_LOGIN_Container_kgl6fz3w_ON_TAP');
                          logFirebaseEvent('Container_Navigate-To');
                          context.pushNamed('PhoneAuthentication');
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: Color(0x3314181B),
                                offset: Offset(0, 3),
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: SvgPicture.asset(
                            'assets/images/phone.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Text(
            'Os dados do seu login serão utilizados somente para\nfins de identificação na plataforma, não enviaremos\nqualquer tipo de comunicado ou mensagem.',
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Rubik',
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                  lineHeight: 1.5,
                ),
          ),
        ],
      ),
    );
  }
}
