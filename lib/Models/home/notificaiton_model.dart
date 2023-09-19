import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class NotificaitonModel {
  String? title;
  String body;
  Timestamp? time;
  String? forType;
  NotificaitonModel({
    required this.title,
    required this.body,
    required this.time,
    this.forType,
  });

  NotificaitonModel copyWith({
    String? title,
    String? body,
    Timestamp? time,
    String? forType,
  }) {
    return NotificaitonModel(
      title: title ?? title,
      body: body ?? this.body,
      time: time ?? this.time,
      forType: forType ?? this.forType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
      'time': time?.toString(),
      'for': forType,
    };
  }

  factory NotificaitonModel.fromMap(Map<String, dynamic> map) {
    return NotificaitonModel(
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      time: map['time'],
      forType: map['for'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificaitonModel.fromJson(String source) =>
      NotificaitonModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'NotificaitonModel(header: $title, description: $body, timestamp: $time)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NotificaitonModel &&
        other.title == title &&
        other.body == body &&
        other.time == time;
  }

  @override
  int get hashCode => title.hashCode ^ body.hashCode ^ time.hashCode;
}
