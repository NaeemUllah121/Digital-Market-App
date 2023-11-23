enum UrlPath {
  login,
  register
}

class UrlPathHelper {
  static String getValue(UrlPath path) {
    switch (path) {
      case UrlPath.login:
        return "auth/login";
      case UrlPath.register:
        return "auth/register";
    }
  }
}
