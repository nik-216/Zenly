import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_application_2/home.dart';
import 'package:google_fonts/google_fonts.dart';

class MoodTrackerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color layer0Color = Color(0xFF265073);

    return Scaffold(
      backgroundColor: layer0Color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.home, color: Color(0xFFF1FADA)),
            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
            },
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50, // Adjust the height of the text widget as needed
            child: Center(
              child: Text(
                'Mood\nTracker',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Layer1(),
          ),
        ],
      ),
    );
  }
}

class Layer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 2000, // Adjust the height as needed
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF9AD0C2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'How did you feel today?',
                  style: TextStyle(color: Color(0xFF265073)),
                ),
              ),
              SizedBox(height: 10), // Add spacing between text and buttons
              ElevatedButton(
                onPressed: () {},
                child: Text('Great'),
              ),
              SizedBox(height: 10), // Add spacing between buttons
              ElevatedButton(
                onPressed: () {},
                child: Text('Good'),
              ),
              SizedBox(height: 10), // Add spacing between buttons
              ElevatedButton(
                onPressed: () {},
                child: Text('Ok'),
              ),
              SizedBox(height: 10), // Add spacing between buttons
              ElevatedButton(
                onPressed: () {},
                child: Text('Bad'),
              ),
              SizedBox(height: 10), // Add spacing between buttons
              ElevatedButton(
                onPressed: () {},
                child: Text('Awful'),
              ),
              Expanded(
                child: Layer2(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Layer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity, // Expand to fill remaining space
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF1FADA),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
            },
            child: Text('Done'),
          ),
        ),
      ),
    );
  }
}

