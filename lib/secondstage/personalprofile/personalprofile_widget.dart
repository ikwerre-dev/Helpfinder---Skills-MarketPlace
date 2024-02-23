import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'personalprofile_model.dart';
export 'personalprofile_model.dart';

class PersonalprofileWidget extends StatefulWidget {
  const PersonalprofileWidget({super.key});

  @override
  State<PersonalprofileWidget> createState() => _PersonalprofileWidgetState();
}

class _PersonalprofileWidgetState extends State<PersonalprofileWidget> {
  late PersonalprofileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonalprofileModel());

    _model.firstnameController ??= TextEditingController();
    _model.firstnameFocusNode ??= FocusNode();

    _model.lastnameController ??= TextEditingController();
    _model.lastnameFocusNode ??= FocusNode();

    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.passwordController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    _model.confirmpasswordController ??= TextEditingController();
    _model.confirmpasswordFocusNode ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RichText(
                        textScaleFactor: MediaQuery.of(context).textScaleFactor,
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
                              text: '4',
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                          'Put in your full details',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Rubik',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 50.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              28.0, 0.0, 28.0, 10.0),
                          child: TextFormField(
                            controller: _model.firstnameController,
                            focusNode: _model.firstnameFocusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'First Name',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .customColor4,
                                    fontSize: 14.0,
                                  ),
                              hintText: 'Enter your first name',
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFFE0DEF5),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.firstnameControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              28.0, 0.0, 28.0, 10.0),
                          child: TextFormField(
                            controller: _model.lastnameController,
                            focusNode: _model.lastnameFocusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Last Name',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .customColor4,
                                    fontSize: 14.0,
                                  ),
                              hintText: 'Enter your last name',
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFFE0DEF5),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.lastnameControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              28.0, 0.0, 28.0, 10.0),
                          child: TextFormField(
                            controller: _model.emailController,
                            focusNode: _model.emailFocusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .customColor4,
                                    fontSize: 14.0,
                                  ),
                              hintText: 'Enter your email address',
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFFE0DEF5),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.emailControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.genderValueController ??=
                                FormFieldController<String>(
                              _model.genderValue ??= '1',
                            ),
                            options: List<String>.from(['1', '2']),
                            optionLabels: ['Male', 'Female'],
                            onChanged: (val) =>
                                setState(() => _model.genderValue = val),
                            width: MediaQuery.sizeOf(context).width * 0.85,
                            height: 50.0,
                            searchHintTextStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            searchTextStyle:
                                FlutterFlowTheme.of(context).bodyMedium,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hintText: 'Gender',
                            searchHintText: 'Search for an item...',
                            searchCursorColor:
                                FlutterFlowTheme.of(context).primary,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: Color(0xFFE0DEF5),
                            elevation: 2.0,
                            borderColor: Colors.transparent,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                1.0, 4.0, 8.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: true,
                            isMultiSelect: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.maritalstatusValueController ??=
                                FormFieldController<String>(
                              _model.maritalstatusValue ??= '1',
                            ),
                            options: List<String>.from(['1', '2']),
                            optionLabels: ['Single', 'Married'],
                            onChanged: (val) =>
                                setState(() => _model.maritalstatusValue = val),
                            width: MediaQuery.sizeOf(context).width * 0.85,
                            height: 50.0,
                            searchHintTextStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            searchTextStyle:
                                FlutterFlowTheme.of(context).bodyMedium,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hintText: 'Gender',
                            searchHintText: 'Search for an item...',
                            searchCursorColor:
                                FlutterFlowTheme.of(context).primary,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: Color(0xFFE0DEF5),
                            elevation: 2.0,
                            borderColor: Colors.transparent,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                1.0, 4.0, 8.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: true,
                            isMultiSelect: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              28.0, 0.0, 28.0, 10.0),
                          child: TextFormField(
                            controller: _model.passwordController,
                            focusNode: _model.passwordFocusNode,
                            obscureText: !_model.passwordVisibility,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .customColor4,
                                    fontSize: 14.0,
                                  ),
                              hintText: 'Enter your password',
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFFE0DEF5),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => _model.passwordVisibility =
                                      !_model.passwordVisibility,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.passwordControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              28.0, 0.0, 28.0, 10.0),
                          child: TextFormField(
                            controller: _model.confirmpasswordController,
                            focusNode: _model.confirmpasswordFocusNode,
                            obscureText: !_model.confirmpasswordVisibility,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .customColor4,
                                    fontSize: 14.0,
                                  ),
                              hintText: 'Confirm your password',
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFFE0DEF5),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => _model.confirmpasswordVisibility =
                                      !_model.confirmpasswordVisibility,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.confirmpasswordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.confirmpasswordControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              72.0, 25.0, 72.0, 30.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              var _shouldSetState = false;
                              if (_model.firstnameController.text != null &&
                                  _model.firstnameController.text != '') {
                                if (FFAppState().accounttype == 1) {
                                  _model.updatedetails1 =
                                      await UpdateDetailsCall.call(
                                    id: FFAppState().userid,
                                    firstname: _model.firstnameController.text,
                                    lastname: _model.lastnameController.text,
                                    email: _model.emailController.text,
                                    password: _model.passwordController.text,
                                    accounttype:
                                        FFAppState().accounttype.toString(),
                                    gender: _model.genderValue,
                                    maritalstatus: _model.maritalstatusValue,
                                  );
                                  _shouldSetState = true;
                                  if ((_model.updatedetails1?.succeeded ??
                                      true)) {
                                    FFAppState().update(() {
                                      FFAppState().fingerprint =
                                          UpdateDetailsCall.email(
                                        (_model.updatedetails1?.jsonBody ?? ''),
                                      )!;
                                      FFAppState().firstname =
                                          _model.firstnameController.text;
                                      FFAppState().lastname =
                                          _model.lastnameController.text;
                                      FFAppState().email =
                                          _model.emailController.text;
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          UpdateDetailsCall.errormsg(
                                            (_model.updatedetails1?.jsonBody ??
                                                ''),
                                          )!,
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                } else {
                                  _model.updatedetails =
                                      await UpdateDetailsCall.call(
                                    id: FFAppState().userid,
                                    firstname: _model.firstnameController.text,
                                    lastname: _model.lastnameController.text,
                                    email: _model.emailController.text,
                                    password: _model.passwordController.text,
                                    accounttype:
                                        FFAppState().accounttype.toString(),
                                    gender: _model.genderValue,
                                    maritalstatus: _model.maritalstatusValue,
                                  );
                                  _shouldSetState = true;
                                  if ((_model.updatedetails?.succeeded ??
                                      true)) {
                                    FFAppState().update(() {
                                      FFAppState().fingerprint =
                                          UpdateDetailsCall.email(
                                        (_model.updatedetails1?.jsonBody ?? ''),
                                      )!;
                                      FFAppState().firstname =
                                          _model.firstnameController.text;
                                      FFAppState().lastname =
                                          _model.lastnameController.text;
                                      FFAppState().email =
                                          _model.emailController.text;
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          UpdateDetailsCall.errormsg(
                                            (_model.updatedetails?.jsonBody ??
                                                ''),
                                          )!,
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .black600,
                                      ),
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                }

                                GoRouter.of(context).prepareAuthEvent();
                                if (_model.passwordController.text !=
                                    _model.confirmpasswordController.text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Passwords don\'t match!',
                                      ),
                                    ),
                                  );
                                  return;
                                }

                                final user =
                                    await authManager.createAccountWithEmail(
                                  context,
                                  _model.emailController.text,
                                  _model.passwordController.text,
                                );
                                if (user == null) {
                                  return;
                                }

                                await UsersRecord.collection
                                    .doc(user.uid)
                                    .update(createUsersRecordData(
                                      email: FFAppState().email,
                                      uid: FFAppState().userid.toString(),
                                      displayName:
                                          '${FFAppState().firstname} ${FFAppState().lastname}',
                                      accountType: FFAppState().accounttype,
                                      phoneNumber: FFAppState().phonenumber,
                                    ));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'First Name is needed',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              context.goNamedAuth('location', context.mounted);

                              if (_shouldSetState) setState(() {});
                            },
                            text: 'Continue',
                            options: FFButtonOptions(
                              width: double.infinity,
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
