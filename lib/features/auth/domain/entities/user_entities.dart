// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntities extends Equatable {
  String? id;
  String? username;
  String? email;
  String? password;
  UserEntities({this.id, this.username, this.email, this.password});

  @override
  List<Object?> get props => [id, username, email, password];


}
