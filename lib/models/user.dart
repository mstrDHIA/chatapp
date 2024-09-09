import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? id;
  String? email;
  int? phone;
  String? username;
  String? psd;
  Timestamp? created;
  Timestamp? lastLogin;
  String? status;
  String? img;
  String? firstName;
  String? lastName;
  int? age;
  Timestamp? birthDate;
  String? country;
  String? state;
  String? city;
  String? address;
  GeoPoint? location;
  int? zipCode;




  User({this.zipCode,this.username, this.psd,this.id,this.address,this.age,this.birthDate,this.city,this.country,this.created,this.email,this.firstName,this.img,this.lastLogin,this.lastName,this.location,this.phone,this.state,this.status});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    psd = json['psd'];
    id = json['id'];
    address = json['address'];
    age = json['age'];
    birthDate = json['birthDate'];
    city = json['city'];
    country = json['country'];
    created = json['created'];
    email = json['email'];
    firstName = json['firstName'];
    img = json['img'];
    lastLogin = json['lastLogin'];
    lastName = json['lastName'];
    location = json['location'];
    state = json['state'];
    status = json['status'];
    phone = json['phone'];
    zipCode = json['zipCode'];
    
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['psd'] = psd;
    data['id'] = id;
    data['address'] = address;
    data['age'] = age;
    data['birthDate'] = birthDate;
    data['city'] = city;
    data['country'] = country;
    data['created'] = created;
    data['email'] = email;
    data['firstName'] = firstName;
    data['img'] = img;
    data['lastLogin'] = lastLogin;
    data['lastName'] = lastName;
    data['location'] = location;
    data['state'] = state;
    data['phone'] = phone;
    data['zipCode'] = zipCode;

    return data;
  }
}
