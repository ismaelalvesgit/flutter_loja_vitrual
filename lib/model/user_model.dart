import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/model/generic_model.dart';

class UserModel extends GenericModel{

  String uid;
  String nome;
  String email;
  String fotoPerfil;
  DateTime dataNascimento;


  UserModel.fromDocument(DocumentSnapshot snapshot){
    uid = snapshot.documentID;
    nome = snapshot.data["nome"];
    email = snapshot.data["email"];
    fotoPerfil = snapshot.data["fotoPerfil"];
    dataNascimento = snapshot.data["dataNascimento"];
    dataCadastro = snapshot.data["dataCadastro"];
    dataAtualizacao = snapshot.data["dataAtualizacao"];
    estaAtivo = snapshot.data["estaAtivo"];
  }

  Map<String, dynamic> toResumedMap(){
    return {
      "uid": uid,
      "nome": nome,
      "email": email,
      "fotoPerfil": fotoPerfil,
      "dataNascimento": dataNascimento,
      "dataCadastro": dataCadastro,
      "dataAtualizacao": dataAtualizacao,
      "estaAtivo": estaAtivo,
    };
  }

}