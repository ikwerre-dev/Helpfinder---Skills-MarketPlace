import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'searchfilter_model.dart';
export 'searchfilter_model.dart';

class SearchfilterWidget extends StatefulWidget {
  const SearchfilterWidget({super.key});

  @override
  State<SearchfilterWidget> createState() => _SearchfilterWidgetState();
}

class _SearchfilterWidgetState extends State<SearchfilterWidget> {
  late SearchfilterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchfilterModel());
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
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 48.0, 24.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 48.0,
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      context.pushNamed('HomePage');
                    },
                  ),
                  Text(
                    'Find Skills',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Rubik',
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 0.2,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'search',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.leftToRight,
                            ),
                          },
                        );
                      },
                      child: Icon(
                        Icons.search_sharp,
                        color: FlutterFlowTheme.of(context).black600,
                        size: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(36.0),
                      topRight: Radius.circular(36.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 32.0, 0.0, 48.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: FFAppState().category(
                                          requestFn: () =>
                                              SearchSpecializationsCall.call(
                                            id: FFAppState().userid,
                                            accountType:
                                                FFAppState().accounttype,
                                            q: 'hi',
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final specializationSearchSpecializationsResponse =
                                              snapshot.data!;
                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .specializationValueController ??=
                                                FormFieldController<String>(
                                              _model.specializationValue ??=
                                                  '1',
                                            ),
                                            options: List<String>.from(
                                                (getJsonField(
                                              specializationSearchSpecializationsResponse
                                                  .jsonBody,
                                              r'''$.specializations[:].id''',
                                              true,
                                            ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()!),
                                            optionLabels: (getJsonField(
                                              specializationSearchSpecializationsResponse
                                                  .jsonBody,
                                              r'''$.specializations[:].specialization''',
                                              true,
                                            ) as List)
                                                .map<String>(
                                                    (s) => s.toString())
                                                .toList()!,
                                            onChanged: (val) async {
                                              setState(() => _model
                                                  .specializationValue = val);
                                              context.pushNamed(
                                                'category',
                                                queryParameters: {
                                                  'categoryId': serializeParam(
                                                    _model.specializationValue,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.85,
                                            height: 50.0,
                                            searchHintTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            searchTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText: 'Specialization',
                                            searchHintText:
                                                'Search for an item...',
                                            searchCursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor: Color(0xFFE0DEF5),
                                            elevation: 2.0,
                                            borderColor: Colors.transparent,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    1.0, 4.0, 8.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: true,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
    );
  }
}
