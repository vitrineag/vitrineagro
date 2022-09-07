import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  List<UserIsLoggedRecord> simpleSearchResults = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOADING_PAGE_Loading_ON_PAGE_LOAD');
      if (functions.isDeepLinkingToDetail()) {
        return;
      }

      logFirebaseEvent('Loading_Simple-Search');
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

      if (simpleSearchResults.length > 0) {
        logFirebaseEvent('Loading_Navigate-To');
        context.pushNamed('StartupList');
      } else {
        logFirebaseEvent('Loading_Navigate-To');
        context.pushNamed('IdentifyUser');
      }
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Loading'});
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
