import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verify_mobile_model.dart';
export 'verify_mobile_model.dart';

class VerifyMobileWidget extends StatefulWidget {
  const VerifyMobileWidget({Key? key}) : super(key: key);

  @override
  _VerifyMobileWidgetState createState() => _VerifyMobileWidgetState();
}

class _VerifyMobileWidgetState extends State<VerifyMobileWidget> {
  late VerifyMobileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyMobileModel());
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
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
                        Icons.arrow_back_ios_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                  ],
                ),
              ),
              Column(
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
                          text: '2',
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
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Rubik',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(96.0, 12.0, 96.0, 0.0),
                    child: Text(
                      'Verify your number',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Rubik',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(84.0, 12.0, 84.0, 0.0),
                    child: Text(
                      'You\'ll receive an OTP on ${FFAppState().phonenumber}',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Rubik',
                            fontSize: 14.0,
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              48.0, 48.0, 48.0, 0.0),
                          child: PinCodeTextField(
                            autoDisposeControllers: false,
                            appContext: context,
                            length: 4,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Rubik',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            enableActiveFill: false,
                            autoFocus: true,
                            enablePinAutofill: true,
                            errorTextSpace: 16.0,
                            showCursor: true,
                            cursorColor: FlutterFlowTheme.of(context).primary,
                            obscureText: false,
                            hintCharacter: '●',
                            pinTheme: PinTheme(
                              fieldHeight: 60.0,
                              fieldWidth: 60.0,
                              borderWidth: 2.0,
                              borderRadius: BorderRadius.circular(12.0),
                              shape: PinCodeFieldShape.underline,
                              activeColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              inactiveColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              selectedColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              activeFillColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              inactiveFillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              selectedFillColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                            controller: _model.pinCodeController,
                            onChanged: (_) {},
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: _model.pinCodeControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.goNamed('MobileSignIn');

                              setState(() {
                                FFAppState().otp = '';
                              });
                            },
                            child: Text(
                              'Send me a new code',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Rubik',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(72.0, 0.0, 72.0, 10.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (_model.pinCodeController!.text == FFAppState().otp) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'OTP Validated Successfully',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).customColor1,
                        ),
                      );

                      context.goNamed('AccountType');
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Error!!'),
                            content: Text('Your OTP is incorrect'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  text: 'Continue',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 54.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
    );
  }
}
