// Declaração de classes

// ignore_for_file: unnecessary_this, unnecessary_type_check, unused_local_variable

// Extensão 'OnlyFastCar' adicionada à lista de veículos para obter carros rápidos.
extension OnlyFastCar on List<Vehicle> {
  List<Vehicle> get fastCars {
    // Filtra os carros com uma velocidade máxima superior a 200 e os converte em uma lista.
    return where((car) => car.maxVelocity > 200).toList();
  }
}

// ignore_for_file: avoid_print

// Mixin 'Honkable' fornece funcionalidade para buzinar.
mixin Honkable {
  String sound = 'Auga!'; // Som padrão de buzina

  void honk() {
    print('Honking the horn: $sound');
  }
}

// Classe abstrata 'Vehicle' define propriedades e métodos comuns a todos os veículos.
abstract class Vehicle {
  int get maxVelocity; // Propriedade para a velocidade máxima do veículo

  void openDoor() {
    print('Opening the door');
  }

  void
      drive(); // Método abstrato para dirigir, a ser implementado nas subclasses.
}

// Classe 'Car' implementa a classe 'Vehicle' e usa o mixin 'Honkable'.
class Car extends Vehicle with Honkable {
  // Propriedades
  String model;
  int manufactureYear;
  bool isNew = true;

  final int _maxVelocity;

  @override
  int get maxVelocity => _maxVelocity;

  // Construtor
  Car(
    this.model,
    this.manufactureYear, {
    required int maxVelocity,
  })  : _maxVelocity = maxVelocity,
        super() {
    print('Car constructor');
  }

  // Construtor de fábrica para criar uma Ferrari
  factory Car.ferrari() {
    return Car('Ferrari', 2021, maxVelocity: 300);
  }

  // Construtor de fábrica para criar uma Ferrari usada com uma versão específica.
  factory Car.usedFerrari({required String version}) {
    final aCar = Car('Ferrari $version', 2021, maxVelocity: 250);

    aCar.drive();

    return aCar;
  }

  // Propriedade 'age' calcula a idade do carro com base no ano de fabricação.
  int get age {
    return DateTime.now().year - manufactureYear;
  }

  // Método para atualizar o som da buzina.
  upgradeSound(String newSound) {
    sound = newSound;
  }

  @override
  void drive() {
    print('Driving a $model of $manufactureYear');

    // A propriedade 'isNew' pode ser acessada com 'this' ou sem ele.
    this.isNew = false;
    isNew = false; // Recomendado usar sem 'this' quando possível.
  }

  @override
  String toString() {
    return model;
  }
}

void main() {
  // Criando instâncias de carros
  final fusca = Car('Fusca', 1990, maxVelocity: 80);
  final ferrari = Car.ferrari();

  // Dirigindo e buzinando os carros
  fusca.drive();
  fusca.honk();

  ferrari.drive();
  ferrari.honk();

  // Atualizando o som da buzina da Ferrari e buzinando novamente.
  ferrari.upgradeSound('Bip!');
  ferrari.honk();

  // Acessando uma propriedade privada '_maxVelocity' (não recomendado, apenas para fins de demonstração).
  print(ferrari._maxVelocity);

  // Verificando se a instância 'ferrari' é uma instância de 'Car' e 'Honkable'.
  print(ferrari is Car);
  print(ferrari is Honkable);

  // Criando uma lista de carros e filtrando apenas os carros rápidos usando a extensão 'OnlyFastCar'.
  final cars = [fusca, ferrari];
  print(cars.fastCars);

  // Tentativa de usar a extensão 'fastCars' em uma lista de inteiros (não funciona, pois a extensão se aplica a List<Vehicle>).
  final List<int> numbers = [1, 2, 3, 4, 5];
  // numbers.fastCars;
}
