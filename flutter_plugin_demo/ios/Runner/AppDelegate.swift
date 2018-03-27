import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {

    let controller = self.window.rootViewController as! FlutterViewController

    let channel = FlutterMethodChannel.init(name: "demo_ios/plugin", binaryMessenger: controller)

    channel.setMethodCallHandler({
        (call: FlutterMethodCall, result: FlutterResult) -> Void in
        if ("getSystemVersion" == call.method) {
            result("iOS " + UIDevice.current.systemVersion);
        } else {
            result("error");
        }
    });

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
