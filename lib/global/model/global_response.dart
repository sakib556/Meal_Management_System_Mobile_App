class GlobalResponse {
  GlobalResponse({
    this.message,
    this.status,
  });

  String? message;
  int? status;

  factory GlobalResponse.fromJson(Map<String, dynamic> json) => GlobalResponse(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
