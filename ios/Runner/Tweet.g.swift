// Autogenerated from Pigeon (v15.0.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

/// Generated class from Pigeon that represents data sent in messages.
struct Tweet {
  var id: Int64
  var message: String
  var dateTime: Int64
  var userId: Int64

  static func fromList(_ list: [Any?]) -> Tweet? {
    let id = list[0] is Int64 ? list[0] as! Int64 : Int64(list[0] as! Int32)
    let message = list[1] as! String
    let dateTime = list[2] is Int64 ? list[2] as! Int64 : Int64(list[2] as! Int32)
    let userId = list[3] is Int64 ? list[3] as! Int64 : Int64(list[3] as! Int32)

    return Tweet(
      id: id,
      message: message,
      dateTime: dateTime,
      userId: userId
    )
  }
  func toList() -> [Any?] {
    return [
      id,
      message,
      dateTime,
      userId,
    ]
  }
}
private class TweetApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return Tweet.fromList(self.readValue() as! [Any?])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class TweetApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? Tweet {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class TweetApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return TweetApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return TweetApiCodecWriter(data: data)
  }
}

class TweetApiCodec: FlutterStandardMessageCodec {
  static let shared = TweetApiCodec(readerWriter: TweetApiCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol TweetApi {
  func getTweet() throws -> Tweet
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class TweetApiSetup {
  /// The codec used by TweetApi.
  static var codec: FlutterStandardMessageCodec { TweetApiCodec.shared }
  /// Sets up an instance of `TweetApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: TweetApi?) {
    let getTweetChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.pigeon_demo.TweetApi.getTweet", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getTweetChannel.setMessageHandler { _, reply in
        do {
          let result = try api.getTweet()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getTweetChannel.setMessageHandler(nil)
    }
  }
}