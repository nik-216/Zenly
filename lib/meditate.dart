import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/home.dart';


class Meditate extends StatefulWidget {
  const Meditate({super.key});

  @override
  State<Meditate> createState() => _MeditateState();
}

class _MeditateState extends State<Meditate>{
  int index = 2;
  int imgnumber=0;
  int time = 0;
  String msg ='';
  var imag;
  double sliderstarttime = 0;
  double starttime = 0;
  bool done = false;

  @override
  void initState(){
    super.initState();
    
  }

  void start(){
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        starttime--;
      });
      if (starttime == 0 )
      {
        timer.cancel();
        done = true;
      }
    });
  }
  void inc() async {
      while(imgnumber<5)
      {
        // print(imgnumber);
        await Future.delayed(const Duration(seconds: 5));
        setState(() {
          imgnumber++;
        });
      }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF265073),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Visibility(
            visible: done ?true:false,
            child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              iconSize: 40,
              icon: const Icon(
                Icons.home , color: Color(0xFFF1FADA),
              ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
            },
            ),
            ),
            ),
            const SizedBox(height: 60,),
            Center( child: 
            Slider(
              value: sliderstarttime,
              max: 100,
              divisions: 5,
              label: sliderstarttime.round().toString(),
              onChanged: (double value) {
                setState(() {
                  sliderstarttime = value;
                });
              },
            ),
            ),
          Align(
          alignment: Alignment.topCenter,
          child: ElevatedButton(
            onPressed: () {
              starttime = sliderstarttime;
              start();
              inc();
            },
            child: Text('Ok'),
          ),
        ),
        const SizedBox(height: 60,),
          const Align(
            alignment: Alignment.topCenter,
            child: Text("Meditate", style: TextStyle(color: Color(0xFFECF4D6),),),
            ),
          const Align(
            alignment: Alignment.topCenter,
            child : Text("And let your tree grow", style: TextStyle(color: Color(0xFFECF4D6),),
            ),
          ),
        Center(child: Image.asset('assets/images/tree'+imgnumber.toString()+'.png', height: 200,),),
        Center(child: Text("$starttime",style: TextStyle(color: Color(0xFFECF4D6)),),),
        ],
      ),
    );
  }
}