class ColorsModel {
  final String colorA;
  final String colorB;

  ColorsModel({
    required this.colorA,
    required this.colorB,
  });

  factory ColorsModel.fromJson(Map<String, dynamic> json) {
    return ColorsModel(
      colorA: json['color_a'] ?? "",
      colorB: json['color_b'] ?? "",
    );
  }
}