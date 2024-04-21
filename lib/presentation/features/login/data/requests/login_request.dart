class LoginRequest {
  final String email, password, token, platform, deviceId;

  LoginRequest({
    required this.deviceId,
    required this.email,
    required this.password,
    required this.platform,
    required this.token,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "token": token,
        "platform": platform,
        "device_id": deviceId,
      };
}
