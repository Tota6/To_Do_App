// class That mange data comes from FireStore
import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/user.dart';

class UserDao {
  static Future<User?> getUser(String uid) async {
    var userCollection = getUserCollection();
    var doc = userCollection.doc(uid);
    var docSnapShot = await doc.get();
    return docSnapShot.data();
  }

  static CollectionReference<User> getUserCollection() {
    //Need an object of firebase collection of data
    return FirebaseFirestore.instance
        .collection("users")
        // function depending on how to get and upload data to firestore
        .withConverter(
          fromFirestore: (snapshot, options) =>
              //snapshot is gives a data view from database
              User.fromFireStore(snapshot.data()),
          //data that will uploaded to firestore
          toFirestore: (user, options) => user.toFireStore(),
        );
  }

  //First action is to add user in database
  static Future<void> addUser(User user) {
    var userCollection = getUserCollection();
    //we user user.id to set the id if database as the id of authentication
    //Note: we can use add to set the value of the id by Auto Generated
    var doc = userCollection.doc(user.id);
    return doc.set(user);
  }
}
