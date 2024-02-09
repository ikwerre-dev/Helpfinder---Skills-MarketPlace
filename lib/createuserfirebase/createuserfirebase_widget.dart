import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'createuserfirebase_model.dart';
export 'createuserfirebase_model.dart';

class CreateuserfirebaseWidget extends StatefulWidget {
  const CreateuserfirebaseWidget({
    super.key,
    required this.userid,
    required this.accounttype,
    required this.email,
    required this.password,
  });

  final int? userid;
  final int? accounttype;
  final String? email;
  final String? password;

  @override
  State<CreateuserfirebaseWidget> createState() =>
      _CreateuserfirebaseWidgetState();
}

class _CreateuserfirebaseWidgetState extends State<CreateuserfirebaseWidget> {
  late CreateuserfirebaseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateuserfirebaseModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.verifyuser = await VerifyUserCall.call(
        id: widget.userid,
        accounttype: widget.accounttype,
      );
      GoRouter.of(context).prepareAuthEvent();

      final user = await authManager.createAccountWithEmail(
        context,
        widget.email!,
        widget.password!,
      );
      if (user == null) {
        return;
      }

      await UsersRecord.collection.doc(user.uid).update(createUsersRecordData(
            email: FFAppState().email,
            uid: FFAppState().userid.toString(),
            displayName: '${FFAppState().firstname} ${FFAppState().lastname}',
            accountType: FFAppState().accounttype,
            phoneNumber: FFAppState().phonenumber,
          ));

      context.goNamedAuth('HomePage', context.mounted);
    });
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/Help_Finder_PNG.png',
                          width: 300.0,
                          height: 200.0,
                          fit: BoxFit.contain,
                          alignment: Alignment(0.0, 0.0),
                        ),
                      ),
                    ),
                    Text(
                      'Authenticating....',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
