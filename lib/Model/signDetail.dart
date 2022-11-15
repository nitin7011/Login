
class SignDetail {
  late String email;
  late String firstname;
  late String mobile;
  late String password;

  SignDetail(this.email,this.firstname,this.mobile,this.password);

  SignDetail.fromMap(Map map){
    email = map["email"];
    firstname = map["firstname"];
    mobile = map["mobile"];
    password = map["password"];
  }

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "firstname": firstname,
      "mobile": mobile,
      "password": password,

    };
  }

}