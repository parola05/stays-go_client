class Evaluation {
  late String user;
  late String hotelName;
  late String stars;
  late String date;
  late String text;
  late String hotelImagePath;

  Evaluation({
      required this.user,
      required this.hotelName,
      required this.stars,
      required this.date,
      required this.text,
      required this.hotelImagePath
  });
  
   Evaluation.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    hotelName = json['hotelName'];
    stars = json['stars'].toString();
    date = json['date'];
    text = json['text'];
    hotelImagePath = json['hotelImagePath'];
  }
}
