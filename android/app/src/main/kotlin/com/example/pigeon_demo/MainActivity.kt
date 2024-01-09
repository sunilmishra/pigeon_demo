package com.example.pigeon_demo

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
