import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class FavoriteToggleWidget extends StatefulWidget {
  const FavoriteToggleWidget({
    Key? key,
    this.startup,
  }) : super(key: key);

  final StartupsRecord? startup;

  @override
  _FavoriteToggleWidgetState createState() => _FavoriteToggleWidgetState();
}

class _FavoriteToggleWidgetState extends State<FavoriteToggleWidget> {
  List<StartupTrackingRecord> simpleSearchResults = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserFavoritiesStartupsRecord>>(
      stream: queryUserFavoritiesStartupsRecord(
        queryBuilder: (userFavoritiesStartupsRecord) =>
            userFavoritiesStartupsRecord
                .where('startup', isEqualTo: widget.startup!.reference)
                .where('user', isEqualTo: currentUserReference),
        limit: 1,
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
            containerUserFavoritiesStartupsRecordList = snapshot.data!;
        return InkWell(
          onTap: () async {
            logFirebaseEvent('FAVORITE_TOGGLE_Container_82tpyhcc_ON_TA');
            logFirebaseEvent('Container_Simple-Search');
            await queryStartupTrackingRecordOnce()
                .then(
                  (records) => simpleSearchResults = TextSearch(
                    records
                        .map(
                          (record) =>
                              TextSearchItem(record, [record.startupSite!]),
                        )
                        .toList(),
                  )
                      .search(widget.startup!.site!)
                      .map((r) => r.object)
                      .take(1)
                      .toList(),
                )
                .onError((_, __) => simpleSearchResults = [])
                .whenComplete(() => setState(() {}));

            logFirebaseEvent('Container_Backend-Call');

            final startupTrackingUpdateData = {
              'favorited': FieldValue.increment(1),
            };
            await functions
                .getFirstStartupTracking(simpleSearchResults1.toList())
                .reference
                .update(startupTrackingUpdateData);
          },
          child: Container(
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                if ((containerUserFavoritiesStartupsRecordList.length == 0))
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 45,
                    icon: Icon(
                      Icons.star_border,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 30,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('FAVORITE_TOGGLE_COMP_Favorite_ON_TAP');
                      logFirebaseEvent('Favorite_Backend-Call');

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
                    },
                  ),
                if ((containerUserFavoritiesStartupsRecordList.length > 0))
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 45,
                    icon: Icon(
                      Icons.star_sharp,
                      color: Color(0xFFFFCE60),
                      size: 30,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'FAVORITE_TOGGLE_COMP_FavoriteFill_ON_TAP');
                      logFirebaseEvent('FavoriteFill_Backend-Call');
                      await functions
                          .getFirstFavoritiesStartups(
                              containerUserFavoritiesStartupsRecordList
                                  .toList())
                          .reference
                          .delete();
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
