class Tweet {

  int _id;
  String _profile;
  String _message;
  String _author;
  DateTime _created_date;

  Tweet(this._id, this._profile, this._message, this._author, this._created_date);

  Tweet.fromJson(Map<String, dynamic> json): this(json['id'], json['profile'], json['message'], json['author'], DateTime.fromMillisecondsSinceEpoch((json['created_date'] ?? DateTime.now().millisecondsSinceEpoch) * 1000),);

  String getFormattedDate() {
    return "${_created_date.day.toString().padLeft(2, '0')}/${_created_date.month.toString().padLeft(2, '0')}/${_created_date.year.toString().padLeft(2, '0')} ${_created_date.hour.toString().padLeft(2, '0')}:${_created_date.minute.toString().padLeft(2, '0')}";
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get profil => _profile;

  set profil(String value) {
    _profile = value;
  }
  
  DateTime get created_date => _created_date;

  set created_date(DateTime value) {
    _created_date = value;
  }

  String get author => _author;

  set author(String value) {
    _author = value;
  }

  String get message => _message;

  set message(String value) {
    _message = value;
  }
  
}