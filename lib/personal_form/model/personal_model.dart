// To parse this JSON data, do
//
//     final personalModel = personalModelFromMap(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

class PersonalModel extends Equatable {
  PersonalModel({
    this.name,
    this.sname,
    this.age,
    this.idCard,
    this.address,
    this.tel,
  });

  final String name;
  final String sname;
  final String age;
  final String idCard;
  final String address;
  final String tel;

  PersonalModel copyWith({
    String name,
    String sname,
    String age,
    String idCard,
    String address,
    String tel,
  }) =>
      PersonalModel(
        name: name ?? this.name,
        sname: sname ?? this.sname,
        age: age ?? this.age,
        idCard: idCard ?? this.idCard,
        address: address ?? this.address,
        tel: tel ?? this.tel,
      );

  factory PersonalModel.fromJson(String str) => PersonalModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PersonalModel.fromMap(Map<String, dynamic> json) => PersonalModel(
    name: json["name"] == null ? null : json["name"],
    sname: json["sname"] == null ? null : json["sname"],
    age: json["age"] == null ? null : json["age"],
    idCard: json["idCard"] == null ? null : json["idCard"],
    address: json["address"] == null ? null : json["address"],
    tel: json["tel"] == null ? null : json["tel"],
  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "sname": sname == null ? null : sname,
    "age": age == null ? null : age,
    "idCard": idCard == null ? null : idCard,
    "address": address == null ? null : address,
    "tel": tel == null ? null : tel,
  };

  @override
  // TODO: implement props
  List<Object> get props => [name, sname, age, idCard, age, address, tel];
}
