abstract class UserRepository {
  Future<void> changePassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  });
}
