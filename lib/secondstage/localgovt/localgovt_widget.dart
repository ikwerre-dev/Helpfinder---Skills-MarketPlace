import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'localgovt_model.dart';
export 'localgovt_model.dart';

class LocalgovtWidget extends StatefulWidget {
  const LocalgovtWidget({
    super.key,
    required this.countryid,
    required this.stateid,
  });

  final String? countryid;
  final String? stateid;

  @override
  State<LocalgovtWidget> createState() => _LocalgovtWidgetState();
}

class _LocalgovtWidgetState extends State<LocalgovtWidget> {
  late LocalgovtModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocalgovtModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RichText(
                          textScaleFactor:
                              MediaQuery.of(context).textScaleFactor,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'STEP ',
                                style: GoogleFonts.getFont(
                                  'Rubik',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0,
                                ),
                              ),
                              TextSpan(
                                text: '5',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: '/',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: '5',
                                style: TextStyle(),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Rubik',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                76.0, 12.0, 76.0, 0.0),
                            child: Text(
                              'Enter your LGA',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Rubik',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 50.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: FetchLgaCall.call(
                                  countryid: widget.countryid,
                                  stateid: widget.stateid,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final lgaFetchLgaResponse = snapshot.data!;
                                  return FlutterFlowDropDown<String>(
                                    controller: _model.lgaValueController ??=
                                        FormFieldController<String>(
                                      _model.lgaValue ??= '1',
                                    ),
                                    options:
                                        List<String>.from(FetchLgaCall.lgaid(
                                      lgaFetchLgaResponse.jsonBody,
                                    )!
                                            .map((e) => e.toString())
                                            .toList()),
                                    optionLabels: FetchLgaCall.lgaName(
                                      lgaFetchLgaResponse.jsonBody,
                                    )!
                                        .map((e) => e.toString())
                                        .toList(),
                                    onChanged: (val) =>
                                        setState(() => _model.lgaValue = val),
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    height: 50.0,
                                    searchHintTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium,
                                    searchTextStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    hintText: 'Select your LGA....',
                                    searchHintText: 'Search for an item...',
                                    searchCursorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: true,
                                    isMultiSelect: false,
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  HapticFeedback.mediumImpact();

                                  context.pushNamed(
                                    'city',
                                    queryParameters: {
                                      'countryid': serializeParam(
                                        widget.countryid,
                                        ParamType.String,
                                      ),
                                      'stateid': serializeParam(
                                        widget.stateid,
                                        ParamType.String,
                                      ),
                                      'lgaid': serializeParam(
                                        _model.lgaValue,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                text: 'Continue',
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  height: 54.0,
                                  padding: EdgeInsets.all(0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                          ].addToEnd(SizedBox(height: 100.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}