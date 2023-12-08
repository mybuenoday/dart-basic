class Book {
  String title;
  DateTime publishDate;
  String comment;

  Book({
    required this.title,
    // required this.publishDate,
    required DateTime publishDate,
    required this.comment,
}) : publishDate = DateTime(publishDate.year, publishDate.month, publishDate.day);

  // 3. 깊은 복사 생성자: 현재 객체의 복사본을 생성.
  Book copyWith({
    String? title,
    DateTime? publishDate,
    String? comment,
}) {
    return Book(
      title: title ?? this.title,
      publishDate: publishDate ?? this.publishDate,
      comment: comment ?? this.comment,
    );
  }

  // 1. 제목과 출간일이 같으면 같은 책으로 판단한다. 또한 Set에 넣으면 동일 객체로 판단한다.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          // other is Book을 사용하면 자동으로 동일한 타입인지 확인되므로 runtimeType을 비교하는 것은 일반적으로 필요하지 않음
          other is Book &&
              runtimeType == other.runtimeType &&
              title == other.title &&
              publishDate == other.publishDate;

  /* 제목과 출간일을 XOR 연산으로 해시코드를 생성한다.
    ^: XOR(배타적 논리합) 연산자, 8bit의 각 bit 자리 값이 다를 때 참(1), 같을 때 거짓(0)을 변환.
     01100100  (100의 이진수)
   ^ 11001000  (200의 이진수)
   -----------
     10101100  (XOR 연산 결과)
   */
  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  // 출간일을 다른 책과 비교
  int compareByPublishDate(Book other) => publishDate.compareTo(other.publishDate);
}


void main() {
  // Book 객체 생성
  final bookA = Book(title: '책A', comment: 'A 번째 책', publishDate: DateTime(2023, 1, 1));
  final bookB = Book(title: '책B', comment: 'B 번째 책', publishDate: DateTime(2023, 2, 1));
  final bookC = Book(title: '책A', comment: 'C 번째 책', publishDate: DateTime(2023, 1, 1));

  // 동등성 검사
  print('bookA와 bookB는 같은가? ${bookA == bookB}');
  print('bookA와 bookC는 같은가? ${bookA == bookC}');
  print("");

  // hashCode 검사
  print('bookA의 hashCode: ${bookA.hashCode}');
  print('bookB의 hashCode: ${bookB.hashCode}');
  print('bookC의 hashCode: ${bookC.hashCode}');
  print("");

  // List에 책 추가
  var books = <Book>[];
  books.add(bookA);
  books.add(bookB);
  books.add(bookC);

  // Set을 사용하여 중복 제거, 책의 수 출력
  var uniqueBooks = books.toSet();
  print('Set에 있는 책의 수: ${uniqueBooks.length}');
  // 정렬을 위해 순서가 있는 List로 변환
  var sortedBooks = uniqueBooks.toList();

  // 2. Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 오래된 순서대로 정렬한다.
  // 출간일 순으로 정렬
  sortedBooks.sort((a, b) => a.compareByPublishDate(b));
  print("출간일 순 정렬:");
  sortedBooks.forEach((book) => print('책제목: ${book.title}, 출간일: ${book.publishDate.toIso8601String().split('T')[0]}'));
  print("");
}