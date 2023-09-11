// ignore_for_file: avoid_print

import 'dart:math';

void functionExample() {}

void functionExampleWithParams(int param1, String param2) {}

void functionExampleWithOptionalParams([
  int? param1,
  String? param2,
  bool? param3,
]) {
  // do something
}

void functionExampleWithNamedParams({
  int? param1,
  String? param2,
  bool? param3,
}) {
  // do something
}

Future<bool> functionExampleAsync() async {
  return Future.value(true);
}

// Generator SYNC
Iterable<int> counterGenerator(String name) sync* {
  var i = 0;

  while (true) {
    print('[--$name] produzindo $i');
    yield i;

    i++;
  }
}

Stream<int> counter(String name) async* {
  var i = 0;
  final delay = Duration(seconds: Random().nextInt(30) + 10);

  while (true) {
    await Future.delayed(delay);

    print('[--$name] produzindo $i');
    yield i;

    i++;
  }
}

void main() {
  // execute 5 contador streams in a separate thread
  final consumer1 = counter('stream1');
  // final consumer2 = counter('stream2');
  // final consumer3 = counter('stream3');

  // listen to all streams
  consumer1.listen((event) {
    print('[consumer1] consumindo $event\n');
  });
  // consumer2.listen((event) => print('[consumer2] consumindo $event\n'));
  // consumer3.listen((event) => print('[consumer3] consumindo $event\n'));
}
