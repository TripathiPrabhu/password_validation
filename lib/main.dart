import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isVisible = false;
  bool isPasswordHas8Char = false;
  bool isPasswordHasADigit = false;
  bool iscontainsUppercase = false;
  bool iscontainsLowercase = false;
 // bool get containsUppercase => contains(RegExp(r'[A-Z]'));
  onPasswordChange(String password) {
    setState(() {

      final regEx = RegExp(r'[0-9]');
      final conatinsUppercase = RegExp(r'[A-Z]');
      final conatinsLowercase = RegExp(r'[a-z]');

      iscontainsLowercase = false;
      if(conatinsLowercase.hasMatch(password)) iscontainsLowercase =!iscontainsLowercase;

      iscontainsUppercase = false;
      if(conatinsUppercase.hasMatch(password)) iscontainsUppercase =!iscontainsUppercase;

      isPasswordHas8Char = false;
      if (password.length >= 8) isPasswordHas8Char = !isPasswordHas8Char;

      isPasswordHasADigit = false;
      if (regEx.hasMatch(password)) isPasswordHasADigit = !isPasswordHasADigit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 25, bottom: 50),
                child: Text('Set a Password'),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  onChanged: (password) => onPasswordChange(password),
                  obscureText: isVisible,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: isVisible
                            ? Icon(
                                Icons.visibility,
                                color: Colors.black,
                              )
                            : Icon(Icons.visibility_off, color: Colors.black),
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      ),
                      hintText: "Password",
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 3,
                          )),
                      focusedBorder: (OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 5, color: Colors.green)))),
                ),
              ),

              ///Minimum 8 Character required check ////////////////
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    AnimatedContainer(
                        height: 20,
                        width: 20,
                        duration: Duration(milliseconds: 500),
                        decoration: isPasswordHas8Char
                            ? BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.blue),
                                //color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                              )
                            : BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.grey),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                        child: isPasswordHas8Char
                            ? Icon(Icons.check, size: 15, color: Colors.blue)
                            : Icon(Icons.check,
                                size: 15, color: Colors.transparent)),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Minimum 8 Characters Required',style: isPasswordHas8Char?TextStyle(color: Colors.blue):null,)
                  ],
                ),
              ),
              ///Atleast a LowerCase required check ////////////////
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    AnimatedContainer(
                      height: 20,
                      width: 20,
                      duration: Duration(milliseconds: 500),
                      decoration: iscontainsLowercase
                          ? BoxDecoration(
                        border: Border.all(width: 2, color: Colors.blue),
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      )
                          : BoxDecoration(
                          border: Border.all(width: 2, color: Colors.grey),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: iscontainsLowercase
                          ? Icon(
                        Icons.check,
                        size: 15,
                        color: Colors.blue,
                      )
                          : Icon(
                        Icons.check,
                        size: 15,
                        color: Colors.transparent,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Atleast One Small Latter Required',style: iscontainsLowercase?TextStyle(color: Colors.blue):null,)
                  ],
                ),
              ),

              ///Atleast a number required check ////////////////
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    AnimatedContainer(
                      height: 20,
                      width: 20,
                      duration: Duration(milliseconds: 500),
                      decoration: isPasswordHasADigit
                          ? BoxDecoration(
                              border: Border.all(width: 2, color: Colors.blue),
                              //color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            )
                          : BoxDecoration(
                              border: Border.all(width: 2, color: Colors.grey),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                      child: isPasswordHasADigit
                          ? Icon(
                              Icons.check,
                              size: 15,
                              color: Colors.blue,
                            )
                          : Icon(
                              Icons.check,
                              size: 15,
                              color: Colors.transparent,
                            ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Atleast a Number Required',style: isPasswordHasADigit?TextStyle(color: Colors.blue):null,)
                  ],
                ),
              ),

              ///Atleast a UpperCase required check ////////////////
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    AnimatedContainer(
                      height: 20,
                      width: 20,
                      duration: Duration(milliseconds: 500),
                      decoration: iscontainsUppercase
                          ? BoxDecoration(
                        border: Border.all(width: 2, color: Colors.blue),
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      )
                          : BoxDecoration(
                          border: Border.all(width: 2, color: Colors.grey),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: iscontainsUppercase
                          ? Icon(
                        Icons.check,
                        size: 15,
                        color: Colors.blue,
                      )
                          : Icon(
                        Icons.check,
                        size: 15,
                        color: Colors.transparent,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Atleast One Capital Latter Required',style: iscontainsUppercase?TextStyle(color: Colors.blue):null,)
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
