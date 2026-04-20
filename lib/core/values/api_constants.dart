abstract class ApiConstants {
  ApiConstants._();
  static const String apiBaseUrl = "https://exam.elevateegy.com/api/v1/";
  static const String login = "auth/signin";
  static const String signup = "auth/signup";
  static const String changePassword = "auth/changePassword";
  static const String forgetPassword = "auth/forgotPassword";
  static const String verifyResetCode = "auth/verifyResetCode";
  static const String resetPassword = "auth/resetPassword";
  static const String subjects = "/subjects";
  static const String subjectById = "/subjects/{id}";
  static const String examsOnSubject = "exams";
  static const String getQuestions = "questions";
  static const String updateProfile = "auth/editProfile";
  static const String changePasswordProfile = "auth/changePassword";

}