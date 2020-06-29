import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

InkWell(
onTap: () {
setState(() {
if (personCounter > 1) {
personCounter--;
} else {}
});
},
child: Container(
width: 40,
height: 40,
margin: EdgeInsets.all(10),
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(7),
color: Colors.blueGrey.withOpacity(.4),
),
child: Text(
'-',
),
),
),