class BookingclassModel {
  String? fullname;
  String? booktime;
  String? time;

  BookingclassModel({this.fullname, this.booktime, this.time});

  BookingclassModel.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    booktime = json['booktime'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['booktime'] = this.booktime;
    data['time'] = this.time;
    return data;
  }
}