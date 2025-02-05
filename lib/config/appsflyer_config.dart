import 'package:appsflyer_sdk/appsflyer_sdk.dart';

class AppsFlyerConfig {
  static const String devKey =
      "bKLyrQXLDHchyCGgwXhdeR"; // AppsFlyerダッシュボードから取得したdevKey
  static const String appId = "YOUR_APP_ID_HERE"; // iOSの場合必須。App Store IDを入力
  static const String oneLinkId = "uyL8";

  static final AppsFlyerOptions options = AppsFlyerOptions(
    afDevKey: devKey,
    showDebug: true, // デバッグ時のみtrueに設定
    timeToWaitForATTUserAuthorization: 50, // iOS 14.5以降用
    appInviteOneLink: oneLinkId,
    disableAdvertisingIdentifier: false,
    disableCollectASA: false,
    manualStart: true,
  );

  static final AppsflyerSdk sdk = AppsflyerSdk(options);

  static Future<void> initializeSDK() async {
    try {
      await sdk.initSdk(
        registerConversionDataCallback: true,
        registerOnAppOpenAttributionCallback: true,
        registerOnDeepLinkingCallback: true,
      );

      sdk.startSDK(
        onSuccess: () {
          print('AppsFlyer SDK initialized successfully');
        },
        onError: (int code, String message) {
          print('AppsFlyer SDK initialization failed: $code - $message');
        },
      );
    } catch (e) {
      print('Error initializing AppsFlyer SDK: $e');
    }
  }
}
