class UserData {
  String? timestamp;
  Status? status;
  Data? data;

  UserData({this.timestamp, this.status, this.data});

  UserData.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? phoneNumber;
  String? dateOfBirth;
  String? gender;
  String? employeeId;
  String? role;
  String? status;
  String? address;
  String? urlImage;
  User? user;

  Data(
      {this.id,
      this.phoneNumber,
      this.dateOfBirth,
      this.gender,
      this.employeeId,
      this.role,
      this.status,
      this.address,
      this.urlImage,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    employeeId = json['employee_id'];
    role = json['role'];
    status = json['status'];
    address = json['address'];
    urlImage = json['url_image'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone_number'] = this.phoneNumber;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['employee_id'] = this.employeeId;
    data['role'] = this.role;
    data['status'] = this.status;
    data['address'] = this.address;
    data['url_image'] = this.urlImage;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? email;
  String? fullName;

  User({this.email, this.fullName});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['full_name'] = this.fullName;
    return data;
  }
}
