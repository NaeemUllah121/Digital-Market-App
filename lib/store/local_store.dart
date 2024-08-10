import 'package:shared_preferences/shared_preferences.dart';

class LocalStore {
  LocalStore._privateConstructor();

  static final LocalStore instance = LocalStore._privateConstructor();

  //KEYS
  final String language_key = 'language';
  final String device_token_key = 'device_token';
  final String first_time_event_expire = 'first_time_event_expire';
  final String login_key = 'login';
  final String user_id_key = 'user_id';
  final String user_data_key = 'user_data';
  final String event_data_key = 'event_data';
  final String uuid_key = 'uuid';
  final String access_token_key = 'access_token';
  final String all_joined_event_data_key = 'all_joined_event_data';

  //Access Token
  setAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(access_token_key, token);
  }

  Future<String> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString(access_token_key);
    return accessToken ?? "";
  }

  //UUID
  setUUID(String uuid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(uuid_key, uuid);
  }

  Future<String> getUUID() async {
    final prefs = await SharedPreferences.getInstance();
    String? uuid = prefs.getString(uuid_key);
    return uuid ?? "";
  }

  //Language
 static setUserId(String userId) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id_key', userId);

  }

  static getUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('user_id_key') ?? "";
  }

  //Language
  setLanguage(String lang) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(language_key, lang);
  }

  Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    String? lang = prefs.getString(language_key);
    return lang ?? "";
  }

  //Device Token
  setDeviceToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(device_token_key, token);
  }

  Future<String> getDeviceToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(device_token_key);
    return token ?? "";
  }

  Future setLogin(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(login_key, value);
  }

  Future<bool> getLogin() async {
    final prefs = await SharedPreferences.getInstance();
    bool? value = prefs.getBool(login_key);
    return value ?? false;
  }



  static setLoginStatus(bool isLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("logggedIn", isLoggedIn);
  }

  static setSampleAndCategoryId(String ids) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("ids", ids);
  }

  static getSampleAndCategoryId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("ids") ?? "";
  }

  static Future<bool> checkLoginStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool("logggedIn") ?? false;
  }

  static saveLoginDetails(
      {required String number, required String name}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("email", number);
    preferences.setString("name", name);
  }



//User Info
// Future setUserInfo(UserData data) async {
//   final prefs = await SharedPreferences.getInstance();
//   String encodedMap = json.encode(data.toJson());
//   await prefs.setString(user_data_key, encodedMap);
// }

// Future<UserData?> getUserInfo() async {
//   final prefs = await SharedPreferences.getInstance();
//   String? strUserInfo = prefs.getString(user_data_key);
//   if (strUserInfo != null) {
//     Map<String,dynamic> decodedMap = json.decode(strUserInfo);
//     var userInfo = UserData.fromJson(decodedMap);
//     return userInfo;
//   } else {
//     return null;
//
}
