import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/startup_card_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CustomerFavoriteListWidget extends StatefulWidget {
  const CustomerFavoriteListWidget({Key? key}) : super(key: key);

  @override
  _CustomerFavoriteListWidgetState createState() =>
      _CustomerFavoriteListWidgetState();
}

class _CustomerFavoriteListWidgetState
    extends State<CustomerFavoriteListWidget> {
  PagingController<DocumentSnapshot?, UserFavoritiesStartupsRecord>?
      _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CustomerFavoriteList'});
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      PagedListView<DocumentSnapshot<Object?>?,
                          UserFavoritiesStartupsRecord>(
                        pagingController: () {
                          final Query<Object?> Function(Query<Object?>)
                              queryBuilder = (userFavoritiesStartupsRecord) =>
                                  userFavoritiesStartupsRecord.where('user',
                                      isEqualTo: currentUserReference);
                          if (_pagingController != null) {
                            final query = queryBuilder(
                                UserFavoritiesStartupsRecord.collection);
                            if (query != _pagingQuery) {
                              // The query has changed
                              _pagingQuery = query;
                              _streamSubscriptions.forEach((s) => s?.cancel());
                              _streamSubscriptions.clear();
                              _pagingController!.refresh();
                            }
                            return _pagingController!;
                          }

                          _pagingController =
                              PagingController(firstPageKey: null);
                          _pagingQuery = queryBuilder(
                              UserFavoritiesStartupsRecord.collection);
                          _pagingController!
                              .addPageRequestListener((nextPageMarker) {
                            queryUserFavoritiesStartupsRecordPage(
                              queryBuilder: (userFavoritiesStartupsRecord) =>
                                  userFavoritiesStartupsRecord.where('user',
                                      isEqualTo: currentUserReference),
                              nextPageMarker: nextPageMarker,
                              pageSize: 5,
                              isStream: true,
                            ).then((page) {
                              _pagingController!.appendPage(
                                page.data,
                                page.nextPageMarker,
                              );
                              final streamSubscription =
                                  page.dataStream?.listen((data) {
                                final itemIndexes = _pagingController!.itemList!
                                    .asMap()
                                    .map((k, v) => MapEntry(v.reference.id, k));
                                data.forEach((item) {
                                  final index = itemIndexes[item.reference.id];
                                  final items = _pagingController!.itemList!;
                                  if (index != null) {
                                    items
                                        .replaceRange(index, index + 1, [item]);
                                    _pagingController!.itemList = {
                                      for (var item in items)
                                        item.reference: item
                                    }.values.toList();
                                  }
                                });
                                setState(() {});
                              });
                              _streamSubscriptions.add(streamSubscription);
                            });
                          });
                          return _pagingController!;
                        }(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        builderDelegate: PagedChildBuilderDelegate<
                            UserFavoritiesStartupsRecord>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          ),

                          itemBuilder: (context, _, listViewIndex) {
                            final listViewUserFavoritiesStartupsRecord =
                                _pagingController!.itemList![listViewIndex];
                            return Wrap(
                              spacing: 24,
                              runSpacing: 16,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 336,
                                  decoration: BoxDecoration(),
                                  child: StreamBuilder<StartupsRecord>(
                                    stream: StartupsRecord.getDocument(
                                        listViewUserFavoritiesStartupsRecord!
                                            .startup!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      final startupCardStartupsRecord =
                                          snapshot.data!;
                                      return StartupCardWidget(
                                        isFavorite: false,
                                        startup: startupCardStartupsRecord,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 12),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 72,
                    constraints: BoxConstraints(
                      maxWidth: 768,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 36,
                          color: Color(0xFF557C67),
                          offset: Offset(0, 14),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'favoritos',
                            icon: Icon(
                              Icons.star_border,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 48,
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Rubik',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'filtros',
                            icon: Icon(
                              Icons.filter_alt_outlined,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              height: 48,
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Rubik',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(31),
                            ),
                          ),
                        ],
                      ),
                    ),
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
