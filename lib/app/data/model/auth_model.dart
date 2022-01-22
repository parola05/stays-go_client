class Auth {
  late String username;
  late String tokenType;
  late String token;

  Auth({required this.username, required this.tokenType, required this.token});

  Auth.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    tokenType = "Bearer";
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['tokenType'] = this.tokenType;
    data['token'] = this.token;
    return data;
  }
}
