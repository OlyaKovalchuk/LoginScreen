import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'models/model.dart';

enum GenderList { male, female, selc}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User user;
  bool _invisibility = true;
  final _key = GlobalKey<FormState>();
  String country;
  TextEditingController _controllerConPass = TextEditingController();
  TextEditingController _controllerPass = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  GenderList _gender = GenderList.selc;

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
      body: ListView(
        padding: EdgeInsets.all(25),
        children: [
          Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your Name',
                    icon: Icon(Icons.person),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _controllerName.clear();
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                  validator: _validName,
                  controller: _controllerName,
                  onSaved: (val) => user.name = val,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    icon: Icon(Icons.mail),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _controllerEmail.clear();
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                  controller: _controllerEmail,
                  validator: _validEmail,
                  onSaved: (val) => user.email = val,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    icon: Icon(Icons.phone),
                    hintText: 'Enter your phone number',
                    suffixIcon: IconButton(
                      onPressed: () {
                        _controllerPhone.clear();
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                  controller: _controllerPhone,
                  keyboardType: TextInputType.phone,
                  validator: _validPhone,
                  onSaved: (val) => user.phone = val,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'About you',
                    hintText: 'Enter info about you',
                    icon: Icon(Icons.description),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _controllerDescription.clear();
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                  controller: _controllerDescription,
                  maxLines: 2,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                  ],
                  onSaved: (val) => user.description = val,
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                  icon: Icon(Icons.arrow_drop_down),
                  decoration: InputDecoration(
                      icon: Icon(Icons.location_city),
                      labelText: 'Select country'),
                  validator: (value) =>
                      value == null ? 'Select one of country' : null,
                  items: <String>['Ukraine', 'USA', 'UK', 'Moldova']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      country = newValue;
                    });
                  },
                  //onSaved: (val) => user.country = val,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Password',
                    hintText: 'Create password',
                    icon: Icon(Icons.admin_panel_settings),
                    suffixIcon: IconButton(
                      icon: Icon(_invisibility
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _invisibility = !_invisibility;
                        });
                      },
                    ),
                  ),
                  validator: _validPassword,
                  controller: _controllerPass,
                  obscureText: _invisibility,
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Confirm password',
                    hintText: 'Enter your password',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    icon: Icon(Icons.add_moderator),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _controllerConPass.clear();
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                  controller: _controllerConPass,
                  validator: _validConPass,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.people, color:  Colors.grey,),
                    SizedBox(width: 15,),
                    Text(
                      'Sex:',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                RadioListTile(
                  title: Text('Male'),
                  value: GenderList.male,
                  groupValue: _gender,
                  onChanged: (GenderList value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Female'),
                  value: GenderList.female,
                  groupValue: _gender,
                  onChanged: (GenderList value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
        onPressed: _submitForm,
        backgroundColor: Colors.indigo,
      ),
    );
  }

  void _submitForm() {
    if (_key.currentState.validate()) {
      _gender == GenderList.selc
          ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Choose your sex'),
              backgroundColor: Colors.red,
            ))
          : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Form is valid'),
              backgroundColor: Colors.green,
            ));
      String name2 = _controllerName.text;

      Route route = MaterialPageRoute(
          builder: (context) => User(
              name: name2,
              email: _controllerEmail.text,
              phone: _controllerPhone.text,
              description: _controllerDescription.text,
              country: country,
              sex: _genderSel()));
      Navigator.push(context, route);
    }
  }

  String _validName(String value) {
    final _nameExp = RegExp(r'^[A-Za-z]+$');
    if (value.isEmpty) {
      return 'Name is required';
    } else if (!_nameExp.hasMatch(value)) {
      return 'Please enter alphabetical characters';
    } else {
      return null;
    }
  }

  String _validEmail(String val) {
    final _emailExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[gmailukrkneu]+.[comuaru]*$");
    if (val.isEmpty) {
      return 'Email is required';
    } else if (!_emailExp.hasMatch(val)) {
      return 'Please enter your email correctly';
    } else {
      return null;
    }
  }

  String _validPhone(String val) {
    final _phoneExp = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
    if (val.isEmpty) {
      return 'Phone is required';
    } else if (!_phoneExp.hasMatch(val)) {
      return 'Please enter your phone number as an example ';
    } else if (val.length < 10) {
      return 'Please enter your phone number as an example';
    } else {
      return null;
    }
  }

  String _validPassword(String val) {
    final passExp = RegExp(r'^[a-zA-Z0-9]*$');
    if (val.isEmpty) {
      return 'Password is required';
    } else if (val.length < 8) {
      return 'Minimum 8 symbols';
    } else if (passExp.hasMatch(val)) {
      return 'Password is contains by "a-z, A-Z, 0-9, ._"';
    } else {
      return null;
    }
  }

  String _validConPass(String val) {
    if (val != _controllerPass.text) {
      return "Password and Confirm password don't match";
    } else {
      return null;
    }
  }

  String _genderSel() {
    if (_gender.index == 0) {
      return 'Male';
    }
    else if(_gender.index == 1){
      return 'Female';
    }
    else{
      return 'Unselected sex';
    }
  }
}
