import 'package:cloud_firestore/cloud_firestore.dart';

//===============================================================
// CLASS DOC MODEL
//===============================================================
class RMenuModel {
  //=============================================================
  // 1) PROPERTY
  //=============================================================
  final String id;
  final String name;
  final String description;
  final String imageUrl;
 
  //=============================================================
  // 2) CONSTUCTURE
  //=============================================================
  RMenuModel({
    this.id,
    this.name,
    this.description,
    this.imageUrl
 
  });
 
  //=============================================================
  // 2) MAP MODEL -> SNAPSHOT
  //=============================================================
  Map<String, dynamic> toFileStone() => {
        'id': id,
        'name': name,
        'description': description,
        'imageUrl': imageUrl,
      };
  
}