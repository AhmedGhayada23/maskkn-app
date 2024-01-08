class ChantMessageModel {
  int? id;
  int? receiverId;
  String? message;
  int? seen;
  int? userId;
  int? propertyId;
  String? createdAt;
  String? updatedAt;
  String? sentMessageOnHumanReadable;

  ChantMessageModel({
    this.id,
    this.receiverId,
    this.message,
    this.seen,
    this.userId,
    this.propertyId,
    this.createdAt,
    this.updatedAt,
    this.sentMessageOnHumanReadable,
  });

  factory ChantMessageModel.fromJson(Map<String, dynamic> json) {
    return ChantMessageModel(
      id: json['id'],
      receiverId: json['receiver_id'],
      message: json['message'],
      seen: json['seen'],
      userId: json['user_id'],
      propertyId: json['property_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      sentMessageOnHumanReadable: json['SentMessageOnHumanReadable'],
    );
  }
}
