import 'package:flubase_app/pages/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flubase_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String loggedInUser;

class ChatScreen extends StatefulWidget {
  static const id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final txtController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String message;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    txtController.dispose();
    super.dispose();
  }

  void getCurrentUser() async{

    try{
      final user = await _auth.currentUser;
      if(user != null){
        loggedInUser = user.email;
        print(loggedInUser);
      }
    }
    catch(e){
      print(e);
    }
  }

  getMessage() async{
    await for (var snap in _firestore.collection('messages').snapshots()){
      for(var message in snap.docs){
        print(message.data());
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // getMessage();
                _auth.signOut();
                Navigator.popUntil( context, ModalRoute.withName(WelcomeScreen.id));
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextStream(firestore: _firestore),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: txtController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      txtController.clear();
                      _firestore.collection('messages').add({
                        'text': message,
                        'sender': loggedInUser,
                        'timestamp': FieldValue.serverTimestamp(),
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextStream extends StatelessWidget {
  const TextStream({
    Key key,
    @required FirebaseFirestore firestore,
  }) : _firestore = firestore, super(key: key);

  final FirebaseFirestore _firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').orderBy('timestamp').snapshots(),
      builder: (context, snapshot){

        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        List<TextBubbles> messageSet = [];
        final incomingData = snapshot.data.docs.reversed;
        for(var mssgDeets in incomingData){
          var messageDeet = mssgDeets.data()['text'];
          var messageSender = mssgDeets.data()['sender'];
          final mssgWidget = TextBubbles(
            messageDeet: messageDeet,
            messageSender: messageSender,
            myText: loggedInUser == messageSender,
          );
          messageSet.add(mssgWidget);
        }

        return Expanded(
          child: ListView(
            reverse: true,
            children: messageSet,
          ),
        );
      }
    );
  }
}

class TextBubbles extends StatelessWidget {

  TextBubbles({this.messageDeet, this.messageSender, this.myText});

  final String messageDeet;
  final String messageSender;
  final bool myText;


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: myText ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            '$messageSender',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
          Material(
            borderRadius: myText ? BorderRadius.only(topLeft: Radius.circular(30.0), bottomLeft: Radius.circular(30.0),         bottomRight: Radius.circular(30.0)): BorderRadius.only(topRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
            elevation: 6.0,
            color: myText ? Colors.lightBlueAccent : Colors.redAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                '$messageDeet',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );;
  }
}
