import 'package:skill_sync/models/project_model.dart';

class UserModel {
  String? id;
  String? email;
  String? name;
  int? phoneNumber;
  int? age;
  String? occupation;
  String? gender;
  String? domain;
  String? subDomain;
  List<String>? skills;
  PortfolioModel? portfolio;
  List<ProjectModel>? projects;
  String? level;

  UserModel({
    this.id,
    this.email,
    this.name,
    this.phoneNumber,
    this.age,
    this.occupation,
    this.gender,
    this.domain,
    this.subDomain,
    this.skills,
    this.portfolio,
    this.projects,
    this.level,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    age = json['age'];
    occupation = json['occupation'];
    gender = json['gender'];
    domain = json['domain'];
    subDomain = json['subDomain'];
    skills = json['skills'].cast<String>();
    portfolio = json['portfolio'] != null
        ? PortfolioModel.fromJson(json['portfolio'])
        : null;
    if (json['projects'] != null) {
      projects = <ProjectModel>[];
      json['projects'].forEach((v) {
        projects!.add(ProjectModel.fromJson(v));
      });
    }
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'age': age,
      'occupation': occupation,
      'gender': gender,
      'domain': domain,
      'subDomain': subDomain,
      'skills': skills,
      'portfolio': portfolio?.toJson(),
      'projects': projects?.map((e) => e.toJson()).toList(),
      'level': level,
    };
  }
}

class PortfolioModel {
  String? id;
  String? githubProfile;
  String? linkedInProfile;
  String? behanceProfile;
  String? portfolioWebsite;
  String? resume;

  PortfolioModel({
    this.id,
    this.githubProfile,
    this.linkedInProfile,
    this.behanceProfile,
    this.portfolioWebsite,
    this.resume,
  });

  PortfolioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    githubProfile = json['githubProfile'];
    linkedInProfile = json['linkedInProfile'];
    behanceProfile = json['behanceProfile'];
    portfolioWebsite = json['portfolioWebsite'];
    resume = json['resume'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'githubProfile': githubProfile,
      'linkedInProfile': linkedInProfile,
      'behanceProfile': behanceProfile,
      'portfolioWebsite': portfolioWebsite,
      'resume': resume,
    };
  }
}
