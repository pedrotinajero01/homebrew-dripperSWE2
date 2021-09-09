import 'package:flutter/material.dart';
import 'package:homebrew_dripper/screens/splash_screen.dart';

import 'recipe_selection_screen.dart';

class DoneScreen extends StatefulWidget {
  @override
  _DoneScreenState createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 320.0,
            ),
            Text("Enjoy your amazing \n handmade coffee",
                key: Key("donetext"),
                style: TextStyle(
                    letterSpacing: 2.5,
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    color: Color(0XB34C748B))),
            SizedBox(
              height: 220.0,
            ),
            FlatButton(
              key: Key("doneButton"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecipeSelectionScreen()));
              },
              child: Text("done",
                  style: TextStyle(
                      letterSpacing: 2.5,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      color: Color(0XB34C748B))),
            ),
            SizedBox(
              height: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}
