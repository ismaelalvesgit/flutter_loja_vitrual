import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:loja_virtual/model/user_model.dart';

class UserBloc implements BlocBase{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  final StreamController<Future<UserModel>> _userController = StreamController<Future<UserModel>>();
  Stream<Future<UserModel>> get outIndicators => _userController.stream;


  void setUser(Future<UserModel> user){
    _userController.sink.add(user);
  }

  @override
  void dispose() {
    _userController.close();
  }

  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => null;

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
  }
}