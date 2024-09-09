class Message {
  String? message;
  String? sentTime;

  Message({this.message, this.sentTime});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    sentTime = json['sent_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['sent_time'] = sentTime;
    return data;
  }
}
