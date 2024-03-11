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
  bool? requestAccepted;
  String? status;

  ProjectModel(
      {this.id,
      this.userId,
      this.userName,
      this.title,
      this.description,
      this.domain,
      this.subDomain,
      this.skills,
      this.startDate,
      this.duration,
      this.status,
      this.requestAccepted});

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
    status = json['status'];
    requestAccepted = json['requestAccepted'];
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
      'status': status,
      'requestAccepted': requestAccepted
    };
  }
}
