void main() {
  twonum(30, 15);
  twonum(12, 40);
  combine('모두연', '010', '1234', '5678');
  sequence(5, 10, 10);
}

void twonum(int N, int M) {
  if ((N % 2 == 0 && M % 2 != 0) || (M % 2 == 0 && N % 2 != 0)) {
    print("YES");
  } else {
    print("NO");
  }
}

void combine(String name, String phone1, String phone2, String phone3) {
  String combined = "$name $phone1-$phone2-$phone3";
  print(combined);
}

void sequence(int num1, int diff, int end) {
  for (int i = 0; i < end; i++) {
    int num = num1 + i * diff;
    print(num.toString() + (i < end - 1 ? " " : ""));
  }
} // String result에 +=으로 하나씩 추가 저장받고 for문 나와서 result 출력하는 건 메모리를 더 차지한다.

