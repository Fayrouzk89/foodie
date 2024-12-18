
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class PreferenceSettingsHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferenceSettingsHelper({required this.sharedPreferences});

  static const dailyNotification = 'daily_notification';

  Future<bool> get isDailyNotificationActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(dailyNotification) ?? false;
  }

  void setDailyNotification(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(dailyNotification, value);
  }

  static const darkTheme = 'dark_theme';
  static const serverIP = 'serverIP';


  Future<bool> get isDarkTheme async {
    final prefs = await sharedPreferences;
    return prefs.getBool(darkTheme) ?? false;
  }

  void setDarkTheme(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(darkTheme, value);
  }

  Future<String> get getServerIp async {
    final prefs = await sharedPreferences;
    return prefs.getString(serverIP) ?? "";
  }

  setServerIp(String value) async {
    final prefs = await sharedPreferences;
    prefs.setString(serverIP, value);
    prefs.commit();
  }


  saveSettings( phenixUser) async {
    final prefs = await sharedPreferences;
    //prefs.setBool(isRegistred,LocalDataHelper.isRegistred);
    await prefs.commit();
  }
/*
  Future<PhenixUser> loadSettings() async {
    final prefs = await sharedPreferences;

    int isCloud=prefs.getInt(isCloudConst)??0;
    bool isRegistredDevice=prefs.getBool(isRegistred)??false;

    LocalDataHelper.isByCode=false;
    if(isCloud==1)
    LocalDataHelper.isCloud=true;
    else
      LocalDataHelper.isCloud=false;
    LocalDataHelper.isRegistred=isRegistredDevice;
    String comp= prefs.getString(companyName)??"";
    String branch= prefs.getString(branchName)??"";
    String user= prefs.getString(userName)??"";
    String pass=prefs.getString(password)??"";
    int compId= prefs.getInt(companyId)??-1;
    int brchId= prefs.getInt(branchId)??0;
    String? deviceIdentifier= prefs.getString(fingurePrint)??"";
    String? deName=prefs.getString(deviceName)??"";
    String? usrEmail=prefs.getString(UserEmail)??"";
    String? usrPassword=prefs.getString(UserPassword)??"";
    String? waiterPass="";

    String? cloudPassword=prefs.getString(PasswordCloud)??"";
    String? cloudUser=prefs.getString(UserCloud)??"";

    PhenixUser phenixUser=PhenixUser(comp,branch,compId,brchId,user,pass);
    phenixUser.deviceIdentifier=deviceIdentifier;
    phenixUser.deviceName=deName;
    phenixUser.userEmail=usrEmail;
    phenixUser.userPassword=usrPassword;
    phenixUser.waiterPassword=waiterPass;

    phenixUser.cloudUser=cloudUser;
    phenixUser.cloudPassword=cloudPassword;
    return phenixUser;
  }
  saveImportSettings(bool isImport) async {
    final prefs = await sharedPreferences;
    DateTime today = DateTime.now();
    String time=DateFormat('hh:mm:ss').format(DateTime.now());
    String dateStr = "${today.day}-${today.month}-${today.year} , $time";

    await prefs.commit();
  }

 */



}