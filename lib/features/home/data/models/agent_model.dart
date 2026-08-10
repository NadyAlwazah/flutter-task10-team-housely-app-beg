class AgentModel {
  final String image;
  final String name;
  final String role;
  final bool isOnline;
  AgentModel({
    required this.image,
    required this.name,
    required this.role,
    this.isOnline = true,
  });
  factory AgentModel.fromJson(Map<String, dynamic> json) {
    return AgentModel(
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      isOnline: json['isOnline'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {'image': image, 'name': name, 'role': role, 'isOnline': isOnline};
  }
}
