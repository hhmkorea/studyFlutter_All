import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

final helloStreamController = StreamController<String>();
final helloStreamProvider = StreamProvider.autoDispose<String>((ref) {
  return helloStreamController.stream;
});

final stompClient = StompClient(
  config: StompConfig(
    url: "ws://192.168.137.1:8080/gs-guide-websocket",
    onConnect: onConnect,
    onWebSocketError: (dynamic error) => print(error.toString()),
  ),
);

void onConnect(StompFrame frame) {
  stompClient.subscribe(
    destination: '/topic/hello',
    headers: {},
    callback: (frame) {
      helloStreamController.add("${frame.body}");
      //print('Received: ${frame.body}');
    },
  );
  print('소켓 서버에 연결되었고 /topic/hello 를 구독중입니다...................');
}
