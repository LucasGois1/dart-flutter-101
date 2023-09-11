mixin Awaitable<T> {
  late T _argument;

  onFinish(Function(T) callback) {
    callback(_argument);
  }

  Awaitable<T> then(T Function(T) promise) {
    _argument = promise(_argument);
    return this;
  }
}

class Promise<T> with Awaitable<T> {
  // late T argument;

  T get value => _argument;

  Awaitable<T> doSomething(T Function() callback) {
    _argument = callback();

    return this;
  }

  // onFinish(Function(T) callback) {
  //   callback(_argument);
  // }

  // Awaitable<T> then(T Function(T) promise) {
  //   _argument = promise(_argument);
  //   return this;
  // }
}

main() {
  Promise<String>()
      .doSomething(() => 'Mixin eh bem legal!!!')
      .then((result) => result.toUpperCase())
      .onFinish((result) => print(result));

  final teste = Promise<int>();

  print(teste is Promise);
  print(teste is Awaitable);
}
