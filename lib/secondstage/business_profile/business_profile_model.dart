import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'business_profile_widget.dart' show BusinessProfileWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BusinessProfileModel extends FlutterFlowModel<BusinessProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for firstname widget.
  TextEditingController? firstnameController;
  String? Function(BuildContext, String?)? firstnameControllerValidator;
  // State field(s) for lastname widget.
  TextEditingController? lastnameController;
  String? Function(BuildContext, String?)? lastnameControllerValidator;
  // State field(s) for email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for businessname widget.
  TextEditingController? businessnameController;
  String? Function(BuildContext, String?)? businessnameControllerValidator;
  // State field(s) for businessdescription widget.
  TextEditingController? businessdescriptionController;
  String? Function(BuildContext, String?)?
      businessdescriptionControllerValidator;
  // Stores action output result for [Backend Call - API (Store User Details)] action in Button widget.
  ApiCallResponse? apiResultjwu;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    firstnameController?.dispose();
    lastnameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    businessnameController?.dispose();
    businessdescriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}