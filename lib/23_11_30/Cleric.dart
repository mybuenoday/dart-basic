// 1. Cleric 클래스에 “이름", “HP”, “최대 HP”, “MP”, “최대 MP”를 속성으로 추가.
// 2. HP와 최대 HP는 정수로 초기치 50, MP와 최대 MP는 정수로 초기치 10으로 하고, 최대 HP와 최대 MP는 상수 필드로 선언.
// 3. Cleric 클래스에 인수가 없고, 리턴 값도 없는 “selfAid()” 메소드를 추가, MP를 5 소비하는 것으로 자신의 HP 를 최대 HP 까지 회복할 수 있다.
// 4. Cleric 클래스에 “pray()” 메소드를 추가. MP를 회복한다.
// 인수에 “기도 시간(초)"를 지정할 수 있고, 리턴 값은 “실제로 회복된 MP 양" 을 반환한다.
// 회복량은 기도 시간(초)에 랜덤하게 0 ~ 2포인트의 보정을 한 양이다
// (3초 기도하면 회복량은 3 ~ 5 포인트). 단, 최대 MP 보다 더 회복하는 것은 불가능.

import 'dart:math';

void main() {
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

class Cleric {
  String name;
  int hp = 50;
  final int maxHP = 50;
  int mp = 10;
  final int maxMP = 10;

  Cleric(this.name);

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
