enum UrlPath {
  login,
  register,
  changePassword,
  forgetPasswordRequest,
  forgetPasswordComplete,
  registershop,
  verifyPin,
  deleteStudent,
  homeSubject,
}

class UrlPathHelper {
  static String getValue(UrlPath path) {
    switch (path) {
      case UrlPath.login:
        return "auth/login";
      case UrlPath.register:
        return "auth/register";
      case UrlPath.changePassword:
        return "auth/change-password";
      case UrlPath.forgetPasswordRequest:
        return "auth/reset-password/phone/request";
      case UrlPath.forgetPasswordComplete:
        return "auth/reset-password/complete";
      case UrlPath.registershop:
        return "student/add";
      case UrlPath.verifyPin:
        return "auth/verify-email/mobile";
      case UrlPath.deleteStudent:
        return "student/delete/";
      case UrlPath.homeSubject:
        return "subject/get";
    }
  }
}
