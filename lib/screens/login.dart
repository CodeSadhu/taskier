import 'package:appwrite/models.dart';
import 'package:appwrite_hack/utils/app_routes.dart';
import 'package:appwrite_hack/utils/appwrite_service.dart';
import 'package:appwrite_hack/utils/assets.dart';
import 'package:appwrite_hack/utils/colors.dart';
import 'package:appwrite_hack/utils/constants.dart';
import 'package:appwrite_hack/utils/shared_prefs_helper.dart';
import 'package:appwrite_hack/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = Constants.getSize(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: size.height,
            width: size.width,
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.02,
              horizontal: size.width * 0.04,
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Todo Hack',
                    style: Styles.appbarStyle(
                      fontSize: 38,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Built with ❤️',
                    style: Styles.smallBodyStyle(),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'using Flutter & Appwrite',
                    style: Styles.smallBodyStyle(),
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            Assets.appBanner,
          ),
          Positioned(
            bottom: 0,
            child: buildForm(size),
          ),
        ],
      ),
    );
  }

  Widget buildForm(Size size) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.4,
        maxWidth: size.width,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: ColorPalette.background,
      ),
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.02,
        horizontal: size.width * 0.04,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            style: const TextStyle(
              color: Colors.white,
            ),
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorPalette.primary,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          TextFormField(
            style: const TextStyle(
              color: Colors.white,
            ),
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorPalette.primary,
                ),
              ),
            ),
            obscureText: true,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(
                double.infinity,
                size.height * 0.06,
              ),
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.02,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () async {
              final user = AppwriteService.account.createEmailSession(
                email: _emailController.text,
                password: _passwordController.text,
              );
              user.then((value) {
                Constants.navigateToDashboard(
                  userId: value.userId,
                  // providerAccessToken: value.providerAccessToken,
                  // providerRefreshToken: value.providerRefreshToken,
                );
              });
            },
            child: Text(
              'Log In',
              style: Styles.h2Style(),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.signup);
            },
            child: RichText(
              text: TextSpan(
                text: 'Don\'t have an account? ',
                style: Styles.smallBodyStyle(),
                children: [
                  TextSpan(
                    text: 'Create one!',
                    style: Styles.smallBodyStyle(
                      decoration: TextDecoration.underline,
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
}
