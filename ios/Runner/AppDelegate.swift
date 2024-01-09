import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, TweetApi {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)
      
      let rootViewController : FlutterViewController = window?.rootViewController as! FlutterViewController

      // get binaryMessenger
      let binaryMessenger = rootViewController as! FlutterBinaryMessenger
      TweetApiSetup.setUp(binaryMessenger: binaryMessenger, api: self)
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    

    
    func getTweet() throws -> Tweet {
        let date = Date()
        let milliseconds = Int64(date.timeIntervalSince1970 * 1000)
        return Tweet(id: 1, message: "Tweet from iOS", dateTime: milliseconds, userId: 1001)
    }
}
