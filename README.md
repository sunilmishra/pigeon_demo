# pigeon_demo

A simple demonstration of [pigeon](https://pub.dev/packages/pigeon) library. Pigeon is a code generator tool to make communication between Flutter and the host platform type-safe, easier, and faster.

## Steps

- Add pigeon as a dev_dependency.

    ```Dart
    dev_dependencies:
        pigeon: ^15.0.2
    ```

- Make a `.dart` file outside of your `lib` directory for defining the communication interface.
  - create a separate directory(outside lib) say `pigeons` and create a dart data file(`tweet.dart`) as below.

```Dart
    import 'package:pigeon/pigeon.dart';
    
    class Tweet {
        Tweet({
                required this.id,
                required this.message,
                required this.dateTime,
                required this.userId,
            });
            
            final int id;
            final String message;
            final int dateTime;
            final int userId;
    }
    
    @HostApi()
    abstract class TweetApi {
        Tweet getTweet();
    }
```

- Run pigeon on your `.dart` file to generate the required Dart and host-language code: `flutter pub get` then `flutter pub run pigeon` with suitable arguments.

  - it will generate `Tweet.g.dart`, `Tweet.g.kt` and `Tweet.g.swift` for         respective platform `Flutter`, `Android`, and `iOS`.

- Add the generated Dart code to `./lib` for compilation. ie `tweet.g.dart`

- Implement the host-language code and add it to your build

### Android

```kotlin
    import io.flutter.embedding.android.FlutterActivity
    import io.flutter.embedding.engine.FlutterEngine
    import java.time.Instant

    class MainActivity: FlutterActivity(), TweetApi {

        override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
            val binaryMessenger = flutterEngine.dartExecutor.binaryMessenger
            TweetApi.setUp(binaryMessenger, this)
        }

        override fun getTweet(): Tweet {
            return Tweet(
                id = 1,
                message = "Tweet from Android",
                dateTime = Instant.now().toEpochMilli(),
                userId = 1001
            )
        }
    }
```

### iOS

```Swift
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
```

- Call the generated Dart methods from your widget.

```Dart
  final tweetApi = TweetApi();
  final tweet = await tweetApi.getTweet();
```
