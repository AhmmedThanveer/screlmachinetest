// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/userlist.dart';
import '../viewmodel/provider.dart';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  Welcome({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address.toJson(),
        "phone": phone,
        "website": website,
        "company": company.toJson(),
      };
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toJson(),
      };
}

class Geo {
  String lat;
  String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}

class UserListScreen extends StatelessWidget {
  List<Welcome> users = [
    Welcome(
      id: 1,
      name: "Leanne Graha",
      username: "Bret",
      email: "Sincere@april.biz",
      address: Address(
        street: "Kulas Light",
        suite: "Apt. 556",
        city: "Gwenborough",
        zipcode: "92998-3874",
        geo: Geo(lat: "-37.3159", lng: "81.1496"),
      ),
      phone: "1-770-736-8031 x56442",
      website: "hildegard.org",
      company: Company(
        name: "Romaguera-Crona",
        catchPhrase: "Multi-layered client-server neural-net",
        bs: "harness real-time e-markets",
      ),
    ),
    Welcome(
      id: 2,
      name: "Ervin Howell",
      username: "Antonette",
      email: "Shanna@melissa.tv",
      address: Address(
        street: "Victor Plains",
        suite: "Suite 879",
        city: "Wisokyburgh",
        zipcode: "90566-7771",
        geo: Geo(lat: "-43.9509", lng: "-34.4618"),
      ),
      phone: "010-692-6593 x09125",
      website: "anastasia.net",
      company: Company(
        name: "Deckow-Crist",
        catchPhrase: "Proactive didactic contingency",
        bs: "synergize scalable supply-chains",
      ),
    ),
    Welcome(
      id: 3,
      name: "Clementine Bauch",
      username: "Samantha",
      email: "Nathan@yesenia.net",
      address: Address(
        street: "Douglas Extension",
        suite: "Suite 847",
        city: "McKenziehaven",
        zipcode: "59590-4157",
        geo: Geo(lat: "-68.6102", lng: "-47.0653"),
      ),
      phone: "1-463-123-4447",
      website: "ramiro.info",
      company: Company(
        name: "Romaguera-Jacobson",
        catchPhrase: "Face to face bifurcated interface",
        bs: "e-enable strategic applications",
      ),
    ),
    Welcome(
      id: 4,
      name: "Patricia Lebsack",
      username: "Karianne",
      email: "Julianne.OConner@kory.org",
      address: Address(
        street: "Hoeger Mall",
        suite: "Apt. 692",
        city: "South Elvis",
        zipcode: "53919-4257",
        geo: Geo(lat: "29.4572", lng: "-164.2990"),
      ),
      phone: "493-170-9623 x156",
      website: "kale.biz",
      company: Company(
        name: "Robel-Corkery",
        catchPhrase: "Multi-tiered zero tolerance productivity",
        bs: "transition cutting-edge web services",
      ),
    ),
    Welcome(
      id: 5,
      name: "Chelsey Dietrich",
      username: "Kamren",
      email: "Lucio_Hettinger@annie.ca",
      address: Address(
        street: "Skiles Walks",
        suite: "Suite 351",
        city: "Roscoeview",
        zipcode: "33263",
        geo: Geo(lat: "-31.8129", lng: "62.5342"),
      ),
      phone: "(254)954-1289",
      website: "demarco.info",
      company: Company(
        name: "Keebler LLC",
        catchPhrase: "User-centric fault-tolerant solution",
        bs: "revolutionize end-to-end systems",
      ),
    ),
    Welcome(
      id: 6,
      name: "Mrs. Dennis Schulist",
      username: "Leopoldo_Corkery",
      email: "Karley_Dach@jasper.info",
      address: Address(
        street: "Norberto Crossing",
        suite: "Apt. 950",
        city: "South Christy",
        zipcode: "23505-1337",
        geo: Geo(lat: "-71.4197", lng: "71.7478"),
      ),
      phone: "1-477-935-8478 x6430",
      website: "ola.org",
      company: Company(
        name: "Considine-Lockman",
        catchPhrase: "Synchronised bottom-line interface",
        bs: "e-enable innovative applications",
      ),
    ),
    Welcome(
      id: 7,
      name: "Kurtis Weissnat",
      username: "Elwyn.Skiles",
      email: "Telly.Hoeger@billy.biz",
      address: Address(
        street: "Rex Trail",
        suite: "Suite 280",
        city: "Howemouth",
        zipcode: "58804-1099",
        geo: Geo(lat: "24.8918", lng: "21.8984"),
      ),
      phone: "210.067.6132",
      website: "elvis.io",
      company: Company(
        name: "Johns Group",
        catchPhrase: "Configurable multimedia task-force",
        bs: "generate enterprise e-tailers",
      ),
    ),
    Welcome(
      id: 8,
      name: "Nicholas Runolfsdottir V",
      username: "Maxime_Nienet",
      email: "Sherwood@rosamond.me",
      address: Address(
        street: "Ellsworth Summit",
        suite: "Suite 729",
        city: "Aliyaview",
        zipcode: "45169",
        geo: Geo(lat: "-14.3990", lng: "-120.7677"),
      ),
      phone: "586.493.6943 x140",
      website: "jacynthe.com",
      company: Company(
        name: "Abernathy Group",
        catchPhrase: "Implemented secondary concept",
        bs: "e-enable extensible e-tailers",
      ),
    ),
    Welcome(
      id: 9,
      name: "Glenna Reichert",
      username: "Delphine",
      email: "Chaim_McDermott@dana.io",
      address: Address(
        street: "Dayna Park",
        suite: "Suite 449",
        city: "Bartholomebury",
        zipcode: "76495-3109",
        geo: Geo(lat: "24.6463", lng: "-168.8889"),
      ),
      phone: "(775)976-6794 x41206",
      website: "conrad.com",
      company: Company(
        name: "Yost and Sons",
        catchPhrase: "Switchable contextually-based project",
        bs: "aggregate real-time technologies",
      ),
    ),
    Welcome(
      id: 10,
      name: "Clementina DuBuque",
      username: "Moriah.Stanton",
      email: "Rey.Padberg@karina.biz",
      address: Address(
        street: "Kattie Turnpike",
        suite: "Suite 198",
        city: "Lebsackbury",
        zipcode: "31428-2261",
        geo: Geo(lat: "-38.2386", lng: "57.2232"),
      ),
      phone: "024-648-3804",
      website: "ambrose.net",
      company: Company(
        name: "Hoeger LLC",
        catchPhrase: "Centralized empowering task-force",
        bs: "target end-to-end models",
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Users = Provider.of<PostProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(' all Users List'),
      ),
      body: UserList(users),
    );
  }
}
