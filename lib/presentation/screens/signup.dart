import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppe/configs/app_typography.dart';
import 'package:shoppe/configs/configs.dart';
import 'package:shoppe/core/constant/assets.dart';
import 'package:shoppe/core/constant/colors.dart';
import 'package:shoppe/presentation/widgets/auth_error_dialog.dart';
import 'package:shoppe/presentation/widgets/credential_failure_dialog.dart';
import 'package:shoppe/presentation/widgets/custom_appbar.dart';
import 'package:shoppe/presentation/widgets/successful_auth_dialog.dart';
import 'package:shoppe/presentation/widgets/transparent_button.dart';

import '../../application/user_bloc/user_bloc.dart';
import '../../core/error/failures.dart';
import '../../core/router/app_router.dart';
import '../../domain/usecases/user/sign_up_usecase.dart';
import '../widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

//  bool isLoading = false;
  bool isChecked = false;

  /* void _startLoading() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 15), () {
      setState(() {
        isLoading = false;
      });
    });
  }*/
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: CustomAppBar("SIGNUP", context, automaticallyImplyLeading: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0) +
                const EdgeInsets.only(top: 30.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Create Account",
                      style: TextStyle(
                        color: AppColors.LightText,
                        fontSize: 52,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      )),
                  Space.y2!,
                  SvgPicture.asset(AppAssets.UploadPhoto),
                  Space.yf(3),
                  buildTextFormField(_nameController, "Full Name"),
                  Space.yf(1.5),
                  buildTextFormField(_emailController, "Email Address"),
                  Space.yf(1.5),
                  buildTextFormField(_passwordController, "Password",
                      isObscure: true),
                  Space.yf(1.5),
                  buildTextFormField(_confirmPasswordController, "Password",
                      isObscure: true),
                  Space.yf(1.5),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         setState(() {
                  //           isChecked = !isChecked;
                  //         });
                  //       },
                  //       child: isChecked
                  //           ? const Icon(
                  //               Icons.check_box,
                  //               color: Colors.black,
                  //             )
                  //           : const Icon(
                  //               Icons.check_box_outline_blank_outlined,
                  //               color: Colors.black,
                  //             ),
                  //     ),
                  //     Space.x!,
                  //     Expanded(
                  //         child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           "I Accept All Privacy Policies And Terms & Conditions Of ",
                  //           style: AppText.l1,
                  //           softWrap: true,
                  //         ),
                  //         Text(
                  //           "Piicks!",
                  //           style: AppText.l1b,
                  //         ),
                  //       ],
                  //     ))
                  //   ],
                  // ),
                  // Space.yf(1.5),
                  BlocConsumer<UserBloc, UserState>(
                    listener: (context, state) {
                      if (state is UserLogged) {
                        showSuccessfulAuthDialog(context, "Registered");
                      } else if (state is UserLoggedFail) {
                        if (state.failure is CredentialFailure) {
                          showCredentialErrorDialog(context);
                        } else {
                          showAuthErrorDialog(context);
                        }
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (_passwordController.text !=
                                _confirmPasswordController.text) {
                            } else {
                              context.read<UserBloc>().add(
                                    SignUpUser(
                                      SignUpParams(
                                        firstName: _nameController.text,
                                        lastName: _nameController.text,
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      ),
                                    ),
                                  );
                            }
                          }
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          minimumSize: MaterialStatePropertyAll(
                            Size(
                              double.infinity,
                              AppDimensions.normalize(20),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Text(
                            (state is UserLoading) ? "Wait..." : "Done",
                            style:
                                AppText.h3b?.copyWith(color: AppColors.Textf3),
                          ),
                        ),
                      );
                    },
                  ),
                  Space.yf(1.5),
                  Center(
                      child: Text(
                    "Already Have an Account?",
                    style: AppText.b1b,
                  )),
                  Space.y1!,
                  transparentButton(
                      context: context,
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRouter.login);
                      },
                      buttonText: "Login")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
