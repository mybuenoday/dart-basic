import 'Hero.dart';

class Slime {
  int hp = 50;
  final String suffix;

  Slime(this.suffix);

  void attack(Hero hero) {
    print('슬라임$suffix 이/가 공격했다');
    print('10의 데미지');
        hero.hp -= 10;
    }
}

// 1. 독 슬라임(PoisonSlime)은, 슬라임 (Slime) 중에서도 특히 "독 공격" 이 되는 것
class PoisonSlime extends Slime {
  // 2. PoisonSlime poisonSlime = PoisonSlime('A');
  PoisonSlime(String suffix) : super(suffix);
  // 3. PoisonSlime 독 공격이 가능한 남은 횟수를 int 형 필드를 가지고 있고 초기값은 5이다
  int poisonAttacksLeft = 5;

  //  4. PoisonSlime attack() 메소드가 호출되면 다음 내용의 공격을 한다
  void attack(Hero hero) {
    // 4-a. 보통 슬라임과 같은 공격
    super.attack(hero);
    // 4-b. "독 공격의 남은 횟수"가 0이 아니면
    if (poisonAttacksLeft > 0) {
      print('독 포자를 살포했다!'); // 4-c
      // 4-d. 용사의 HP 의 1/5에 해당하는 포인트를 용사의 HP 로부터 감소시키고
      final poisonDamage = hero.hp ~/ 5; // /는 double 반환, ~/는 int 반환
      hero.hp -= poisonDamage;
      print('$poisonDamage 포인트의 데미지'); // 4-d
      poisonAttacksLeft--; // 4-e
    }
  }
}

void main(){
  Hero hero = Hero(hp: 100);
  PoisonSlime poisonSlime = PoisonSlime('A');

  print('용사의 초기 HP: ${hero.hp}');
  poisonSlime.attack(hero);
  print('Slime의 공격 후 용사의 HP: ${hero.hp}');
}