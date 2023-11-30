// Dart는 객체 지향
// 클래스 (class) - 객체를 생성하기 위한 템플릿 또는 청사진, 설계도. 실물을 찍어내기 위한 틀

class Person { // 객체의 행동, 상태 정의
  // 상태 - 멤버 변수
  String name; // 사람마다 다른 속성
  int age;

  // 생성자[Constructor]: 클래스를 실물로 찍어낼 때 가장 먼저 호출되는 지점(함수)
  Person(this.name, this.age);

  // 행동 - 메서드[함수]
  void sayHello() {
    print("안녕하세요, 저는 $name이고, $age살 입니다.");
  }
}

// 상속: 기존 클래스의 특성을 다른 클래스에서 재사용하고 확장하는 매커니즘.
// 부모 클래스[super class]와 자식 클래스[sub class] 간에 상속.
class Man extends Person {
  Man(String name, int age) : super(name, age);

  @override // 부모 클래스에 있는 매커니즘을 그대로 동작시키고,
  // 자식 클래스에서 이어받아 추가적인 메서드 동작을 정의.
  void sayHello() {
    super.sayHello(); // 부모 클래스에 정의되어 있는 함수를 호출
    print('\n제 성별은 남자 입니다.');
  }
}

class Woman extends Person {
  Woman(String name, int age) : super(name, age);

  @override // 부모 클래스에 있는 매커니즘을 그대로 동작시키고,
  // 자식 클래스에서 이어받아 추가적인 메서드 동작을 정의.
  void sayHello() {
    super.sayHello(); // 부모 클래스에 정의되어 있는 함수를 호출
    print('\n제 성별은 여자 입니다.');
  }
}
void main() {
  Person abc = Person('myday', 8); // 생성자를 호출하여 클래스 인스턴스를 생성. 메모리 할당.
  Person abd = Person('bien', 20);
  Person abe = Person('bueno', 25);

  abc.sayHello(); // 함수 내의 메서드 호출
  abd.sayHello();

  var man = Man('홍길동', 100);
  man.sayHello();
}