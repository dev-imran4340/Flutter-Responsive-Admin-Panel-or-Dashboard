import 'package:get_storage/get_storage.dart';

const String _apiToken = "api_token";
const String userName = "userName";
const String _setCompanyData = "setCompanyData";
const String companyId = "companyId";
const String setProjectDetails = "setProjectDetails";
const String projectId = "projectId";
const String userRole = "setUserRole";
const String Otp = "Otp";
const String VarifySession = "VarifySession";
const String customMsgId = "customMsgId";
// const String deviceToken = "deviceToken";

// const String projectRoute = "projectRoute";
const String currentCompinesRoute = "currentCompinesRoute";

class AppPreferences {
  /// Set Api Token
  static setApiToken(String value) => GetStorage().write(_apiToken, value);

  /// Get Api Token
  static get getApiToken => GetStorage().read<String>(_apiToken);

  /// Remove Api Token
  static removeApiToken() => GetStorage().remove(_apiToken);

// set serRole
 static setUserRole( value) => GetStorage().write(userRole, value);

  /// Get serRole
  static get getserRole => GetStorage().read<String>(userRole);

  /// Remove serRole
  static removeserRole() => GetStorage().remove(userRole);
  /// Set userName
  static setUserName(String value) =>
      GetStorage().write(userName, value);

  /// Get userName
  static get getUserName => GetStorage().read<String>(userName);

  /// Remove userName
  static removeUserName() => GetStorage().remove(userName);

  /// Set Authentication Data
  static setSetCompanyData( value) =>
      GetStorage().write(_setCompanyData, value);

  /// Get Authentication Data
  static get getSetCompanyData =>
      GetStorage().read(_setCompanyData);

  /// Remove Authentication Data
  static removeSetCompanyData() => GetStorage().remove(_setCompanyData);

  // Set CompanyId
  static setCompanyId(int value) => GetStorage().write(companyId, value);

  /// Get CompanyId
  static get getCompanyId => GetStorage().read<int>(companyId);

  /// Remove  CompanyId
  static removeCompanyId() => GetStorage().remove(companyId);

  static setCustomMsgId(String value) => GetStorage().write(customMsgId, value);

  /// Get CustomMsgId

  static get getCustomMsgId => GetStorage().read<String>(customMsgId);

  /// Remove CustomMsgId
 static removeCustomMsgId() => GetStorage().remove(customMsgId);


  // set app authentication qr code
  static setProjectDetail( value) =>
      GetStorage().write(setProjectDetails, value);

  /// Get app authentication qr code
  static get getProjectDetail => GetStorage().read(setProjectDetails);

  /// Remove app authentication qr code
  static removeProjectDetail() => GetStorage().remove(setProjectDetails);

  // set user email for signup otp varify

  static setProjectId( value) => GetStorage().write(projectId, value);

  /// Get user email for signup otp varify
  static get getProjectId => GetStorage().read(projectId);

  /// Remove user email for signup otp varify
  static removeProjectId() => GetStorage().remove(projectId);

  // set reset password secret for reset password otp varify and reset password
  static setOtp(String value) =>
      GetStorage().write(Otp, value);

  /// Get eset password secret for reset password otp varify and reset password
  static get getOtp => GetStorage().read<String>(Otp);

  /// Remove eset password secret for reset password otp varify and reset password
  static removeOtp() => GetStorage().remove(Otp);

  /// Set VarifySession for varify app Authentication mfa
  static setVarifySession(String value) =>
      GetStorage().write(VarifySession, value);

  /// Get VarifySession for varify app Authentication mfa
  static get getVarifySession => GetStorage().read<String>(VarifySession);

  /// Remove VarifySession for varify app Authentication mfa
  static removeVarifySession() => GetStorage().remove(VarifySession);

  // /// Set project Route
  // static setProjectRoute(value) => GetStorage().write(projectRoute, value);

  // /// Get project Route
  // static get getProjectRoute => GetStorage().read<int>(projectRoute);

  // /// Remove project Route
  // static removeProjectRoute() => GetStorage().remove(projectRoute);

  /// Set currentRoute
  static setCompaniesCurrentRoute(value) => GetStorage().write(currentCompinesRoute, value);

  /// Get currentRoute
  static get getCompaniesCurrentRoute => GetStorage().read<int>(currentCompinesRoute);

  /// Remove currentRoute
  static removeCompaniesCurrentRoute() => GetStorage().remove(currentCompinesRoute);
}
