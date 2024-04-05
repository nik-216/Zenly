import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/home.dart';
import 'package:google_fonts/google_fonts.dart';

class Game extends StatefulWidget{
  const Game ({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game>{

  final rows = 3;
  final colns = 3;
  final molecount = 20;
  List<bool> moles = []; 
  int score = 0;
  bool clicked = false;
  int clicks = 0;
  int index = 0;
  var time;
  String msg = "";
  bool restart = false;

  @override
  void initState(){
    super.initState();
    start();
  }
  int getRandomInteger() {
    final random = Random();
    return random.nextInt(rows*colns);
  }


  void start(){
    moles = List.filled(rows*colns, false);
    time = Timer.periodic(const Duration(seconds: 1), (timer) { 
      if (mounted)
      {
        if (restart){
          score = 0;
          clicks = 0;
          restart = false;
        }
        if (clicked){
          setState(() {
              moles[index] = false;
            });
        }
        // score++;
        index = getRandomInteger();
        moles[index] = !moles[index];
        clicks++;
        

        if (moles[index])
        {
          if (mounted) {
            clicked = true;
          }
        }
      }
    }
    );
  }

  void onTapBurrow(int ind){
    if (moles[ind]){
      setState(() {
        moles[ind] = false;
        score++;

        if (clicks == molecount )
        {
          time.cancel();
          msg = "Game Over!";
        }
      });
    }
  }

  
  List<Widget> buildburrows (){
    List<Widget> burrows = [];
    for (int x = 0; x < rows*colns; x++)
    {
      burrows.add(
        GestureDetector(
          onTap: () => onTapBurrow(x),
          child: Container(
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/soil.png'))),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: (moles[x] ? Image.asset('assets/images/mole.png',height: 80,): null),
            ),
          ),
          ),
          ));
    }
    return burrows;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            iconSize: 40,
            icon: const Icon(
              Icons.home, color: Color(0xFFF1FADA),
            ),
            // the method which is called
            // when button is pressed
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
            },
            ),
            ),
          const SizedBox(height: 60,),
          
          Container(
            padding: const EdgeInsets.only(bottom: 40),
            child: Text("Score - $score / 20",),
            ),
          GridView.count(
            crossAxisCount: colns,
            shrinkWrap: true,
            children: buildburrows(),
          ),
          Text(msg,),
          IconButton(
            icon : const Icon(Icons.replay),
            onPressed: () {
              setState(() {
                restart = true;
                time.cancel();
                msg='';
                start();
              });
            },)
            ],
      ),
    );
  }
}