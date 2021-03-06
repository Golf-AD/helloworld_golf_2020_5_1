import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helloworld_golf/models/RMenuModel.dart';
import 'package:helloworld_golf/services/LoggerService.dart';
import 'package:helloworld_golf/services/ShowNotification.dart';

// ===============================================
// MAIN CLASS
// ===============================================
class RMenuNew extends StatefulWidget {
  @override
  _RMenuNewState createState() => _RMenuNewState();
}

class _RMenuNewState extends State<RMenuNew> {
  // ===============================================
  // DECALRE VARIABLE
  // ===============================================
  // final _idController = TextEditingController()..text = 'C0001';
  // final _idController = TextEditingController()..text = 'C0002';
  final _idController = TextEditingController()..text = 'M0001';
  final _nameController = TextEditingController()..text = 'Fried rice';
  final _descriptionController = TextEditingController()..text = 'Drinks and others';
  final _imageUrlController = TextEditingController()..text = 'www.image.com';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CREATE MENU CATEGORY'),),
      body: ListView(
        children: <Widget>[
          // ==================================================
          // UI: TEXT
          // ==================================================
          TextFormField(decoration: InputDecoration(labelText: 'Menu ID', prefixIcon: Icon(Icons.insert_chart)),controller: _idController,),
          TextFormField(decoration: InputDecoration(labelText: 'Menu Name', prefixIcon: Icon(Icons.insert_chart)),controller: _nameController,),
          TextFormField(decoration: InputDecoration(labelText: 'Menu Description', prefixIcon: Icon(Icons.insert_chart)),controller: _descriptionController,),
          TextFormField(decoration: InputDecoration(labelText: 'Menu Image URL', prefixIcon: Icon(Icons.insert_chart)),controller: _imageUrlController,),
          // =================================================
          // UI: SAVE BUTTON
          // =================================================
          RaisedButton(onPressed: (){fnSave();}, child: Text('SAVE'),)
        ],
      ),
      
    );
  }
  // =================================================
  // SAVE (COLLECTION=TABLE, DOCUMENT=PRIMARY KEY)
  // =================================================
  fnSave() {
  // =================================================
  // PREPARE DATA
  // =================================================
    RMenuModel myModel = RMenuModel(
      id: _idController.text, 
      name: _nameController.text, 
      description: _descriptionController.text, 
      imageUrl: _imageUrlController.text
      );
  // =================================================
  // SHOW LOG
  // =================================================
    logger.i(myModel.toFileStone());
  // =================================================
  // SAVE DATA TO FIRESTONE
  // =================================================  

    Firestore.instance.collection("TM_REST_MENU").document(_idController.text).setData(myModel.toFileStone())   //SAVE DB
    .then((returnDocments){  // IF COMPLETE
      logger.i('Insert Complete');   //PRINT LOG
      showMessageBox(context, "Success", _idController.text + "saved completely", actions: [dismissButton(context)]);  //POPOUP COMPLETE

    }
    ).catchError((e){               // IF ERROR
        logger.e("Insert Error");   // PRINT LOG
    });

  }

}