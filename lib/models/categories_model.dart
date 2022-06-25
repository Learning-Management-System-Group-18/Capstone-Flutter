class Categories {
  String? timestamp;
  Status? status;
  List<Data>? data;

  Categories({this.timestamp, this.status, this.data});

  Categories.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Status {
  String? code;
  String? message;

  Status({this.code, this.message});

  Status.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  String? urlImage;
  int? countCourse;
  int? countUser;

  Data(
      {this.id,
      this.title,
      this.description,
      this.urlImage,
      this.countCourse,
      this.countUser});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    urlImage = json['url_image'];
    countCourse = json['count_course'];
    countUser = json['count_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url_image'] = this.urlImage;
    data['count_course'] = this.countCourse;
    data['count_user'] = this.countUser;
    return data;
  }
}
