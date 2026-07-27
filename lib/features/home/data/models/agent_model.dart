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
}
