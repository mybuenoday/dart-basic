void main() {
  // List - 순서대로, 중복허용 / Map - key(중복불가) & value / Set - 순서없고 중복불가
  // 1-1. 대한민국 도시 이름 (순서 상관 없음) Set
  Set<String> cities = {'서울', '인천', '대전', '대구', '광주', '울산', '부산', '제주'};
  print("set cities: $cities");
  print("contains_제주: ${cities.contains('제주')}");
  print(cities.contains('제주'));
  // iterator
  final iterator = cities.iterator;
  while (iterator.moveNext()) {
    print(iterator.current);
  }

  // 1-2. 10명 학생 시험 점수. List 안의 Map
  List<Map<String, dynamic>> test = [{
    'name' : 'Kim',
    'score' : 100,
  },
    {
      'name' : 'Lee',
      'score': 99,
    },
  ];
  /*test.entries.forEach((element) {
    print(element.key);
  });*/

  print("< 10명 학생 점수 >");
  //(1)
  print("test: $test");
  //(2)
  test.forEach(print);
  //(3)
  test.forEach((grade){
    print("forEach((grade){: $grade");
  });
  //(4)
  for (final grade in test) {
    print("for in: $test");
  }
  //(5)
  for (int i = 0; i < test.length; i++) {
    print("for length: $test[i]");
  }

  // 1-3. 대한민국 도시별 인구수 (순서 상관 없음) Map
  Map<String, dynamic> population = {
    '서울' : 1000,
    '인천' : 300,
    '부산' : 200,
    '광주' : 150,
  };
  print("population: $population");
  population.entries.forEach((element) {
    print(element.key);
  });
  population.entries.forEach((element) {
    print(element.value);
  });
;
  // 2-2. 이름이 '홍길동', '한석봉'인 Person 인스턴스 생성, List에 담는다.
  List<Person> people = [Person('홍길동'), Person('한석봉')];
  print("people: $people");
  print("people[0].name: ${people[0].name}");
  for (int i = 0; i < people.length; i++) {
    print(people[i].name);
  }
}

// 2-1. 이름을 반드시 가지는 Person 클래스
class Person {
  final String name;
  Person(this.name);
}