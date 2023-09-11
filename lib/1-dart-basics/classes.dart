// Declaring classes

// ignore_for_file: unnecessary_this, unnecessary_type_check, unused_local_variable

extension OnlyFastCar on List<Vehicle> {
  List<Vehicle> get fastCars {
    return where((car) => car.maxVelocity > 200).toList(); // filter
  }
}

// ignore_for_file: avoid_print
mixin Honkable {
  String sound = 'Auga!';

  void honk() {
    print('Honking the horn: $sound');
  }
}

abstract class Vehicle {
  int get maxVelocity;

  void openDoor() {
    print('Opening the door');
  }

  void drive();
}

// try implements
class Car extends Vehicle with Honkable {
  // Properties
  String model;
  int manufactureYear;
  bool isNew = true;

  final int _maxVelocity;

  @override
  int get maxVelocity => _maxVelocity;

  // Constructor
  Car(
    this.model,
    this.manufactureYear, {
    required int maxVelocity,
  })  : _maxVelocity = maxVelocity,
        super() {
    print('Car constructor');
  }

  factory Car.ferrari() {
    return Car('Ferrari', 2021, maxVelocity: 300);
  }

  factory Car.usedFerrari({required String version}) {
    final aCar = Car('Ferrari $version', 2021, maxVelocity: 250);

    aCar.drive();

    return aCar;
  }

  int get age {
    return DateTime.now().year - manufactureYear;
  }

  upgradeSound(String newSound) {
    sound = newSound;
  }

  @override
  void drive() {
    print('Driving a $model of $manufactureYear');

    // Acessivel com `this`
    this.isNew = false;

    // Recomendado utilizar sem quando possivel
    isNew = false;
  }

  @override
  String toString() {
    return model;
  }
}

void main() {
  final fusca = Car('Fusca', 1990, maxVelocity: 80);
  final ferrari = Car.ferrari();

  fusca.drive();
  fusca.honk();

  ferrari.drive();
  ferrari.honk();

  ferrari.upgradeSound('Bip!');
  ferrari.honk();
  print(ferrari._maxVelocity); // acessando membro privado

  print(ferrari is Car);
  print(ferrari is Honkable);

  final cars = [fusca, ferrari];

  print(cars.fastCars);

  final List<int> numbers = [1, 2, 3, 4, 5];
  // numbers.fastCars;
}
