import 'package:flutter/material.dart';
import 'package:polban_news/presentation/profile_page/model/profile_model.dart';
import 'package:polban_news/widgets/app_bar/custom_app_bar.dart';
import 'package:polban_news/core/app_export.dart';
import '../profile_page/widget/sign_up_page.dart';
import '../profile_page/widget/sign_in_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../profile_page/controller/login_controller.dart';

class ProfilePageScreen extends StatefulWidget {
  @override
  _ProfilePageScreenState createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  final controller = Get.put(TokenController());
  User user = User();
  bool isLoading = true;
  bool hasToken = false;
  String temp = "";

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  Future<void> checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      setState(() {
        hasToken = true;
        // temp = token;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Size size = MediaQuery.of(context).size;

    if (isLoading) {
      // Tampilkan loading spinner atau halaman loading sesuai kebutuhan
      return CircularProgressIndicator();
    } else {
      if (hasToken) {
        // Jika token sudah terisi, tampilkan halaman Profile
        return profile();
      } else {
        // Jika token belum terisi, tampilkan halaman Sign In
        return SignInPage();
      }
    }
  }

  Widget profile() {
    final Size size = MediaQuery.of(context).size;
    void initState() {
      super.initState();
      controller.fecthUser().then((value) {
        setState(() {
          user = controller.setUser() as User;
        });
      });
    }

    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: CustomAppBar(
        height: getVerticalSize(40.00),
        title: Padding(
          padding: getPadding(left: 12),
          child: Text(
            "Profile".tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtInterBlack18,
          ),
        ),
        actions: [
          CustomImageView(
            svgPath: ImageConstant.imgNotification,
            height: getSize(25.00),
            width: getSize(25.00),
            margin: getMargin(left: 13, top: 7, right: 13, bottom: 9),
          ),
          TextButton(
            onPressed: () {
              controller.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInPage(),
                ),
              );
            },
            child: Text(
              "Log Out",
              style: TextStyle(color: Color.fromARGB(255, 26, 78, 209)),
            ),
          ),
        ],
        styleType: Style.bgFillWhiteA700,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: getHorizontalSize(375.00),
                height: getVerticalSize(250.00),
                decoration: BoxDecoration(
                  color: ColorConstant.whiteA700,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(getSize(20.00)),
                    bottomRight: Radius.circular(getSize(20.00)),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorConstant.black90019.withOpacity(0.3),
                      offset: Offset(0, getSize(4.00)),
                      blurRadius: getSize(10.00),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: getVerticalSize(100.00)),
              // Text(user.name),
              Positioned(
                width: getHorizontalSize(100),
                height: getVerticalSize(100),
                child: Text(
                  "Madpilot",
                  style: TextStyle(
                    color: ColorConstant.black900,
                    fontSize: getSize(18.00),
                    fontFamily: "popins",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
              // Positioned(),
            ],
          ),
          SizedBox(height: getVerticalSize(10.00)),
          Container(
            width: getHorizontalSize(375.00),
            height: getVerticalSize(200.00),
            child: Stack(
              children: [
                Container(
                  width: getHorizontalSize(375.00),
                  height: getVerticalSize(200.00),
                  decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
                    borderRadius: BorderRadius.circular(getSize(20.00)),
                    boxShadow: [
                      BoxShadow(
                        color: ColorConstant.black90019.withOpacity(0.3),
                        offset: Offset(0, getSize(4.00)),
                        blurRadius: getSize(10.00),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: getHorizontalSize(20.00),
                  top: getVerticalSize(20.00),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/icon_email.png',
                                width: 25,
                                height: 25,
                              ),
                              SizedBox(width: getHorizontalSize(10.00)),
                              Text(
                                "Email",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getSize(18.00),
                                  fontFamily: "popins",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: getVerticalSize(10.00)),
                          Text(
                            "Sigma@gmail.com",
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getSize(14.00),
                              fontFamily: "popins",
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
