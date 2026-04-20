class UserEntity {
  final String id;
  final String userName;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;

  const UserEntity(
      {required this.id,
      required this.userName,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email});
}
