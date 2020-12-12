import 'dart:io';

import 'package:band_names/models/band_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands= [
    Band(id: '1',name: 'metallica',votes: 5),
    Band(id: '2',name: 'dragonforce',votes: 5),
    Band(id: '3',name: 'powerwolf',votes: 5),
    Band(id: '4',name: 'pain',votes: 5),


  ]; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BandNames',style: TextStyle(color: Colors.black87),),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body:ListView.builder(
        itemCount: bands.length,
        itemBuilder: (BuildContext context, int index) {  
          return buildListTile(bands[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:addNewBand,
        child: Icon(Icons.add),
        elevation: 1,
      ),
    );
  }

  Widget buildListTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){
        
      },
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Align(alignment: Alignment.centerLeft,child: Text("Delete Ban",style: TextStyle(color: Colors.white),)),
      ),
      child: ListTile(
            leading: CircleAvatar(
              child: Text(band.name.substring(0,2)),
              backgroundColor: Colors.blue[100],
            ),
            title: Text(band.name),
            trailing: Text('${band.votes}',style: TextStyle(fontSize: 20),),
            onTap: (){},
          ),
    );
  }
  addNewBand(){
    final textController= new TextEditingController();
    if(Platform.isAndroid){
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("New Band name"),
          content: TextField(controller: textController,),
          actions: [
            MaterialButton(
              child: Text("Add"),
              elevation: 5,
              textColor: Colors.blue,
              onPressed: ()=>addBanToList(textController.text)
            )  
          ],
        ),
      );
    }
    showCupertinoDialog(
      context: context, 
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("New ban name"),
          content: CupertinoTextField(
            controller: textController,
          ),
          actions: [
            CupertinoDialogAction(child: Text('Add'),isDefaultAction: true, onPressed: ()=>addBanToList(textController.text)),
            CupertinoDialogAction(child: Text('Dismiss'),isDestructiveAction: true, onPressed: ()=>Navigator.pop(context))
          ],
        );
      },
    );  
  }
  void addBanToList(String name){
    if(name.length>1){
      this.bands.add(new Band(id: DateTime.now().toString(),name: name,votes: 5));
      setState(() {
        
      });
    }
    Navigator.pop(context);
  }
}
