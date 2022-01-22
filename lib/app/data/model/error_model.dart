class Erro {
  late String message;

  Erro({required this.message});

  Erro.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
  
  String errorToString(){
    return message;
  }
}
