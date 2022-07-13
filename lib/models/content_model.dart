class Content {
  String? timestamp;
  Status? status;
  Data? data;

  Content({this.timestamp, this.status, this.data});

  Content.fromJson(Map<String, dynamic> json) {
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
  List<Video>? video;
  List<Slide>? slide;
  List<Quiz>? quiz;

  Data({this.video, this.slide, this.quiz});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['video'] != null) {
      video = <Video>[];
      json['video'].forEach((v) {
        video!.add(new Video.fromJson(v));
      });
    }
    if (json['slide'] != null) {
      slide = <Slide>[];
      json['slide'].forEach((v) {
        slide!.add(new Slide.fromJson(v));
      });
    }
    if (json['quiz'] != null) {
      quiz = <Quiz>[];
      json['quiz'].forEach((v) {
        quiz!.add(new Quiz.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.video != null) {
      data['video'] = this.video!.map((v) => v.toJson()).toList();
    }
    if (this.slide != null) {
      data['slide'] = this.slide!.map((v) => v.toJson()).toList();
    }
    if (this.quiz != null) {
      data['quiz'] = this.quiz!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Video {
  int? id;
  String? title;
  String? description;
  String? link;
  bool? completed;

  Video({this.id, this.title, this.description, this.link, this.completed});

  Video.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    link = json['link'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['link'] = this.link;
    data['completed'] = this.completed;
    return data;
  }
}

class Slide {
  int? id;
  String? title;
  String? description;
  String? link;
  bool? completed;

  Slide({this.id, this.title, this.description, this.link, this.completed});

  Slide.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    link = json['link'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['link'] = this.link;
    data['completed'] = this.completed;
    return data;
  }
}

class Quiz {
  int? id;
  String? title;
  String? description;
  String? link;
  bool? completed;

  Quiz({this.id, this.title, this.description, this.link, this.completed});

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    link = json['link'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['link'] = this.link;
    data['completed'] = this.completed;
    return data;
  }
}
