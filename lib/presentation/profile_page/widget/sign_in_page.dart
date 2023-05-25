// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:polban_news/core/app_export.dart';
import 'package:polban_news/data/apiClient/api_client.dart';
// import 'package:polban_news/presentation/homepage_page/homepage_page.dart';
import 'package:polban_news/presentation/profile_page/widget/sign_up_page.dart';
import 'package:polban_news/presentation/profile_page/profile_page_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signIn() async {
    final url = Uri.parse('https://polbannews.site/api/login');
    final response = await http.post(
      url,
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      // Jika request berhasil, tambahkan logika penanganan sesuai kebutuhan Anda
      print('Sign In successful');
      // Jika request berhasil, simpan sesi dengan shared preferences
      final token = json.decode(response.body)['data']
          ['access_token']; // Ubah sesuai dengan respons API Anda
      final user = json.decode(response.body)['data'];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(response.body);

      await prefs.setString('user', json.encode(user));
      print(prefs.get('user'));

      await prefs.setString('token', token);
      ApiClient().setToken();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfilePageScreen()),
      );

      // Berikan notifikasi snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Sign In successful',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 48, 46, 46),
            ),
          ),
          backgroundColor: Colors.blue[50],
        ),
      );
    } else {
      // Jika request gagal, tambahkan logika penanganan sesuai kebutuhan Anda
      print('Sign In failed');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Sign In Failed',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 48, 46, 46),
            ),
          ),
          backgroundColor: Colors.blue[50],
        ),
      );
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sign In',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 48, 46, 46),
                )),
            SizedBox(
              height: 2,
            ),
            Text('Sign In to Continue',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 255, 255, 255),
                )),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email Address',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 255, 255, 255),
                )),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: ColorConstant.whiteA700,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/icon_email.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: emailController,
                        style: AppStyle.txtPoppinsMedium12,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Email Address',
                          hintStyle: AppStyle.txtPoppinsMedium12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Password',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 255, 255, 255),
                )),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: ColorConstant.whiteA700,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/icon_password.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: passwordController,
                        style: AppStyle.txtPoppinsMedium12,
                        obscureText: true,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: AppStyle.txtPoppinsMedium12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: signIn, // Ubah disini
          style: TextButton.styleFrom(
            backgroundColor: ColorConstant.whiteA700,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Sign In',
            style: AppStyle.txtPoppinsMedium12,
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(top: 30, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account? ',
              style: AppStyle.txtInterSemiBold10Indigo900bf,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              child: Text('Sign Up',
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: ColorConstant.blue700,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              emailInput(),
              passwordInput(),
              signInButton(),
              Spacer(),
              footer()
            ],
          ),
        ),
      ),
    );
  }
}
