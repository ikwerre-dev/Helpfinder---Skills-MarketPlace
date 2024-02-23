import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneController;
  String? Function(BuildContext, String?)? phoneControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // Stores action output result for [Backend Call - API (Login User)] action in Button widget.
  ApiCallResponse? loginuser;
  // Stores action output result for [Backend Call - API (SEARCH SPECIALIZATIONS)] action in Button widget.
  ApiCallResponse? apiResulteya2;
  // Stores action output result for [Backend Call - API (FInd Nearby Users)] action in Button widget.
  ApiCallResponse? apiResultxdq2;
  // Stores action output result for [Backend Call - API (SEARCH SPECIALIZATIONS)] action in Button widget.
  ApiCallResponse? apiResulteya;
  // Stores action output result for [Backend Call - API (FInd Nearby Users)] action in Button widget.
  ApiCallResponse? apiResultxdq;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    phoneFocusNode?.dispose();
    phoneController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
