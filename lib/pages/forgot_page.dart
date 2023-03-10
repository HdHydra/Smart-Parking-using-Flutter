import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<ForgotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 60, left: 20, right: 20),
              child: Text(
                'A link to reset your password will be sent to this mail address',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 20,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your mail ID',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Reset Password', style: TextStyle(color: Colors.white, fontSize: 25)),
                ))
          ],
        ),
      ),
    );
  }
}
