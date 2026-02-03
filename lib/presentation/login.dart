import 'package:chatter_matter_admin/common/colors.dart';
import 'package:chatter_matter_admin/common/custom_button.dart';
import 'package:chatter_matter_admin/common/custom_input.dart';
import 'package:chatter_matter_admin/common/custom_snake_bar.dart';
import 'package:chatter_matter_admin/common/custom_text_style.dart';
import 'package:chatter_matter_admin/common/navigator.dart';
import 'package:chatter_matter_admin/common/padding.dart';
import 'package:chatter_matter_admin/core/enums.dart';
import 'package:chatter_matter_admin/provider/dashboard_provider.dart';
import 'package:chatter_matter_admin/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isLoading = false;
  String email = "";
  String password = "";

  void login() async {
    setState(() {
      isLoading = true;
    });
    final data = await Provider.of<DashboardProvider>(
      context,
      listen: false,
    ).loginAndGetToken(email: email, password: password);

    if (data != null && mounted) {
      // print(data);
      // animatedNavigateReplaceAll(context, )
      showToast(context: context, title: data, type: ToastType.success);
      context.go(CustomRoute.home);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            // hPadExp,
            SizedBox(width: double.infinity, height: 0),
            Text(
              "Login to see your Business Growth".toUpperCase(),
              style: heading(),
            ),
            vPad35,
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: Column(
                spacing: 25,
                children: [
                  customInput(
                    hintText: "Enter Email",
                    isEnable: !isLoading,
                    onChange: (e) => email = e,
                  ),
                  customInput(
                    hintText: "Enter Password",
                    isEnable: !isLoading,
                    onChange: (e) => password = e,
                  ),

                  customFilledButton(
                    isLoading: isLoading,
                    onTap: () => login(),
                    title: "Login",
                    bg: customPurple,
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
