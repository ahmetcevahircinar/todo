class Todo {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  /// Kurucu metod içerisindeki köşeli parantez alanın opsiyonel olduğunu belirtir
  Todo(this._title, this._priority, this._date, [this._description]);

  Todo.withId(this._id, this._title, this._priority, this._date,
      [this._description]);

  int get id => _id;

  String get title => _title;

  String get description => _description;

  int get priority => _priority;

  String get date => _date;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set description(String newD) {
    if (newD.length <= 255) {
      _description = newD;
    }
  }

  set priority(int newP) {
    if (newP > 0) {
      _priority = newP;
    }
  }

  set date(String newD) {
    _date = newD;
  }

  /// SQLite'a uyumlu hale getirmek için kullanılır
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["title"] = _title;
    map["description"] = _description;
    map["priority"] = _priority;
    map["date"] = _date;
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  /// SQLite'dan alınan nesneyi sınıfa çevirmek için kullanılır
  Todo.fromObject(dynamic o) {
    this._id = o["id"];
    this._title = o["title"];
    this._description = o["description"];
    this._priority = o["priority"];
    this._date = o["date"];
  }
}
