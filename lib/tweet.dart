class Tweet {

  String _content;

  String _author;

  DateTime _date;

  Tweet(this._content, this._author, this._date);

  DateTime get date => _date;

  set date(DateTime value) {
    _date = value;
  }

  String get author => _author;

  set author(String value) {
    _author = value;
  }

  String get content => _content;

  set content(String value) {
    _content = value;
  }

  String getFormattedDate() {
    return "${_date.day.toString().padLeft(2, '0')}/${_date.month.toString().padLeft(2, '0')}/${_date.year.toString().padLeft(2, '0')} ${_date.hour.toString().padLeft(2, '0')}:${_date.minute.toString().padLeft(2, '0')}";
  }


}