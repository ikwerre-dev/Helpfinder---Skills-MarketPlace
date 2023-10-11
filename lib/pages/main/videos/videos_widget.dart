import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'videos_model.dart';
export 'videos_model.dart';

class VideosWidget extends StatefulWidget {
  const VideosWidget({Key? key}) : super(key: key);

  @override
  _VideosWidgetState createState() => _VideosWidgetState();
}

class _VideosWidgetState extends State<VideosWidget> {
  late VideosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult10a = await FetchVideosCall.call(
        user: FFAppState().userid,
      );
      if ((_model.apiResult10a?.succeeded ?? true)) {}
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Builder(
          builder: (context) {
            final clips = FFAppState().clipsurl.map((e) => e).toList();
            return Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 1.0,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _model.pageViewController ??=
                        PageController(initialPage: min(0, clips.length - 1)),
                    scrollDirection: Axis.vertical,
                    itemCount: clips.length,
                    itemBuilder: (context, clipsIndex) {
                      final clipsItem = clips[clipsIndex];
                      return Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: FlutterFlowVideoPlayer(
                          path: clipsItem,
                          videoType: VideoType.network,
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          aspectRatio: 1.00,
                          autoPlay: true,
                          looping: true,
                          showControls: false,
                          allowFullScreen: false,
                          allowPlaybackSpeedMenu: false,
                          lazyLoad: true,
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 16.0),
                      child: smooth_page_indicator.SmoothPageIndicator(
                        controller: _model.pageViewController ??=
                            PageController(
                                initialPage: min(0, clips.length - 1)),
                        count: clips.length,
                        axisDirection: Axis.vertical,
                        onDotClicked: (i) async {
                          await _model.pageViewController!.animateToPage(
                            i,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        effect: smooth_page_indicator.ExpandingDotsEffect(
                          expansionFactor: 3.0,
                          spacing: 8.0,
                          radius: 16.0,
                          dotWidth: 16.0,
                          dotHeight: 8.0,
                          dotColor: FlutterFlowTheme.of(context).accent1,
                          activeDotColor: FlutterFlowTheme.of(context).primary,
                          paintStyle: PaintingStyle.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
