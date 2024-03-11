class RecentChatModel {
  final String? id;
  final String? fromId;
  final String? toId;
  final String? userName;
  final String? lastMessage;
  final DateTime? time;

  RecentChatModel(
      {this.fromId,
      this.toId,
      this.id,
      this.userName,
      this.lastMessage,
      this.time});

  RecentChatModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fromId = json['fromId'],
        toId = json['toId'],
        userName = json['userName'],
        lastMessage = json['lastMessage'],
        time = DateTime.parse(json['time']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fromId': fromId,
      'toId': toId,
      'userName': userName,
      'lastMessage': lastMessage,
      'time': time,
    };
  }
}

class ChatModel {
  final String? id;
  final String? fromId;
  final String? toId;
  final String? userName;
  final String? message;
  final DateTime? time;

  ChatModel(
      {this.fromId,
      this.toId,
      this.id,
      this.userName,
      this.message,
      this.time});

  ChatModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fromId = json['fromId'],
        toId = json['toId'],
        userName = json['userName'],
        message = json['message'],
        time = DateTime.parse(json['time']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fromId': fromId,
      'toId': toId,
      'userName': userName,
      'message': message,
      'time': time,
    };
  }
}
