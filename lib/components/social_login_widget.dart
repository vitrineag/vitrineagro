import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialLoginWidget extends StatefulWidget {
  const SocialLoginWidget({
    Key? key,
    this.user,
  }) : super(key: key);

  final DocumentReference? user;

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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.info_outline_rounded,
              color: Colors.black,
              size: 60,
            ),
            Expanded(
              child: Text(
                'Gostou da vitrine? Faça o login e veja muito mais',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Rubik',
                      fontSize: 22,
                    ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () async {
                  logFirebaseEvent('SOCIAL_LOGIN_Container_nenhhv5p_ON_TAP');
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
                    color: Color(0xFF090F13),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x3314181B),
                        offset: Offset(0, 2),
                      )
                    ],
                    shape: BoxShape.circle,
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF090F13),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(0x3314181B),
                      offset: Offset(0, 2),
                    )
                  ],
                  shape: BoxShape.circle,
                ),
                alignment: AlignmentDirectional(0, 0),
                child: FaIcon(
                  FontAwesomeIcons.apple,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF090F13),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(0x3314181B),
                      offset: Offset(0, 2),
                    )
                  ],
                  shape: BoxShape.circle,
                ),
                alignment: AlignmentDirectional(0, 0),
                child: FaIcon(
                  FontAwesomeIcons.facebookF,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              InkWell(
                onTap: () async {
                  logFirebaseEvent('SOCIAL_LOGIN_Container_kgl6fz3w_ON_TAP');
                  logFirebaseEvent('Container_Auth');
                  GoRouter.of(context).prepareAuthEvent();
                  await signOut();
                  context.goNamedAuth('StartupList', mounted);
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF090F13),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x3314181B),
                        offset: Offset(0, 2),
                      )
                    ],
                    shape: BoxShape.circle,
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: Icon(
                    Icons.phone_sharp,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
