import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'city_model.dart';
export 'city_model.dart';

class CityWidget extends StatefulWidget {
  const CityWidget({
    super.key,
    required this.countryid,
    required this.stateid,
    required this.lgaid,
  });

  final String? countryid;
  final String? stateid;
  final String? lgaid;

  @override
  State<CityWidget> createState() => _CityWidgetState();
}

class _CityWidgetState extends State<CityWidget> {
  late CityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CityModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              76.0, 12.0, 76.0, 0.0),
                          child: Text(
                            'Enter your Location Data',
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
                            if (FFAppState().accounttype == 1)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 20.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    textCapitalization: TextCapitalization.none,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Enter your Shop Address',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      alignLabelWithHint: false,
                                      hintText: 'Eg: No 5, Shopping Avenue',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xC62D2F42),
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      contentPadding: EdgeInsets.all(15.0),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            FutureBuilder<ApiCallResponse>(
                              future: FetchCityCall.call(
                                countryid: widget.countryid,
                                stateid: widget.stateid,
                                lgaid: widget.lgaid,
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final cityFetchCityResponse = snapshot.data!;
                                return FlutterFlowDropDown<String>(
                                  controller: _model.cityValueController ??=
                                      FormFieldController<String>(
                                    _model.cityValue ??= '0',
                                  ),
                                  options:
                                      List<String>.from(FetchCityCall.cityId(
                                    cityFetchCityResponse.jsonBody,
                                  )!
                                          .map((e) => e.toString())
                                          .toList()),
                                  optionLabels: FetchCityCall.cityName(
                                    cityFetchCityResponse.jsonBody,
                                  )!
                                      .map((e) => e.toString())
                                      .toList(),
                                  onChanged: (val) =>
                                      setState(() => _model.cityValue = val),
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  height: 50.0,
                                  searchHintTextStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  searchTextStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: 'Select your city....',
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
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (FFAppState().accounttype == 1) {
                                    _model.setlocation =
                                        await SetLocationCall.call(
                                      userid: FFAppState().userid,
                                      accounttype:
                                          FFAppState().accounttype.toString(),
                                      city: _model.cityValue,
                                      lga: widget.lgaid,
                                      state: widget.stateid,
                                      country: widget.countryid,
                                      shopNo: _model.textController.text,
                                    );
                                    if ((_model.setlocation?.succeeded ??
                                        true)) {
                                      context.goNamed(
                                        'ProfilePicture',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.leftToRight,
                                          ),
                                        },
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Please set your location',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                        ),
                                      );
                                    }
                                  } else {
                                    _model.setlocation2 =
                                        await SetLocationCall.call(
                                      userid: FFAppState().userid,
                                      accounttype:
                                          FFAppState().accounttype.toString(),
                                      city: _model.cityValue,
                                      lga: widget.lgaid,
                                      state: widget.stateid,
                                      country: widget.countryid,
                                    );
                                    if ((_model.setlocation2?.succeeded ??
                                        true)) {
                                      context.goNamed(
                                        'ProfilePicture',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.leftToRight,
                                          ),
                                        },
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            getJsonField(
                                              (_model.setlocation2?.jsonBody ??
                                                  ''),
                                              r'''$.error''',
                                            ).toString(),
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                        ),
                                      );
                                    }
                                  }

                                  setState(() {});
                                },
                                text: 'Complete',
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
