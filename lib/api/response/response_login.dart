class Responselogin {
  String? timestamp;
  Status? status;
  Data? data;

  Responselogin({this.timestamp, this.status, this.data});

  Responselogin.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    if (status != null) {
      data['status'] = status!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class Data {
  String? fullName;
  String? token;
  List<String>? role;

  Data({this.fullName, this.token, this.role});

  Data.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    token = json['token'];
    role = json['role'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['token'] = this.token;
    data['role'] = this.role;
    return data;
  }
}
