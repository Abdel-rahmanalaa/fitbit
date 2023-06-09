import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/features/auth/presentation/screens/login/login_screen.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_form_field_text.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_icon_button.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_text_button_large.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ReigsterScreen1 extends StatefulWidget {
  const ReigsterScreen1({super.key});

  @override
  State<ReigsterScreen1> createState() => _ReigsterScreen1State();
}

class _ReigsterScreen1State extends State<ReigsterScreen1>
    with RestorationMixin {
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  RestorableBoolN checkboxValue = RestorableBoolN(false);

  @override
  String? get restorationId => 'checkbox_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(checkboxValue, 'checkbox');
  }

  @override
  void dispose() {
    checkboxValue.dispose();
    super.dispose();
  }

  Widget _buildWelcomeAndCreateAccountText(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Hey there,',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.title),
        ),
        Text(
          'Create an Account',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildFirstNameTextFormFiled(BuildContext context) {
    return CustomTextFormField(
      textEditingController: _firstNameController,
      keyBoardType: TextInputType.name,
      prefixIcon: const Icon(Icons.person_outlined, color: AppColors.grey1),
      hintText: 'First Name',
      labelText: 'First Name',
    );
  }

  Widget _buildEmailTextFormFiled(BuildContext context) {
    return CustomTextFormField(
      textEditingController: _emailController,
      keyBoardType: TextInputType.emailAddress,
      prefixIcon: const Icon(
        Icons.email_outlined,
        color: AppColors.grey1,
      ),
      hintText: 'Email',
      labelText: 'Email',
      //errorText: 'Error',
    );
  }

  Widget _buildLineOfAcceptOurPrivacyAndTerms(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          fillColor: MaterialStateProperty.all<Color>(AppColors.lightPrimary),
          value: checkboxValue.value,
          onChanged: (value) {
            setState(() {
              checkboxValue.value = value;
            });
          },
        ),
        Expanded(
          child: Text(
            'By continuing you accept our Privacy Policy and Term of Use',
            //overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: AppFontSize.s12,
                  fontWeight: AppFontWeight.regular,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return CustomTextButtonLarge(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.register_2Route);
      },
      textButton: 'Register',
    );
    // return ElevatedButton(
    //   onPressed: () {
    //     /// todo navigate
    //     // Navigator.pushNamed(context, AppRoutesName.onBoarding_2Route);
    //   },
    //   style: ElevatedButton.styleFrom(
    //     shape: const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.all(Radius.circular(99)),
    //     ),
    //     padding: const EdgeInsets.all(0),
    //   ),
    //   child: Ink(
    //     decoration: const BoxDecoration(
    //       gradient: LinearGradient(
    //         begin: Alignment.topLeft,
    //         end: Alignment.bottomRight,
    //         colors: [
    //           AppColors.darkPrimary,
    //           AppColors.lightPrimary,
    //         ],
    //         stops: [
    //           0.0,
    //           1.0,
    //         ],
    //       ),
    //       borderRadius: BorderRadius.all(Radius.circular(99)),
    //     ),
    //     child: Container(
    //       width: 315,
    //       height: 60,
    //       alignment: Alignment.center,
    //       child: const Text(
    //         'Register',
    //         style: TextStyle(
    //           color: Colors.white,
    //           fontSize: AppFontSize.s18,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget _buildOrDivider(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 141,
          height: 1, // Thickness
          color: Colors.grey,
        ),
        Text(
          'Or',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Container(
          width: 141,
          height: 1, // Thickness
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildGmailAndFacebookIcon(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
          assetImage: 'assets/images/gmail_icon.svg',
        ),
        // GestureDetector(
        //   onTap: () {},
        //   child: Container(
        //     width: 50,
        //     height: 50,
        //     decoration: BoxDecoration(
        //       border: Border.all(
        //         //width: 0.8,
        //         color: AppColors.grey3,
        //       ),
        //       borderRadius: const BorderRadius.all(
        //         Radius.circular(14),
        //       ),
        //     ),
        //     child: Padding(
        //       padding: const EdgeInsets.all(10.0),
        //       child: SvgPicture.asset(
        //         'assets/images/gmail_icon.svg',
        //         fit: BoxFit.scaleDown,
        //       ),
        //     ),
        //   ),
        // ),
        SizedBox(
          width: 30,
        ),
        CustomIconButton(
          assetImage: 'assets/images/facebook_icon.svg',
        ),
        // GestureDetector(
        //   onTap: () {},
        //   child: Container(
        //     width: 50,
        //     height: 50,
        //     decoration: BoxDecoration(
        //       border: Border.all(
        //         width: 0.8,
        //         color: AppColors.grey3,
        //       ),
        //       borderRadius: const BorderRadius.all(
        //         Radius.circular(14),
        //       ),
        //     ),
        //     child: Padding(
        //       padding: const EdgeInsets.all(10.0),
        //       child: SvgPicture.asset(
        //         'assets/images/facebook_icon.svg',
        //         fit: BoxFit.scaleDown,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildAlreadyHaveAccount(context) {
    return RichText(
      text: TextSpan(
        text: 'Already have an account?',
        style: const TextStyle(
            color: AppColors.black,
            fontSize: AppFontSize.s18,
            height: AppSize.s1_5),
        children: <TextSpan>[
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Future.delayed(Duration.zero, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                });
              },
            text: ' Login',
            style: const TextStyle(
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 80, right: 30, left: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildWelcomeAndCreateAccountText(context),
                const SizedBox(
                  height: 45,
                ),
                _buildFirstNameTextFormFiled(context),
                const SizedBox(
                  height: 18,
                ),
                _buildEmailTextFormFiled(context),
                const SizedBox(
                  height: 36,
                ),
                _buildLineOfAcceptOurPrivacyAndTerms(context),
                const SizedBox(
                  height: 169,
                ),
                _buildRegisterButton(context),
                const SizedBox(
                  height: 29,
                ),
                _buildOrDivider(context),
                const SizedBox(
                  height: 29,
                ),
                _buildGmailAndFacebookIcon(context),
                const SizedBox(
                  height: 30,
                ),
                _buildAlreadyHaveAccount(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutesName.loginRoute);
  }
}
