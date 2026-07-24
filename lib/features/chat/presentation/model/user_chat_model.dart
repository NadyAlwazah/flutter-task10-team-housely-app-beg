class UserChatModel {
  final String name;
  final String image;
  final bool isOnline;

  const UserChatModel({
    required this.name,
    required this.image,
    this.isOnline = true,
  });
}