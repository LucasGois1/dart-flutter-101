import 'package:state/4-streams/streams.dart';

void teste() async {
  streamController.add(EventExample('[teste] Ola '));

  await Future.delayed(const Duration(seconds: 2));

  streamController.add(EventExample('[teste] Esta stream '));

  await Future.delayed(const Duration(seconds: 5));

  streamController.add(EventExample('[teste] Eh reativa!! :)'));
}
