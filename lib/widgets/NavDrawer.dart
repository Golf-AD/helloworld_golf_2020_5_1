import 'package:flutter/material.dart';
import 'package:helloworld_golf/screens/LayoutPage.dart';
import 'package:helloworld_golf/screens/MenuPage.dart';
import 'package:helloworld_golf/screens/SearchPage.dart';
import 'package:helloworld_golf/screens/SignupPage.dart';
import 'package:helloworld_golf/screens/StackPage.dart';
 
import '../main.dart';
 
class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}
 
class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
          //===================================================
          // 1) RETURN DRAWER WIDGET
          //===================================================     
    return Drawer(
          //===================================================
          // 2) DATA IN DRAWER IS CHILD: LISTVIEW()
          //===================================================       
      child: ListView(
        padding: EdgeInsets.zero,
        children:<Widget> [
          //===================================================
          // 3) FILL HEADER NAME
          //===================================================           
          DrawerHeader(
            child:Text("Main Menu"),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/bg03.jpg')
              )
            ),
          ),
          //===================================================
          // 4) ADD LIST OF MENU
          //===================================================           
          ListTile(leading: Icon(Icons.language), title: Text('Main Menu'),onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPage()),)},),   
          ListTile(leading: Icon(Icons.border_color), title: Text('Layout'),onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => LayoutPage()),)},),   
          ListTile(leading: Icon(Icons.settings), title: Text('Stack'),onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => StackPage()),)},),  
          ListTile(leading: Icon(Icons.find_replace), title: Text('Search'),onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()),)},), 
          ListTile(leading: Icon(Icons.supervisor_account), title: Text('Signup'),onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()),)},), 
          ListTile(leading: Icon(Icons.exit_to_app), title: Text('Logout'),onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),)},),   
        ],
 
      ),
    ); // DRAWER
  } // WIDGET
} // CLASS