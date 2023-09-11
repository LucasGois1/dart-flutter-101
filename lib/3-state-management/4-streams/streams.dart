import 'dart:async';

import 'other.dart';

class EventExample {
  final String text;

  EventExample(this.text);
}

final streamController = StreamController<EventExample>();

void main() {
  streamController.stream.listen((event) {
    print('event received! value: ${event.text}');
  });

  teste();

  streamController
      .add(EventExample('[main] Nao esperei o teste terminar de rodar! '));

  Future.delayed(const Duration(minutes: 10));
}
