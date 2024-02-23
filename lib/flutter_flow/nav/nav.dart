import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : WelcomePageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : WelcomePageWidget(),
          routes: [
            FFRoute(
              name: 'WelcomePage',
              path: 'welcomePage',
              builder: (context, params) => WelcomePageWidget(),
            ),
            FFRoute(
              name: 'HomePage',
              path: 'homePage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'HomePage')
                  : NavBarPage(
                      initialPage: 'HomePage',
                      page: HomePageWidget(),
                    ),
            ),
            FFRoute(
              name: 'MobileSignIn',
              path: 'mobileSignIn',
              builder: (context, params) => MobileSignInWidget(
                accountType: params.getParam('accountType', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'VerifyMobile',
              path: 'verifyMobile',
              builder: (context, params) => VerifyMobileWidget(),
            ),
            FFRoute(
              name: 'EnterPassword',
              path: 'enterPassword',
              builder: (context, params) => EnterPasswordWidget(),
            ),
            FFRoute(
              name: 'EnableFingerprint',
              path: 'enableFingerprint',
              builder: (context, params) => EnableFingerprintWidget(),
            ),
            FFRoute(
              name: 'TurnOnNotification',
              path: 'turnOnNotification',
              builder: (context, params) => TurnOnNotificationWidget(),
            ),
            FFRoute(
              name: 'ProfilePicture',
              path: 'profilePicture',
              builder: (context, params) => ProfilePictureWidget(),
            ),
            FFRoute(
              name: 'AccountType',
              path: 'accountType',
              builder: (context, params) => AccountTypeWidget(),
            ),
            FFRoute(
              name: 'UserInterest',
              path: 'userInterest',
              builder: (context, params) => UserInterestWidget(),
            ),
            FFRoute(
              name: 'GetStarted',
              path: 'getStarted',
              builder: (context, params) => GetStartedWidget(),
            ),
            FFRoute(
              name: 'search',
              path: 'search',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'search')
                  : NavBarPage(
                      initialPage: 'search',
                      page: SearchWidget(),
                    ),
            ),
            FFRoute(
              name: 'setting',
              path: 'setting',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'setting')
                  : NavBarPage(
                      initialPage: 'setting',
                      page: SettingWidget(),
                    ),
            ),
            FFRoute(
              name: 'Login',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'businessProfile',
              path: 'businessProfile',
              builder: (context, params) => BusinessProfileWidget(),
            ),
            FFRoute(
              name: 'location',
              path: 'location',
              builder: (context, params) => LocationWidget(),
            ),
            FFRoute(
              name: 'profilePage',
              path: 'profilePage',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: ProfilePageWidget(
                  user: params.getParam('user', ParamType.String),
                  json: params.getParam('json', ParamType.JSON),
                ),
              ),
            ),
            FFRoute(
              name: 'MyProfile',
              path: 'myProfile',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: MyProfileWidget(
                  user: params.getParam('user', ParamType.String),
                  json: params.getParam('json', ParamType.JSON),
                ),
              ),
            ),
            FFRoute(
              name: 'editprofile',
              path: 'editprofile',
              builder: (context, params) => EditprofileWidget(
                userid: params.getParam('userid', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'oldUploadProfilepicture',
              path: 'oldUploadProfilepicture',
              builder: (context, params) => OldUploadProfilepictureWidget(),
            ),
            FFRoute(
              name: 'changepassword',
              path: 'changepassword',
              builder: (context, params) => ChangepasswordWidget(),
            ),
            FFRoute(
              name: 'category',
              path: 'category',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: CategoryWidget(
                  categoryId: params.getParam('categoryId', ParamType.String),
                  categoryname:
                      params.getParam('categoryname', ParamType.String),
                ),
              ),
            ),
            FFRoute(
              name: 'gallery',
              path: 'gallery',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: GalleryWidget(),
              ),
            ),
            FFRoute(
              name: 'viewimage',
              path: 'viewimage',
              builder: (context, params) => ViewimageWidget(
                image: params.getParam('image', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'State',
              path: 'state',
              builder: (context, params) => StateWidget(
                countryid: params.getParam('countryid', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'localgovt',
              path: 'localgovt',
              builder: (context, params) => LocalgovtWidget(
                countryid: params.getParam('countryid', ParamType.String),
                stateid: params.getParam('stateid', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'city',
              path: 'city',
              builder: (context, params) => CityWidget(
                countryid: params.getParam('countryid', ParamType.String),
                stateid: params.getParam('stateid', ParamType.String),
                lgaid: params.getParam('lgaid', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'UploadProfilepicture',
              path: 'uploadProfilepicture',
              builder: (context, params) => UploadProfilepictureWidget(),
            ),
            FFRoute(
              name: 'ChatPage',
              path: 'chatPage',
              asyncParams: {
                'chatUser': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => ChatPageWidget(
                chatUser: params.getParam('chatUser', ParamType.Document),
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, false, ['chats']),
              ),
            ),
            FFRoute(
              name: 'AllChatsPage',
              path: 'allChatsPage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'AllChatsPage')
                  : AllChatsPageWidget(),
            ),
            FFRoute(
              name: 'inviteuser',
              path: 'inviteuser',
              builder: (context, params) => InviteuserWidget(),
            ),
            FFRoute(
              name: 'posts',
              path: 'posts',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'posts')
                  : NavBarPage(
                      initialPage: 'posts',
                      page: PostsWidget(),
                    ),
            ),
            FFRoute(
              name: 'createuserfirebase',
              path: 'createuserfirebase',
              builder: (context, params) => CreateuserfirebaseWidget(
                userid: params.getParam('userid', ParamType.int),
                accounttype: params.getParam('accounttype', ParamType.int),
                email: params.getParam('email', ParamType.String),
                password: params.getParam('password', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'personalprofile',
              path: 'personalprofile',
              builder: (context, params) => PersonalprofileWidget(),
            ),
            FFRoute(
              name: 'profilePageByID',
              path: 'profilePageByID',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: ProfilePageByIDWidget(
                  user: params.getParam('user', ParamType.String),
                ),
              ),
            ),
            FFRoute(
              name: 'searchfilter',
              path: 'searchfilter',
              builder: (context, params) => SearchfilterWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/welcomePage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Help_Finder_PNG.png',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
