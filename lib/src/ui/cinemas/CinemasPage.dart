import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/lib/buildBottomNavigationBar.dart';

class CinemasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: Text("lol"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
//        bottomSheet: BottomSheet(
//          builder: (BuildContext context) {
//            return new Column(
//              mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//                new ListTile(
//                  leading: new Icon(Icons.music_note),
//                  title: new Text('Music'),
//                  onTap: () => {},
//                ),
//                new ListTile(
//                  leading: new Icon(Icons.photo_album),
//                  title: new Text('Photos'),
//                  onTap: () => {},
//                ),
//                new ListTile(
//                  leading: new Icon(Icons.videocam),
//                  title: new Text('Video'),
//                  onTap: () => {},
//                ),
//              ],
//            );
//          },
//          onClosing: () {},
//        ),
      drawer: Drawer(
        child: MaterialButton(
          child: Text('Coucou'),
          onPressed: () {},
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(context, 0),
    );
  }
}