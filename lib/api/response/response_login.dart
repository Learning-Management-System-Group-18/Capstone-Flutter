class Responselogin {
  String? timestamp;
  Status? status;
  Data? data;

  Responselogin({this.timestamp, this.status, this.data});

  Responselogin.fromJson(Map<String, dynamic> json) {
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
  String? token;
  List<String>? role;

  Data({this.token, this.role});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    role = json['role'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['role'] = this.role;
    return data;
  }
}
