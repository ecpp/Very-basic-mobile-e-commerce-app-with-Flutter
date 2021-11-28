
class User {
  int UserID;
  String fullname;
  String homeaddress;
  int taxid;
  String phonenumber;
  String email;
  String role;
  String registeredat;
  String lastlogin;

  User(
      {required this.UserID,
        required this.fullname,
        required this.homeaddress,
        required this.taxid,
        required this.phonenumber,
        required this.email,
        required this.role,
        required this.registeredat,
        required this.lastlogin,});

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
      UserID: json['UserID'],
      fullname: json['fullname'],
      homeaddress: json['homeaddress'],
      taxid: json['taxid'],
      phonenumber: json['phonenumber'],
      email: json['email'],
      role: json['role'],
      registeredat: json['registeredat'],
      lastlogin: json['lastlogin'],
    );
  }
}