// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/game.dart';
import 'package:flutter_application_2/moodTracker.dart';
import 'package:flutter_application_2/journal.dart';
import 'package:flutter_application_2/meditate.dart';
// import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';


class HomePage extends StatefulWidget{
  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    Color bgColor = Color(0xFF265073);
    Color layer1Color = Color(0xFFECF4D6);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu, color: Color(0xFFF1FADA)),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.phone, color: Color(0xFFF1FADA)),
                  onPressed: () {
                    // Implement phone button action here
                  },
                ),
              ],
              toolbarHeight: 29,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 130,
                  child: Center(
                    child: Text(
                      "Hi\nWelcome back\n<user>😊",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: layer1Color, fontSize: 22, letterSpacing: 2),
                    ),
                  ),
                ),
                Layer1(),
                Layer2(),
              ],
            ),
            drawer: Drawer(
        child: Container(
          color: Color(0xFF265073), // Set the background color here
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF2D9596),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      // Your profile picture here
                    ),
                    Text(
                      '<Username>',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50, // Add some space between header and buttons
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement action for Button 1
                },
                child: Text('Report'),
                style: ElevatedButton.styleFrom(fixedSize: const Size(60,50)),
              ),
              SizedBox(
                height: 25, // space between buttons
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement action for Button 2
                },
                child: Text('Edit Profile'),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(65, 50)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Layer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 375, // Adjust the height as needed
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF9AD0C2),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Text widgets
            Text('Feeling overwhelmed?', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF265073),fontSize: 22, letterSpacing: 2),),
            Text('Take a QUIZ to clear out your head', textAlign: TextAlign.center,),
            // Buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder : (context) => MoodTrackerPage())
                );
              }, 
              child: Text('MOOD', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFF1FADA), fontSize: 20)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2D9596), // Button color for the first row
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(builder : (context) => Game())
                );
                  }, 
                  child: Text('  Games  ', textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF000000))),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7FA9A9), // Button color for the second row
                  ),
                ),
                ElevatedButton(
                  onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder : (context) => Meditate())
                );}, 
                  child: Text('Meditation', textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF000000))),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7FA9A9), // Button color for the second row
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => JournalPage()),);
                  }, 
                  child: Text(' Journal ', textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF000000))),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7FA9A9), // Button color for the third row
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Layer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final player = AudioPlayer();
    player.play(AssetSource('audio/seaside.mp3'));
    
    return Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFFF1FADA),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Music', textAlign: TextAlign.center, style: TextStyle( color: Color(0xFF2D9596), fontSize: 22, letterSpacing: 2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    player.play(AssetSource('audio/seaside.mp3'));
                  }, 
                  child: Text('Seaside ', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1D6365), // Button color for the first row
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    player.play(AssetSource('audio/cafe.mp3'));
                  }, 
                  child: Text('  Cafe  ', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1D6365), // Button color for the first row
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    player.play(AssetSource('audio/city.mp3'));
                  }, 
                  child: Text('  City  ', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1D6365), // Button color for the second row
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    player.play(AssetSource('audio/rain.mp3'));
                  }, 
                  child: Text('  Rain  ', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1D6365), // Button color for the second row
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
