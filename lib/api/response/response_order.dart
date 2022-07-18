class ResponseOrder {
  String? timestamp;
  Status? status;
  Data? data;

  ResponseOrder({this.timestamp, this.status, this.data});

  ResponseOrder.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  String? id;
  String? orderDate;
  User? user;
  Course? course;

  Data({this.id, this.orderDate, this.user, this.course});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderDate = json['order_date'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    course =
        json['course'] != null ? new Course.fromJson(json['course']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_date'] = this.orderDate;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.course != null) {
      data['course'] = this.course!.toJson();
    }
    return data;
  }
}

class User {
  String? fullName;
  String? email;

  User({this.fullName, this.email});

  User.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    return data;
  }
}

class Course {
  int? id;
  String? title;
  double? rating;
  String? description;
  String? level;
  String? urlImage;
  Category? category;

  Course(
      {this.id,
      this.title,
      this.rating,
      this.description,
      this.level,
      this.urlImage,
      this.category});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    rating = json['rating'];
    description = json['description'];
    level = json['level'];
    urlImage = json['url_image'];
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
