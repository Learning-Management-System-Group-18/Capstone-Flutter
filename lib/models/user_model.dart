class User {
  int? createdAt;
  String? name;
  String? email;
  String? password;
  String? noPhone;
  String? alamat;
  String? status;
  String? id;

  User(
      {this.createdAt,
      this.name,
      this.email,
      this.password,
      this.noPhone,
      this.alamat,
      this.status,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    noPhone = json['noPhone'];
    alamat = json['alamat'];
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['noPhone'] = noPhone;
    data['alamat'] = alamat;
    data['status'] = status;
    data['id'] = id;
    return data;
  }
}
