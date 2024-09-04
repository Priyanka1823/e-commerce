
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shopnestfrontend/presentation/screens/auth/providers/login_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shopnestfrontend/presentation/screens/auth/signup_screen.dart';
import '../../../core/ui.dart';
import '../../../logic/cubits/user_cubit/user_cubit.dart';
import '../../../logic/cubits/user_cubit/user_state.dart';
import '../../widgets/gap_widget.dart';
import '../../widgets/link_button.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/primary_textfield.dart';
import '../home/home_screen.dart';
import '../splash/splash_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);

    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if(state is UserLoggedInState) {
          //Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        }
      },
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            title: const Text("Ecommerce App")
        ),
        body: SafeArea(
          child: Form(
            key: provider.formKey,
            child: ListView(
                padding: const EdgeInsets.all(16),
                children: [

                  Text("Log In", style: TextStyles.heading2),
                  const GapWidget(size: -10),

                  (provider.error != "") ? Text(
                    provider.error,
                    style: const TextStyle(color: Colors.red),
                  ) : const SizedBox(),

                  const GapWidget(size: 5),

                  PrimaryTextField(
                      controller: provider.emailController,
                      validator: (value) {
                        if(value == null || value.trim().isEmpty) {
                          return "Email address is required!";
                        }

                        if(!EmailValidator.validate(value.trim())) {
                          return "Invalid email address";
                        }

                        return null;
                      },
                      labelText: "Email Address"
                  ),

                  const GapWidget(),

                  PrimaryTextField(
                      controller: provider.passwordController,
                      obscureText: true,
                      validator: (value) {
                        if(value == null || value.trim().isEmpty) {
                          return "Password is required!";
                        }
                        return null;
                      },
                      labelText: "Password"
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LinkButton(
                          onPressed: () {},
                          text: "Forgot Password?"
                      ),
                    ],
                  ),

                  const GapWidget(),

                  PrimaryButton(
                      onPressed: provider.logIn,
                      text: (provider.isLoading) ? "..." : "Log In"
                  ),

                  const GapWidget(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("Don't have an account?", style: TextStyles.body2),

                      const GapWidget(),

                      LinkButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SignupScreen.routeName);
                          },
                          text: "Sign Up"
                      )

                    ],
                  ),

                ]
            ),
          ),
        ),
      ),
    );
  }
}