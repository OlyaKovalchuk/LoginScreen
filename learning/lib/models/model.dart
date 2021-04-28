import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User extends StatelessWidget {
  String name;
  String email;
  String phone;
  String description;
  String country;
  String sex;

  User(
      {Key key,
      @required this.name,
      this.email,
      this.phone,
      this.description,
      this.country,
      this.sex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Form Field',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        width: double.infinity,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(color: Colors.black, width: 0.5),
      ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [
              Icon(Icons.person),
              SizedBox(
                width: 15,
              ),
              Text("Name: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  softWrap: true),
              VerticalDivider(),
              Text(
                name,
              ),
            ]),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.mail),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Email: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  softWrap: true,
                ),
                VerticalDivider(),
                Container( width: 190,
                  height: 25,
                  child:
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                 Text(email),],),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Row(children: [
              Icon(Icons.phone),
              SizedBox(
                width: 15,
              ),
              Text("Phone: ", style: TextStyle(fontWeight: FontWeight.bold)),
              VerticalDivider(),
              Text(phone),
            ]),
            Container(child: _desc() == null ? Text('') : _description()),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.people),
                SizedBox(
                  width: 15,
                ),
                Text("Sex: ", style: TextStyle(fontWeight: FontWeight.bold)),
                VerticalDivider(),
                Text(sex),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _description() => Column(children: [
        SizedBox(height: 10),
        Divider(),
        SizedBox(height: 10),
        Row(
          children: [
            Icon(Icons.description),
            SizedBox(
              width: 15,
            ),
            Text("Description: ",
                style: TextStyle(fontWeight: FontWeight.bold), softWrap: true),
            VerticalDivider(),
            Expanded(
              child: Text(description),
            ),
          ],
        )
      ]);

  String _desc() {
    if (description != '') {
      return description;
    } else {
      return null;
    }
  }
}
