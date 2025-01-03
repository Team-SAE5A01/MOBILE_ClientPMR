import 'package:flutter/material.dart';

class Main_Page extends StatelessWidget { 
    
  const Main_Page({super.key}); 
  
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: Text('Next Page'),), 
      body: Center( 
        child: Text('GeeksForGeeks'), 
      ), 
    ); 
  } 
}
