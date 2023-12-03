// 11/30/2023
// 1. Cleric 클래스에 “이름", “HP”, “최대 HP”, “MP”, “최대 MP”를 속성으로 추가.
// 2. HP와 최대 HP는 정수로 초기치 50, MP와 최대 MP는 정수로 초기치 10으로 하고, 최대 HP와 최대 MP는 상수 필드로 선언.
// 3. Cleric 클래스에 인수가 없고, 리턴 값도 없는 “selfAid()” 메소드를 추가, MP를 5 소비하는 것으로 자신의 HP 를 최대 HP 까지 회복할 수 있다.
// 4. Cleric 클래스에 “pray()” 메소드를 추가. MP를 회복한다.
// 인수에 “기도 시간(초)"를 지정할 수 있고, 리턴 값은 “실제로 회복된 MP 양" 을 반환한다.
// 회복량은 기도 시간(초)에 랜덤하게 0 ~ 2포인트의 보정을 한 양이다
// (3초 기도하면 회복량은 3 ~ 5 포인트). 단, 최대 MP 보다 더 회복하는 것은 불가능.

import 'dart:math';

void main() {
  // 2-a. 이름, HP, MP 를 지정하여 인스턴스화 할 수 있다
  Cleric a = Cleric("아서스", hp: 40, mp: 5);
  print("${a.name}의 HP: ${a.hp}, MP: ${a.mp}");
  // 2-b. 이 클래스는 Cleric(“아서스", hp: 35) 와 같이, 이름과 HP만으로 지정하여 인스턴스화 할 수 있다.
  // 이 때, MP는 최대 MP와 같은 값이 초기화 된다.
  Cleric b = Cleric("아서스", hp: 35);
  print("${b.name}의 HP: ${b.hp}, MP: ${b.mp}");
  // 2-c. 이 클래스는 Cleric(“아서스") 와 같이 이름만을 지정하여 인스턴스화 할 수 있다.
  // 이 때, HP 와 MP 는 최대 HP와 최대 MP로 초기화 된다
  Cleric c = Cleric("아서스");
  print("${c.name}의 HP: ${c.hp}, MP: ${c.mp}");
  // 2-d. 이 클래스는 Cleric() 과 같이 이름을 지정하지 않는 경우에는 인스턴스화 할 수 없다고 한다. (이름이 없는 성직자는 존재 할 수 없음)
  // 에러; Cleric error = Cleric();
  // 2-e 생성자는 가능한 한 중복되는 코드가 없도록 작성한다.

  Cleric cleric = Cleric("yj");
  print("${cleric.name}의 HP: ${cleric.hp}, MP: ${cleric.mp}");

  cleric.hp -= 1;
  cleric.mp -= 3;
  print("\nHP-1, MP-3; ${cleric.name}의 HP: ${cleric.hp}, MP: ${cleric.mp}");

  int sec = 0;
  int recovery = cleric.pray(sec);
  print("\n$sec초 기도 후 ${cleric.name}의 HP: ${cleric.hp}, MP: ${cleric.mp}");
  print("실제 회복된 MP 량: $recovery");

  cleric.selfAid();
  print("\nselfAid 이후 ${cleric.name}의 HP: ${cleric.hp}, MP: ${cleric.mp}");

  sec = 3;
  recovery = cleric.pray(sec);
  print("\n$sec초 기도 후 ${cleric.name}의 HP: ${cleric.hp}, MP: ${cleric.mp}");
  print("실제 회복된 MP 량: $recovery");
}

// 12/01/2023
// 1. final int maxHP = 50;은 각 인스턴스별로 최대 HP 필드에 정보를 가지고 있다.
// 모든 성직자의 최대 HP 는 50, 최대 MP 는 10으로 정해져 있으므로,
// 최대 HP, 최대 MP의 필드가 각 인스턴스별로 정보를 가지는 메모리 낭비를 하지 않도록, static const.

class Cleric {
  String name;
  int hp = 50;
  // static: 클래스의 모든 인스턴스에 대해 공유되는 정적(static) 변수로 선언. 프로그램 실행 중에 변경될 수 있다.
  // static const: 정적(static)이면서 상수(const)로 선언. 프로그램 전체에서 공유되고 한 번 설정되면 변경할 수 없다. 컴파일 타임에 값이 결정되며, 런타임에는 변경할 수 없다.
  static const int maxHP = 50;
  int mp = 10;
  static const int maxMP = 10;

  // 2-a. 이 클래스는 Cleric(“아서스", hp: 40, mp: 5) 와 같이, 이름, HP, MP 를 지정하여 인스턴스화 할 수 있다
  // Cleric(this.name, this.hp, this.mp);

  // 2-b. 이 클래스는 Cleric(“아서스", hp: 35) 와 같이, 이름과 HP만으로 지정하여 인스턴스화 할 수 있다.
  // 이 때, MP는 최대 MP와 같은 값이 초기화 된다.
  // Cleric(this.name, this.hp): this.mp = maxMP;

  // 2-c 이 클래스는 Cleric(“아서스") 와 같이 이름만을 지정하여 인스턴스화 할 수 있다.
  // 이 때, HP 와 MP 는 최대 HP와 최대 MP로 초기화 된다
  // Cleric(this.name): this.hp = maxHP, this.mp = maxMP;

/*  2-d. 이 클래스는 Cleric() 과 같이 이름을 지정하지 않는 경우에는 인스턴스화 할 수 없다고 한다. (이름이 없는 성직자는 존재 할 수 없음)
  Named parameter: {}안에 선언. 생성자 호출 시 매개변수 이름을 명시해야 한다. 순서 상관없고 선택적 제공 가능.
  ex. functionName(param1: value1, param2: value2)
  모든 매개변수를 동등하게 취급하고 싶거나, 함수 호출 시 매개변수의 순서를 자유롭게 하고 싶다면 더 적합.*/
/*  Cleric({required this.name, int? hp, int? mp}): // int? hp: hp가 null일 수도 있음. nullable
      this.hp = hp ?? maxHP, // hp가 null이면 maxHP, null이 아니면 hp
      this.mp = mp ?? maxMP; // ??는 null-aware 연산자*/

/*  Positional parameter: {} 없이 선언. 생성자 호출 시 정의된 순서대로 값을 전달해야 한다.
  ex. functionName(value1, value2)
  name이 항상 필요하고, 나머지 매개변수는 선택적이므로 positional parameter 방식이 더 직관적.*/
  Cleric(this.name, {int? hp, int? mp}):
      this.hp = hp ?? maxHP,
      this.mp = mp ?? maxMP;

  // 2-e 생성자는 가능한 한 중복되는 코드가 없도록 작성한다.

  // 중괄호 {} 안에 있는 매개변수는 선택적 매개변수. 필수가 아니며, 제공되지 않을 수 있다.
  /*Cleric(this.name, {int? hp, int? mp})
      : this.hp = hp ?? maxHP, // hp가 null이면 maxHP, null이 아니면 hp
        this.mp = mp ?? maxMP;
  */
  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHP;
    }
  }

  int pray(int sec) {
    if (sec > 0) {
      Random random = Random();
      int before = mp;
      mp += sec + random.nextInt(3);
      int after = (mp > maxMP) ? maxMP : mp;
      return after - before;
    }
    return 0;
  }
}
