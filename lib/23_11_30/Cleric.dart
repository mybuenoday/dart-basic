import 'dart:math';
void main() {
  Cleric cleric = Cleric("yj");
  print("${cleric.name}의 HP: ${cleric.HP}, MP: ${cleric.MP}");
  int sec = 4;
  cleric.pray(sec);
  print("$sec초 기도 후 ${cleric.name}의 HP: ${cleric.HP}, MP: ${cleric.MP}");
  cleric.selfAid();
  print("selfAid 이후 ${cleric.name}의 HP: ${cleric.HP}, MP: ${cleric.MP}");
}

class Cleric{
  String name;
  int HP = 50;
  final int maxHP = 50;
  int MP = 10;
  final int maxMP = 10;
  Cleric(this.name);

  void selfAid() {
    if (MP >= 5) {
      MP -= 5;
      HP = maxHP;
    }
  }

  int pray(int sec) {
    Random random = Random();
    MP += sec + random.nextInt(3);
    MP = MP > maxMP? maxMP: MP;
    return MP;
  }
}