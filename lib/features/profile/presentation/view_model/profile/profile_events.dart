sealed class ProfileEvents {}

class GetUserEvent extends ProfileEvents {}

class EnableEditEvent extends ProfileEvents {}

class DisableEditEvent extends ProfileEvents {}

class UpdateProfileEvent extends ProfileEvents {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  UpdateProfileEvent({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });
}
