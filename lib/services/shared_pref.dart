import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static String userIdKey = "USERKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userImageKey = "USERIMAGEKEY";

  // Set Methods
  // User ID
  Future<bool> saveUserId(String getUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(userIdKey, getUserId);
  }

  // UserName
  Future<bool> saveUserName(String getUserName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(userNameKey, getUserName);
  }

  // UserEmail
  Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(userEmailKey, getUserEmail);
  }

  // UserImage
  Future<bool> saveUserImage(String getUserImage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(userImageKey, getUserImage);
  }

  // Get Methods
  // User ID
  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(userIdKey);
  }

  // User Name
  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(userNameKey);
  }

  // User Email
  Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(userEmailKey);
  }

  // User Image
  Future<String?> getUserImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(userImageKey);
  }
}
