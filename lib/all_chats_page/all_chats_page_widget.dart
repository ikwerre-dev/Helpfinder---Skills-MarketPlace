import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_chats_page_model.dart';
export 'all_chats_page_model.dart';

class AllChatsPageWidget extends StatefulWidget {
  const AllChatsPageWidget({super.key});

  @override
  State<AllChatsPageWidget> createState() => _AllChatsPageWidgetState();
}

class _AllChatsPageWidgetState extends State<AllChatsPageWidget> {
  late AllChatsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllChatsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'All Chats',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Rubik',
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            fillColor: FlutterFlowTheme.of(context).primaryBackground,
            icon: Icon(
              Icons.person_add_alt_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.pushNamed('inviteuser');
            },
          ),
        ],
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
          child: StreamBuilder<List<ChatsRecord>>(
            stream: queryChatsRecord(
              queryBuilder: (chatsRecord) => chatsRecord
                  .where(
                    'users',
                    arrayContains: currentUserReference,
                  )
                  .orderBy('last_message_time', descending: true),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<ChatsRecord> listViewChatsRecordList = snapshot.data!;
              if (listViewChatsRecordList.isEmpty) {
                return Center(
                  child: Image.asset(
                    'assets/images/Removebg_Preview.png',
                    fit: BoxFit.contain,
                  ),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewChatsRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewChatsRecord =
                      listViewChatsRecordList[listViewIndex];
                  return StreamBuilder<FFChatInfo>(
                    stream: FFChatManager.instance
                        .getChatInfo(chatRecord: listViewChatsRecord),
                    builder: (context, snapshot) {
                      final chatInfo =
                          snapshot.data ?? FFChatInfo(listViewChatsRecord);
                      return FFChatPreview(
                        onTap: () => context.pushNamed(
                          'ChatPage',
                          queryParameters: {
                            'chatUser': serializeParam(
                              chatInfo.otherUsers.length == 1
                                  ? chatInfo.otherUsersList.first
                                  : null,
                              ParamType.Document,
                            ),
                            'chatRef': serializeParam(
                              chatInfo.chatRecord.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'chatUser': chatInfo.otherUsers.length == 1
                                ? chatInfo.otherUsersList.first
                                : null,
                          },
                        ),
                        lastChatText: chatInfo.chatPreviewMessage(),
                        lastChatTime: listViewChatsRecord.lastMessageTime,
                        seen: listViewChatsRecord.lastMessageSeenBy!
                            .contains(currentUserReference),
                        title: chatInfo.chatPreviewTitle(),
                        userProfilePic: chatInfo.chatPreviewPic(),
                        color: valueOrDefault<Color>(
                          listViewChatsRecord.lastMessageSeenBy
                                  .contains(currentUserReference)
                              ? FlutterFlowTheme.of(context).gray200
                              : Color(0xFFFFB9C2),
                          FlutterFlowTheme.of(context).gray200,
                        ),
                        unreadColor: FlutterFlowTheme.of(context).primary,
                        titleTextStyle: GoogleFonts.getFont(
                          'DM Sans',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                        dateTextStyle: GoogleFonts.getFont(
                          'DM Sans',
                          color: Color(0x73000000),
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                        ),
                        previewTextStyle: GoogleFonts.getFont(
                          'DM Sans',
                          color: Color(0x73000000),
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                        ),
                        contentPadding: EdgeInsets.all(3.0),
                        borderRadius: BorderRadius.circular(0.0),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
