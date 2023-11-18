

class FileUploadResponse {
  int? nonce;
  int? status;
  List<FileUploadData>? data;

  FileUploadResponse({
    this.nonce,
    this.status,
    this.data,
  });

  factory FileUploadResponse.fromJson(Map<String, dynamic> json) => FileUploadResponse(
    nonce: json["nonce"],
    status: json["status"],
    data: json["data"] == null ? [] : List<FileUploadData>.from(json["data"]!.map((x) => FileUploadData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "nonce": nonce,
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class FileUploadData {
  String? originalname;
  String? mimetype;
  int? size;
  String? url;
  String? eTag;
  String? key;
  String? bucket;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  FileUploadData({
    this.originalname,
    this.mimetype,
    this.size,
    this.url,
    this.eTag,
    this.key,
    this.bucket,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory FileUploadData.fromJson(Map<String, dynamic> json) => FileUploadData(
    originalname: json["originalname"],
    mimetype: json["mimetype"],
    size: json["size"],
    url: json["url"],
    eTag: json["eTag"],
    key: json["key"],
    bucket: json["bucket"],
    id: json["_id"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "originalname": originalname,
    "mimetype": mimetype,
    "size": size,
    "url": url,
    "eTag": eTag,
    "key": key,
    "bucket": bucket,
    "_id": id,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
