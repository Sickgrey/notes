import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes/models/app_user.dart';
import 'package:notes/resources/colors.dart';
import 'package:notes/resources/strings.dart';
import 'package:notes/services/auth.dart';

class AuthorizationPage extends StatefulWidget {
  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email;
  String _password;
  bool showLogin = true;

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [primaryAppDark, primaryAppColor, primaryAppLight])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: <Widget>[
                _logo(),
                (showLogin
                    ? _buildForm(
                        loginButton, textForLogin, _loginButtonAction, false)
                    : _buildForm(registerButton, textForRegister,
                        _registerButtonAction, true)),
              ],
            )));
  }

  Widget _logo() {
    return Padding(
      padding: EdgeInsets.only(top: 100, bottom: 40),
      child: Container(
        child: Image.asset(
          'lib/resources/images/book.png',
          height: 160,
          width: 160,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildForm(String label, String text, void func(), bool isShowLogin) {
    return Column(
      children: [
        _form(label, func),
        Padding(
          padding: EdgeInsets.all(20),
          child: GestureDetector(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                color: primaryAppDark,
              ),
            ),
            onTap: () {
              setState(() {
                showLogin = isShowLogin;
              });
            },
          ),
        )
      ],
    );
  }

  Widget _form(String label, void func()) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20, top: 10),
            child: _input(
                Icon(Icons.email), inputEmailHint, _emailController, false),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: _input(
                Icon(Icons.lock), inputPasswordHint, _passwordController, true),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func)),
          ),
        ],
      ),
    );
  }

  Widget _input(
      Icon icon, String hint, TextEditingController controller, bool obscure) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
          controller: controller,
          obscureText: obscure,
          style: TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 20, color: Colors.black87),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryAppDark, width: 3),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: IconTheme(
                data: IconThemeData(color: Colors.black),
                child: icon,
              ),
            ),
          )),
    );
  }

  Widget _button(String text, void func()) {
    return RaisedButton(
        splashColor: Theme.of(context).primaryColor,
        color: primaryAppDark,
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryAppLight,
              fontSize: 20),
        ),
        onPressed: func);
  }

  void _loginButtonAction() async {
    _email = _emailController.text;
    _password = _passwordController.text;

    if (_email.isEmpty || _password.isEmpty) return;

    AppUser user = await _authService.signInWithEmailAndPassword(
        _email.trim(), _password.trim());
    if (user == null) {
      Fluttertoast.showToast(
          msg: toastMessageError,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      _emailController.clear();
      _passwordController.clear();
    }
  }

  void _registerButtonAction() async {
    _email = _emailController.text;
    _password = _passwordController.text;

    if (_email.isEmpty || _password.isEmpty) return;

    AppUser user = await _authService.registerWithEmailAndPassword(
        _email.trim(), _password.trim());
    if (user == null) {
      Fluttertoast.showToast(
          msg: "Can't SignIn you! Please check your email/password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      _emailController.clear();
      _passwordController.clear();
    }
  }
}
