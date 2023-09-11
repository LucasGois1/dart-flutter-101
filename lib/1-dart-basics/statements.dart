// ignore_for_file: dead_code, avoid_print, unused_catch_stack

void main() {
  bool boolExample = false;
  int intExample = 1;

  if (boolExample) {
    // do something
  }

  if (boolExample) print('do something');

  for (var i = 0; i < 10; i++) {
    // do something
  }

  while (boolExample) {
    // do something
  }

  do {
    // do something
  } while (boolExample);

  switch (intExample) {
    case 1:
      // do something
      break;
    default:
    // do something
  }

  try {
    // do something
  } on FormatException {
    // do something
  } on Exception catch (e, stacktrace) {
    // do something
  } finally {
    // do something
  }
}
