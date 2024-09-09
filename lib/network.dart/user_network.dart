import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stream/global_data.dart';
import 'package:stream/models/user.dart';

class UserNetwork {
  FirebaseFirestore db = FirebaseFirestore.instance;
  login({username,psd}) async {
    print(username);
    print(psd);
   QuerySnapshot<Map<String, dynamic>> res= await db.collection("users").where('username',isEqualTo: username).where('psd',isEqualTo: psd).get();
   if(res.docs.isNotEmpty){
      print('logged in');
      // print(res.docs.first.);
      return User.fromJson(res.docs.first.data());
   }
   else{
    print('not');
   }
  }

  Future<bool> checkUniqueUsername(username) async {
    QuerySnapshot<Map<String, dynamic>> res= await db.collection("users").where('username',isEqualTo: username).get();
    if(res.docs.isEmpty) return true;
    print(res.docs.first.data()['username']);
    return false;
  }

  signup({username,psd}) async {
    try {
      User user=User(
        address: null,
        age: null,
        birthDate: null,
        city: null,
        country: null,
        created: Timestamp.now(),
        email: null,
        firstName: null,
        img: null,
        lastLogin: Timestamp.now(),
        lastName: null,
        // location: GeoPoint(0, 0)
        phone: null,
        psd: psd,
        username: username,
        state: null,
        status: null,
        zipCode: null

      );
        await FirebaseFirestore.instance.collection('users').doc('dhia').set(user.toJson());
        
        // .add(
        //  user.toJson());
        // chatController.clear();
      } catch (e) {
        print(e);
      }
  }


   getUsers() async {
    QuerySnapshot<Map<String, dynamic>> res= await db.collection("users").where('username',isNotEqualTo: GlobalData.user.username).get();
   if(res.docs.isNotEmpty){
    return res.docs;
    // return User.fromJson(res.docs.first.data());
   }
  }


  updateUser({address,age,birthDate,city,country,created,email,firstName,img,lastLogin,lastName,phone,state,zipCode}) async {
    User user=User(
        address: address,
        age: int.parse(age),
        birthDate: birthDate,
        city: city,
        country: country,
        created: GlobalData.user.created,
        email: email,
        firstName: firstName,
        img: img,
        
        lastLogin: GlobalData.user.lastLogin,
        lastName: lastName,
        location: GlobalData.user.location,
        phone: int.parse(phone),
        psd: GlobalData.user.psd,
        username: GlobalData.user.username,
        state: state,
        status: GlobalData.user.status,
        zipCode: int.parse(zipCode)

      );
    await FirebaseFirestore.instance.collection('users').doc(GlobalData.user.username).update(user.toJson());
  }

}