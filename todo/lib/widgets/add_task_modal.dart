import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'New Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w900,
              fontSize:25,
            ),
          ),
          SizedBox(width: 10, height: 20.0,),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            cursorColor: Colors.redAccent,

          ),
          SizedBox(width: 10, height: 20.0,),
          TextButton(
            onPressed: (){},
            child: Text(
              'Add Task',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.redAccent,
            ),
          ),
       ],
      ),
    );
  }
}
