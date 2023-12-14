// https://jsonplaceholder.typicode.com/todos/1
/// userId : 1
/// id : 1
/// title : "delectus aut autem"
/// completed : false
// json 객체를 dart 클래스로 만들고 fromJson(), toJson() 추가. (받아올 객체를 모델 클래스로 만들기)

class TitleOnly {
  TitleOnly({
      num userId, 
      num id, 
      String title, 
      bool completed,}){
    _userId = userId;
    _id = id;
    _title = title;
    _completed = completed;
}

  TitleOnly.fromJson(dynamic json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
    _completed = json['completed'];
  }
  num _userId;
  num _id;
  String _title;
  bool _completed;
TitleOnly copyWith({  num userId,
  num id,
  String title,
  bool completed,
}) => TitleOnly(  userId: userId ?? _userId,
  id: id ?? _id,
  title: title ?? _title,
  completed: completed ?? _completed,
);
  num get userId => _userId;
  num get id => _id;
  String get title => _title;
  bool get completed => _completed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['id'] = _id;
    map['title'] = _title;
    map['completed'] = _completed;
    return map;
  }

}