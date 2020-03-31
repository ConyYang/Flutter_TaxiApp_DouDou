import 'package:firebase_auth/firebase_auth.dart';
import 'package:singtaxi/models/user.dart';
import 'package:singtaxi/services/database.dart';

    class AuthService {

      final FirebaseAuth _auth = FirebaseAuth.instance;

      //create user obj based on FirebaseUser
      User _userFromFirebaseUser(FirebaseUser user) {
        return user != null ? User(uid: user.uid) : null;
      }

      // auth change user stream
      Stream<User> get user {
        return _auth.onAuthStateChanged
            //.map((FirebaseUser user) => _userFromFirebaseUser(user));
          .map(_userFromFirebaseUser);
      }

      //sign in anon

      Future signInAnon() async {
        try{
          AuthResult result = await _auth.signInAnonymously();
          FirebaseUser user = result.user;
          return _userFromFirebaseUser(user);
        } catch(e) {
          print(e.toString());
          return null;
        }

      }



      //sign in email and pass
      Future signInWithEmailAndPassword(String email, String password) async {
        try{
          AuthResult result = await _auth.signInWithEmailAndPassword(email: email,password :password);
          FirebaseUser user = result.user ;

         // if (user.isEmailVerified) {
            return _userFromFirebaseUser(user);
         // }
        }catch (e){
          print(e.toString());
          return null;

        }

      }
      //reg with email and pass

      Future registerWithEmailAndPassword(String email, String password) async {
        try{
          AuthResult result = await _auth.createUserWithEmailAndPassword(email: email,password :password);
          FirebaseUser user = result.user ;
/*
          try {
            await user.sendEmailVerification();
          }
          catch (e){
            print('An Error occured while trying to send email verification');
            print(e.toString());
            return null;

          }
          */
          //create a new coment for the user
          await DatabaseService(uid: user.uid).updateUserData(false,'New User', 'NILL', 0, 0, false, email, 'NILL', 'NILL', 'NILL');


          return _userFromFirebaseUser(user);
        }catch (e){
          print('An Error occured while trying to send email verification');
          print(e.toString());
          return null;

        }

      }


//reset password
      Future  resetPassword(String email) async {
        try {
          await _auth.sendPasswordResetEmail(email: email);
          return 1;
        } catch (e) {
          print(e.toString());
          return null;
        }
      }



      //sign out
    Future signOut() async {
        try {
          return await _auth.signOut();
        } catch(e){
          print(e.toString());
          return null;
        }
    }
    }