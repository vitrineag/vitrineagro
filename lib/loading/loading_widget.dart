import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      logFirebaseEvent('LOADING_PAGE_Loading_ON_PAGE_LOAD');
      logFirebaseEvent('Loading_Wait-Delay');
      await Future.delayed(const Duration(milliseconds: 1000));
      if ((currentUserDisplayName) != '') {
        logFirebaseEvent('Loading_Navigate-To');
        context.pushNamed('StartupList');
      } else {
        logFirebaseEvent('Loading_Navigate-To');
        context.pushNamed('IdentifyUser');
      }
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Loading'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                          child: SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: double.infinity,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                        child: Container(
                          width: 60,
                          height: 60,
                          child: custom_widgets.CustomCircularProgressIndicador(
                            width: 60,
                            height: 60,
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
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
