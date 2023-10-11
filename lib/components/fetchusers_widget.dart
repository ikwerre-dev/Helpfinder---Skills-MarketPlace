import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'fetchusers_model.dart';
export 'fetchusers_model.dart';

class FetchusersWidget extends StatefulWidget {
  const FetchusersWidget({Key? key}) : super(key: key);

  @override
  _FetchusersWidgetState createState() => _FetchusersWidgetState();
}

class _FetchusersWidgetState extends State<FetchusersWidget>
    with TickerProviderStateMixin {
  late FetchusersModel _model;

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(0.0, 80.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(0.0, 80.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FetchusersModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 34.0, 24.0, 0.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Skills around you',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Rubik',
                          fontSize: 16.0,
                        ),
                  ),
                ),
                Icon(
                  Icons.keyboard_control,
                  color: Color(0xFFE9E9E9),
                  size: 24.0,
                ),
              ],
            ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.85,
                height: 400.0,
                decoration: BoxDecoration(),
                child: FutureBuilder<ApiCallResponse>(
                  future: FetchUsersCall.call(
                    user: FFAppState().userid,
                    page: _model.pageViewCurrentIndex,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    final pageViewFetchUsersResponse = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final users = FetchUsersCall.users(
                              pageViewFetchUsersResponse.jsonBody,
                            )?.toList() ??
                            [];
                        return Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: 1092.0,
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 40.0),
                                child: PageView.builder(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage:
                                              min(0, users.length - 1)),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: users.length,
                                  itemBuilder: (context, usersIndex) {
                                    final usersItem = users[usersIndex];
                                    return Container(
                                      width: 15.0,
                                      height: 8.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  size: 20.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    getJsonField(
                                                      usersItem,
                                                      r'''$.shop_no''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Rubik',
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                          letterSpacing: 1.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: 160.0,
                                              height: 160.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl:
                                                    'https://helpfinder.online/${getJsonField(
                                                  usersItem,
                                                  r'''$.passport''',
                                                ).toString()}',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 20.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    4.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.business_center,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          size: 23.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        getJsonField(
                                                          usersItem,
                                                          r'''$.businessname''',
                                                        )
                                                            .toString()
                                                            .maybeHandleOverflow(
                                                              maxChars: 20,
                                                              replacement: '…',
                                                            ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Rubik',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.00, -1.00),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 8.0),
                                                    child: Text(
                                                      getJsonField(
                                                        usersItem,
                                                        r'''$.fullname''',
                                                      ).toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Rubik',
                                                            color: Colors.white,
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.00, 0.00),
                                                  child: Text(
                                                    getJsonField(
                                                      usersItem,
                                                      r'''$.description''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Rubik',
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation']!);
                                  },
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.00, 1.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 16.0),
                                  child:
                                      smooth_page_indicator.SmoothPageIndicator(
                                    controller: _model.pageViewController ??=
                                        PageController(
                                            initialPage:
                                                min(0, users.length - 1)),
                                    count: users.length,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) async {
                                      await _model.pageViewController!
                                          .animateToPage(
                                        i,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    effect: smooth_page_indicator
                                        .ExpandingDotsEffect(
                                      expansionFactor: 3.0,
                                      spacing: 8.0,
                                      radius: 16.0,
                                      dotWidth: 16.0,
                                      dotHeight: 8.0,
                                      dotColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      activeDotColor:
                                          FlutterFlowTheme.of(context).primary,
                                      paintStyle: PaintingStyle.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
