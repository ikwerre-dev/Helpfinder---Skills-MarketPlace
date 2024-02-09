import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editprofile_widget.dart' show EditprofileWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditprofileModel extends FlutterFlowModel<EditprofileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for specialization widget.
  String? specializationValue;
  FormFieldController<String>? specializationValueController;
  // State field(s) for personalprofile widget.
  FocusNode? personalprofileFocusNode;
  TextEditingController? personalprofileController;
  String? Function(BuildContext, String?)? personalprofileControllerValidator;
  // State field(s) for businessdescription widget.
  FocusNode? businessdescriptionFocusNode;
  TextEditingController? businessdescriptionController;
  String? Function(BuildContext, String?)?
      businessdescriptionControllerValidator;
  // Stores action output result for [Backend Call - API (Update Business Profile)] action in Buttons widget.
  ApiCallResponse? updatedetails1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    personalprofileFocusNode?.dispose();
    personalprofileController?.dispose();

    businessdescriptionFocusNode?.dispose();
    businessdescriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
