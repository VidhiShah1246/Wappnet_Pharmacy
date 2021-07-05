class Login {
  late bool status;
  late String msg;
  late List<LoginData> data;

  Login({required this.status, required this.msg, required this.data});

  Login.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <LoginData>[];
      json['data'].forEach((v) {
        data.add(new LoginData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LoginData {
  late int id;
  late int roleId;
  late String fullName;
  late String email;
  late String autoDebit;
  late String dob;
  late String isNotificationEnable;
  late String isEmailEnable;
  late String completedCycle;
  late String location;
  late String paymentMethod;
  late String payoutEmail;
  late String payoutSecurityAns;
  late String payoutSecurityQes;
  late String photoUri;
  late String contactNumber;
  late String status;
  late String token;
  late String loginType;
  late String deviceType;
  late String fcmId;
  late String socialMediaType;
  late String socialMediaId;
  late String accountVerify;
  late String phoneVerify;
  late String otpCode;
  late String resetPassToken;
  late String createdAt;
  late String updatedAt;
  late String createdIp;
  late String updatedIp;
  late String userType;
  late String userPaymentCash;
  late String userPaymentEtransfer;
  late String userPaymentAutoDebit;
  late String userPaymentEmail;
  late String userPaymentSecurityQuestion;
  late String userPaymentSecurityAns;
  late String authToken;
  late String photoUriPath;

  LoginData(
      { required this.id,
        required this.roleId,
        required this.fullName,
        required this.email,
        required this.autoDebit,
        required this.dob,
        required this.isNotificationEnable,
        required this.isEmailEnable,
        required this.completedCycle,
        required this.location,
        required this.paymentMethod,
        required this.payoutEmail,
        required this.payoutSecurityAns,
        required this.payoutSecurityQes,
        required this.photoUri,
        required this.contactNumber,
        required this.status,
        required this.token,
        required this.loginType,
        required this.deviceType,
        required this.fcmId,
        required this.socialMediaType,
        required this.socialMediaId,
        required this.accountVerify,
        required this.phoneVerify,
        required this.otpCode,
        required this.resetPassToken,
        required this.createdAt,
        required this.updatedAt,
        required this.createdIp,
        required this.updatedIp,
        required this.userType,
        required this.userPaymentCash,
        required this.userPaymentEtransfer,
        required this.userPaymentAutoDebit,
        required this.userPaymentEmail,
        required this.userPaymentSecurityQuestion,
        required this.userPaymentSecurityAns,
        required this.authToken,
        required this.photoUriPath});

  LoginData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['role_id'];
    fullName = json['full_name'];
    email = json['email'];
    autoDebit = json['auto_debit'];
    dob = json['dob'];
    isNotificationEnable = json['is_notification_enable'];
    isEmailEnable = json['is_email_enable'];
    completedCycle = json['completed_cycle'];
    location = json['location'];
    paymentMethod = json['payment_method'];
    payoutEmail = json['payout_email'];
    payoutSecurityAns = json['payout_security_ans'];
    payoutSecurityQes = json['payout_security_qes'];
    photoUri = json['photo_uri'];
    contactNumber = json['contact_number'];
    status = json['status'];
    token = json['token'];
    loginType = json['login_type'];
    deviceType = json['device_type'];
    fcmId = json['fcm_id'];
    socialMediaType = json['social_media_type'];
    socialMediaId = json['social_media_id'];
    accountVerify = json['account_verify'];
    phoneVerify = json['phone_verify'];
    otpCode = json['otp_code'];
    resetPassToken = json['reset_pass_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdIp = json['created_ip'];
    updatedIp = json['updated_ip'];
    userType = json['user_type'];
    userPaymentCash = json['user_payment_cash'];
    userPaymentEtransfer = json['user_payment_Etransfer'];
    userPaymentAutoDebit = json['user_payment_auto_debit'];
    userPaymentEmail = json['user_payment_email'];
    userPaymentSecurityQuestion = json['user_payment_security_question'];
    userPaymentSecurityAns = json['user_payment_security_ans'];
    authToken = json['auth_token'];
    photoUriPath = json['photo_uri_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role_id'] = this.roleId;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['auto_debit'] = this.autoDebit;
    data['dob'] = this.dob;
    data['is_notification_enable'] = this.isNotificationEnable;
    data['is_email_enable'] = this.isEmailEnable;
    data['completed_cycle'] = this.completedCycle;
    data['location'] = this.location;
    data['payment_method'] = this.paymentMethod;
    data['payout_email'] = this.payoutEmail;
    data['payout_security_ans'] = this.payoutSecurityAns;
    data['payout_security_qes'] = this.payoutSecurityQes;
    data['photo_uri'] = this.photoUri;
    data['contact_number'] = this.contactNumber;
    data['status'] = this.status;
    data['token'] = this.token;
    data['login_type'] = this.loginType;
    data['device_type'] = this.deviceType;
    data['fcm_id'] = this.fcmId;
    data['social_media_type'] = this.socialMediaType;
    data['social_media_id'] = this.socialMediaId;
    data['account_verify'] = this.accountVerify;
    data['phone_verify'] = this.phoneVerify;
    data['otp_code'] = this.otpCode;
    data['reset_pass_token'] = this.resetPassToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_ip'] = this.createdIp;
    data['updated_ip'] = this.updatedIp;
    data['user_type'] = this.userType;
    data['user_payment_cash'] = this.userPaymentCash;
    data['user_payment_Etransfer'] = this.userPaymentEtransfer;
    data['user_payment_auto_debit'] = this.userPaymentAutoDebit;
    data['user_payment_email'] = this.userPaymentEmail;
    data['user_payment_security_question'] = this.userPaymentSecurityQuestion;
    data['user_payment_security_ans'] = this.userPaymentSecurityAns;
    data['auth_token'] = this.authToken;
    data['photo_uri_path'] = this.photoUriPath;
    return data;
  }
}
