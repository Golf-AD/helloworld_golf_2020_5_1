import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helloworld_golf/models/RMenuModel.dart';
import 'package:helloworld_golf/services/LoggerService.dart';
import 'package:helloworld_golf/services/ShowNotification.dart';

// ===============================================
// MAIN CLASS
// ===============================================
class GFlutterNew extends StatefulWidget {
  @override
  _GFlutterNewState createState() => _GFlutterNewState();
}

class _GFlutterNewState extends State<GFlutterNew> {
  // ===============================================
  // DECALRE VARIABLE
  // ===============================================
  // final _idController = TextEditingController()..text = 'C0001';
  // final _idController = TextEditingController()..text = 'C0002';
  final _idController = TextEditingController()..text = 'G0001';
  final _nameController = TextEditingController()..text = 'Flutter';
  final _descriptionController = TextEditingController()..text = 'Application and Firebase';
  final _imageUrlController = TextEditingController()..text = 'www.flutter.com';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CREATE FLUTTER APPLICATION DETAILS'), backgroundColor: Colors.redAccent),
      body: ListView(
        children: <Widget>[
          // ==================================================
          // UI: TEXT
          // ==================================================
          TextFormField(decoration: InputDecoration(labelText: 'Flutter ID', prefixIcon: Icon(Icons.insert_chart)),controller: _idController,),
          TextFormField(decoration: InputDecoration(labelText: 'Flutter Name', prefixIcon: Icon(Icons.insert_chart)),controller: _nameController,),
          TextFormField(decoration: InputDecoration(labelText: 'Flutter Description', prefixIcon: Icon(Icons.insert_chart)),controller: _descriptionController,),
          TextFormField(decoration: InputDecoration(labelText: 'Flutter URL', prefixIcon: Icon(Icons.insert_chart)),controller: _imageUrlController,),
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

    Firestore.instance.collection("Golf Flutter Menu").document(_idController.text).setData(myModel.toFileStone())   //SAVE DB
    .then((returnDocments){  // IF COMPLETE
      logger.i('Insert Complete');   //PRINT LOG
      showMessageBox(context, "Success", _idController.text + "saved completely", actions: [dismissButton(context)]);  //POPOUP COMPLETE

    }
    ).catchError((e){               // IF ERROR
        logger.e("Insert Error");   // PRINT LOG
    });

  }

}