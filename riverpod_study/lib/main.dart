import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Stream<String> say() async* {
  for (var i = 0; i < 2; i++) {
    await Future.delayed(Duration(seconds: 2));
    yield "Say $i times";
  }
}

final helloStreamProvider = StreamProvider.autoDispose<String>((ref) {
  return say();
});

void main() {
  runApp(
    const ProviderScope(
      // riverpod 연결
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helloData = ref.watch(helloStreamProvider); // watch
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: helloData.when(
            data: (data) {
              print("데이터 들어옴");
              return buildText(data);
            },
            error: (error, stackTrace) => buildText("Error"),
            loading: () => buildText("No Data"),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text("add"),
        ),
      ),
    );
  }

  Text buildText(String content) {
    // 텍스트 글자 키우기
    return Text(
      content,
      style: const TextStyle(
        fontSize: 100,
      ),
    );
  }
}
