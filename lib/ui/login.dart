import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pharmacy/blocs/login_bloc.dart';
import 'package:pharmacy/models/login_model.dart';
import 'package:pharmacy/utils/enums.dart';
import 'package:pharmacy/utils/keys.dart';
import 'package:pharmacy/utils/shared_pref_utils.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String guest_user_id ;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late Future<Login> result;
 // late Login _login_model;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  bool _focused = false;
  bool isLoading = true;

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _emailController.dispose();
    // The attachment will automatically be detached in dispose().
    _emailFocus.dispose();
    super.dispose();
  }

  Future<void> onSubmit() async {
    FocusScope.of(context).unfocus();
    String? stringdata = await loginBloc.fetchSigninRespose(
      context,
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
    if(stringdata != null && stringdata != '') {
      Login? signindata =Login.fromJson(json.decode(stringdata));
      SharedPrefUtils.getPref().then((SharedPreferences sp) async {
        if(sp != null) {
          if (signindata != null && signindata.data != null) {
            sp.setString(SharedPrefUtils.userData, stringdata);

            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => HomePage(title: 'Home')
            ));
          }
        }
      });
    }
  }


  @override Widget build(BuildContext context) {
    //_nodeAttachment.reparent6666();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                const SizedBox(height: 56),
              Text(
                "Email ID*",
                style: TextStyle(
                  color: Colors.blue,
                  letterSpacing: 1.2,
                ),
              ),
                TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  controller: _emailController,
                  focusNode: _emailFocus,
                  validator: (input) => EmailValidator.validate(input!) ? null : "Please enter valid email",
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  //decoration: InputDecoration(hintText: 'Email'),
                  onFieldSubmitted: (_) => _passwordFocus.requestFocus(),
                ),

                SizedBox(height: 16),
                Text(
                  "Password*",
                  style: TextStyle(
                    color: Colors.blue,
                    letterSpacing: 1.2,
                  ),
                ),

                TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  obscureText: true,
                  obscuringCharacter: "●",
                  decoration: const InputDecoration(
                    //   labelText: 'Password',
                  ),
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  validator: (input) => input != null ? null : "Please enter password",
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  //onFieldSubmitted: () => phoneFocus.requestFocus(),
                ),

                SizedBox(height: 32),
                StreamBuilder<bool>(
                  initialData: false,
                  stream: loginBloc.getWaitingStateStream,
                  builder: (context, snapshot) {
                    if (snapshot.requireData)
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      );

                    return MaterialButton(
                      color: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      minWidth: double.infinity,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color:  Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      onPressed: onSubmit,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
