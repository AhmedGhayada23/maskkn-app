
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreChat {


 static Future sendMessage(enteredMessage) async{
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance.collection('Users').doc(user!.uid).get();
    FirebaseFirestore.instance.collection('components').add(
        {
          'text': enteredMessage,
          'sentAt': Timestamp.now(),
          'username': userData['username'],
          'userId': user.uid,
        }
    );
  }
}