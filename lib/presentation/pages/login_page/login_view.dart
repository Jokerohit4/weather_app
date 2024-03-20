import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presentation/pages/login_page/login_view_model.dart';
import 'package:weather_app/presentation/widgets/theme_button.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:weather_app/utils/constants/string_constants.dart';
import 'package:weather_app/utils/extension/extension.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = LoginViewModel();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.network(
            StringConstants.weatherImage,
            width: 0.5.sw,
          ),
          field(true),
          field(false),
          0.15.sh.heightSizedBox,
          ThemeButton(title: "LOGIN", onTap: () => viewModel.signIn(context)),
        ],
      ).paddingSymmetric(horizontal: 0.05.sw, vertical: 0.05.sh),
    );
  }

  Widget field(bool isEmail) {
    return Container(
      width: 0.9.sw,
      margin: EdgeInsets.symmetric(vertical: 0.02.sh),
      padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.01.sh),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: AppColors.whiteColor,
        boxShadow: const [
          BoxShadow(
            color: AppColors.greyColor,
            offset: Offset(0, 4),
            blurRadius: 2,
            spreadRadius: 4,
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          hintText: isEmail
              ? StringConstants.typeInYourMail
              : StringConstants.enterPassword, // Placeholder text
          border: InputBorder.none,
          prefixIcon:
              Icon(isEmail ? Icons.mail : Icons.lock), // Search icon at the end
        ),
      ),
    );
  }
}
