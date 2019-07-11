import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/model/user_model.dart';
import 'package:loja_virtual/bloc/user_bloc.dart';

class LoginService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  Future<FirebaseUser>  login(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(email: email, password: password).then((FirebaseUser user){
      UserBloc().setUser(getUserData(user));
    });
  }

  Future<FirebaseUser> singIn( UserModel userData, String password) async {
   return await _auth.createUserWithEmailAndPassword(email: userData.email, password: password).then((FirebaseUser user){
      saveUserData(user, userData);
    });
  }

  saveUserData(FirebaseUser user, UserModel userData) async{
   await _firestore.collection('usuario').document(user.uid).setData(userData.toResumedMap());
  }

  Future<UserModel> getUserData(FirebaseUser user) async{
    UserModel userModel;
     _firestore.collection('usuario').document(user.uid).snapshots().listen((DocumentSnapshot document){
       userModel = new UserModel.fromDocument(document);
    });
     return userModel;
  }

  dynamic errorTreatment(dynamic error){
   String message;
  if( error.code == "auth/email-already-in-use" ){
    message = "O endereço de e-mail já está sendo usado por outra conta.";
  }else if(error.code == "auth/invalid-email"){
    message = "O endereço de e-mail está invalido";
  }else if (error.code == "ERROR_USER_NOT_FOUND"){
    message = "Usuário não encontrado ou não existente.";
  } else if(error.code == "auth/wrong-password"){
    message = "A senha é inválida ou o usuário é inválido.";
  }else if (error.code == "auth/user-not-found"){
    message = "Não há registro do usuário. O usuário pode ter sido excluído.";
  }else if (error.code == "auth/user-disabled"){
    message = "A conta do usuário foi desativada.";
  }else if (error.code == "auth/user-token-expired"){
    message = "A credencial do usuário não é mais válida. O usuário deve entrar novamente.";
  }else if (error.code == "auth/argument-error"){
    message = "reauthenticateWithPopup falhou: o primeiro argumento authProvider deve ser um provedor de Auth válido.";
  }
  return message;
  }

}