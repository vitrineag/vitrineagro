import '../auth/firebase_user_provider.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingDeepLinkWidget extends StatefulWidget {
  const LoadingDeepLinkWidget({
    Key? key,
    this.startupSite,
  }) : super(key: key);

  final String? startupSite;

  @override
  _LoadingDeepLinkWidgetState createState() => _LoadingDeepLinkWidgetState();
}

class _LoadingDeepLinkWidgetState extends State<LoadingDeepLinkWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOADING_DEEP_LINK_LoadingDeepLink_ON_LOA');
      logFirebaseEvent('LoadingDeepLink_Update-Local-State');
      setState(() => FFAppState().startupSiteRedirect = widget.startupSite!);
      if (loggedIn) {
        logFirebaseEvent('LoadingDeepLink_Navigate-To');
        context.pushNamed('Loading');
      } else {
        logFirebaseEvent('LoadingDeepLink_Navigate-To');
        context.pushNamed('PhoneAuthentication');
      }
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LoadingDeepLink'});
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
                          child: SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: 184,
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
