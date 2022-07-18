class Course {
  String? timestamp;
  Status? status;
  List<Data>? data;

  Course({this.timestamp, this.status, this.data});

  Course.fromJson(Map<String, dynamic> json) {
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
  double? rating;
  String? description;
  String? level;
  String? urlImage;
  int? countUser;
  Category? category;

  Data(
      {this.id,
      this.title,
      this.rating,
      this.description,
      this.level,
      this.urlImage,
      this.countUser,
      this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    rating = json['rating'];
    description = json['description'];
    level = json['level'];
    urlImage = json['url_image'];
    countUser = json['count_user'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['rating'] = this.rating;
    data['description'] = this.description;
    data['level'] = this.level;
    data['url_image'] = this.urlImage;
    data['count_user'] = this.countUser;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? title;
  String? description;
  String? urlImage;

  Category({this.id, this.title, this.description, this.urlImage});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    urlImage = json['url_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url_image'] = this.urlImage;
    return data;
  }
}
