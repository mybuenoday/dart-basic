// 캡슐화로 실수 방지. 개발자의 멤버/클래스로의 접근을 제어.
// 필드에 현실세계에서 불가능한 값이 들어가지 않도록 제어.
// private; 멤버 앞에 _ 붙여서 설정. 자기 자신의 클래스에만 접근 가능.
// class Hero의 private _ hp, die, name

class Hero {
  static int money = 100;
  // String name; 아래에 private & 길이 조건 setter 추가
  late int _hp; // private _hp
  Sword? sword;
  late String _name;

  // getter
  String get name => _name;
  // setter
  set name(String value) {
    if (value.length <= 1) {
      throw Exception('이름이 너무 짧습니다.');
    }
    if (value.length >= 8) {
      throw Exception('이름이 너무 깁니다.');
    }
    _name = value;
  }

  int get hp => _hp;
  set hp(int value) {
    if (value < 0) {
      throw Exception('hp는 0보다 작을 수 없다');
    }
    _hp = value;
  }

  void bye() {
    print('Bye');
  }
  void _die() { // private
    print('Died');
  }
  void attack(Slime slime) {
    print('$name이 $slime을 공격');
    print('$slime의 반격');
    _hp -= 10;
    if (_hp <= 0) {
      _die();
    }
  }
}

class Sword {
  String name;
  int damage;

  Sword({
    required this.name,
    required this.damage,
  });
}

class Slime {
  int hp;
  final int level = 10;

  Slime(this.hp);

  void attack() {
  //  final person = _Person();
  }
}

// 메서드를 경유한 필드 조작
// getter: 읽기 전용 property 구현
// setter: 쓰기 전용 property 구현.

class Inn {
  void checkIn(Hero hero) {
    hero.hp = 100;
  }
}
class King {
  void callHero(Hero hero) {
    print('Hero, thanks for visiting');
    print('Hero''s name is ${hero.name} and hp is ${hero.hp}.');
    // hero.die(); die private 처리되어 class King에서 접근 불가.
    hero.bye();
  }
}

// Wizard는 Wand를 들 수 있다.
class Wand {
  final String _name;
  final double _power;

  Wand({
    required String name,
    required double power,
  })
      : _name = name,
        _power= power;

  String get name => _name;

  double get power => _power;

  // 1.마법사나 지팡이의 이름은 null일 수 없고, 반드시 3문자 이상이어야 한다.
  set name(String value) {
    if (value.length < 3) {
      throw Exception("이름은 반드시 3문자 이상");
    }
  }

  // 2. 지팡이의 마력은 0.5 이상 100.0 이하여야 한다.
  set power(double value) {
    if (value < 0.5 || value > 100) {
      throw Exception("지팡이의 마력은 0.5 이상 100.0 이하여야 한다.");
    }
  }
}

class Wizard {
  final String _name;
  final int _hp;
  late final int _mp;
  // 3. 마법사의 지팡이는 null 일 수 없다.
  final Wand wand;

  Wizard(
    this.wand, {
    required String name,
    required int hp,
    required int mp,
  }):
  _name = name,
  _hp = hp,
  _mp = mp;

  String get name => _name;
  int get hp => _hp;
  int get mp => _mp;

  // 1.마법사나 지팡이의 이름은 null일 수 없고, 반드시 3문자 이상이어야 한다.
  set name(String value) {
    if (value.length < 3) {
      throw Exception('이름은 3문자 이상이어야 한다.');
    }
  }
//  4. 마법사의 MP는 0 이상이어야 한다.
  set mp(int value) {
    if (value <0) {
      throw Exception('mp는 0 이상이어야 한다');
    }
    _mp = value; // _mp 필드에 값을 설정.
  }

//  5. HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다. (에러 아님)
  set hp(int value) {
    if (value < 0) {
      hp = 0;
    }
  }

  void heal(Hero hero) {
    hero.hp += 10;
  }
}

void main() {
  /* final hero = Hero(name: '홍길동', hp: 100);
  name과 hp의 초기화가 생성자 내에서 수행되지 않고
  setter를 통해 이루어지므로 클래스를 인스턴스화한 후에
  setter를 통해 값을 설정해야 한다.*/
  final hero = Hero();
  hero.name = 'abc';
  hero.hp = 40;

  // Wand 인스턴스 생성
  Wand wand = Wand(name: "Lightbringer", power: 50.0);

  // Wand 속성 출력
  print("Wand Name: ${wand.name}, Power: ${wand.power}");

  // Wizard 인스턴스 생성
  Wizard wizard = Wizard(wand, name: "Gandalf", hp: 100, mp: 30);

  // Wizard 속성 출력
  print("Wizard Name: ${wizard.name}, HP: ${wizard.hp}, MP: ${wizard.mp}");

  // Wand의 power를 변경하려는 시도
  try {
    wand.power = 0.4; // 에러를 발생시킬 값
  } catch (e) {
    print(e);
  }

  // Wizard의 name을 변경하려는 시도
  try {
    wizard.name = "Al"; // 에러를 발생시킬 값
  } catch (e) {
    print(e);
  }
}

/*
class Vehicle {
  String make;
  String model;
  int manufactureYear;
  int vehicleAge;
  String color;

  // getter - Read Only. 클래스 내부 설계 변경 가능. 필드로의 액세스 검사 가능.
  int get age {
    return vehicleAge;
  }

  // setter - Write Only. 클래스 내부 설계 변경 가능. 필드로의 액세스 검사 가능.
  void set age(int currentYear) {
    vehicleAge = currentYear - manufactureYear;
  }
}
 */
