class ImageResponse {
  ImageResponse({
      this.prediction,});

  ImageResponse.fromJson(dynamic json) {
    prediction = json['prediction'];
  }
  String? prediction;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['prediction'] = prediction;
    return map;
  }

}