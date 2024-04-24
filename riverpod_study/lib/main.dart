import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// part 'main.g.dart';

// We create a "provider", which will store a value (here "Hello world").
// By using a provider, this allows us to mock/override the value exposed.
// @riverpod
// String helloWorld(HelloWorldRef ref) {
//   return 'Hello world';
// }

final readOnlyProvider = Provider((_) => 0); // 읽기만 하는 관리자, 창고데이터로 (Hello world 불변)
final readAndWriteProvider = StateProvider((_) => 0); // 읽고 쓰는 관리자. 상태변경시 사용.

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    ProviderScope(
      // ProviderScope : 여기서부터 상태 관리함.
      child: MyApp(),
    ),
  );
}

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class MyApp extends ConsumerWidget {
  // ConsumerWidget : 상태관리용 위젯
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref : 모든 상태(provider)에 접근이 가능함.
    int v1 = ref.read(readOnlyProvider); // read : helloWorldProvider는 불변이라 read가 맞음.
    int v2 = ref.watch(readAndWriteProvider); // watch : while 문을 돌면서 지속적으로 상태 관찰.

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$v1 ",
                    style: TextStyle(fontSize: 50),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        // 변경할 수 있는 방법이 없다.
                        //ref.read(readOnlyProvider);
                      },
                      child: Text("변경")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$v2 ",
                    style: TextStyle(fontSize: 50),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ref.watch(readAndWriteProvider.notifier).state++; // state++ : 창고관리자가 관리하고 있는 값. +1
                      },
                      child: Text("변경")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
