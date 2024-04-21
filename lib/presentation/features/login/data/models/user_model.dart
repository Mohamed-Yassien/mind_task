class UserModel {
  bool? status;
  String? msg;
  UserData? data;

  UserModel({this.status, this.msg, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  String? id;
  String? email;
  String? active;
  String? name;
  String? notifications;
  String? profilePhoto;
  String? authKey;
  dynamic favoriteId;

  UserData({
    this.id,
    this.email,
    this.active,
    this.name,
    this.notifications,
    this.profilePhoto,
    this.authKey,
    this.favoriteId,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    active = json['active'];
    name = json['name'];
    notifications = json['notifications'];
    profilePhoto = json['profile_photo'];
    authKey = json['auth_key'];
    favoriteId = json['Favorite_id'];
  }
}
