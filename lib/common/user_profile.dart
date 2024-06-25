class UserProfile {
  final String username;
  final String location;
  final int followers;
  final int following;
  final String gender;
  final String email;
  final String password;

  UserProfile({
    required this.username,
    required this.location,
    required this.followers,
    required this.following,
    required this.gender,
    required this.email,
    required this.password,
    required String name,
  });
}
