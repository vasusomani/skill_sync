class ProjectModel {
  String? id;
  String? userId;
  String? userName;
  String? title;
  String? description;
  String? domain;
  String? subDomain;
  List<String>? skills;
  DateTime? startDate;
  int? duration;

  ProjectModel({
    this.id,
    this.userId,
    this.userName,
    this.title,
    this.description,
    this.domain,
    this.subDomain,
    this.skills,
    this.startDate,
    this.duration,
  });

  ProjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    userName = json['userName'];
    title = json['title'];
    description = json['description'];
    domain = json['domain'];
    subDomain = json['subDomain'];
    skills = json['skills'].cast<String>();
    startDate = DateTime.parse(json['startDate']);
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'title': title,
      'description': description,
      'domain': domain,
      'subDomain': subDomain,
      'skills': skills,
      'startDate': startDate,
      'duration': duration,
    };
  }
}
