import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_application_2/home.dart';
import 'package:google_fonts/google_fonts.dart';

class JournalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF265073),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.home, color: Color(0xFFF1FADA)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
            },
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 45,
            child: Center(
              child: Text(
                "Journal",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFFF1FADA), fontSize: 30),
              ),
            ),
          ),
          SizedBox(height: 100,),
          Layer1(),
          Layer2(),
        ],
      ),
    );
  }
}

class Layer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF2D9596), // Background color of the first container
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: const Padding(
        padding: EdgeInsets.all(20.0), // Add padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter your journal entry:',
              style: TextStyle(color: Colors.white, fontSize: 23), textAlign: TextAlign.start,
            ),
            SizedBox(height: 20,), // Add vertical spacing
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFFFFFFF),
                hintStyle: TextStyle(color: Color(0xFF000000)),
                border: OutlineInputBorder(),
                hintText: 'Enter your journal entry',
              ),
              keyboardType: TextInputType.multiline,
              minLines: 13,
              maxLines:15,
            ),
            SizedBox(height: 45,),
          ],
        ),
      ),
    );
  }
}

class Layer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF1FADA), // Background color of the second container
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all( 50), // Add horizontal padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align( alignment: Alignment.bottomCenter,
                  child : ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF265073)),
                  child: const Text('Submit', style: TextStyle(color: Color(0xFFF1FADA), fontSize: 18),),
                ),),
                // const SizedBox(height: 25,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}