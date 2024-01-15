import 'package:test/test.dart';

mixin Attackable {
  int health = 100;

  void takeDamage(int damage) {
    health -= damage;
    if (health < 0) {
      health = 0;
    }
  }
}

class Goblin with Attackable {
  void attack() {
    print('Goblin attacks with claws!');
  }
}

class Orc with Attackable {
  void attack() {
    print('Orc attacks with sword!');
  }
}

class Dragon with Attackable {
  void attack() {
    print('Dragon breathes fire to attack!');
  }
}

void main() {
  group('Тести для ворогів', () {
    late Goblin goblin;
    late Orc orc;
    late Dragon dragon;

    setUp(() {
      goblin = Goblin();
      orc = Orc();
      dragon = Dragon();
    });

    test('Тест атаки гобліна', () {
      goblin.attack();
      expect(goblin.health, equals(100)); // Goblin не отримує урон при атаки
    });

    test('Тест отримання урону гобліном', () {
      goblin.takeDamage(20);
      expect(goblin.health, equals(80)); // Goblin отримує 20 урону
    });

    test('Тест атаки орка', () {
      orc.attack();
      expect(orc.health, equals(100)); // Orc не отримує урон при атаки
    });

    // Додайте більше тестів за потребою

  });
}