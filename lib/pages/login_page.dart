import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/pages/chat_page.dart';
import 'package:scholar_chat/pages/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat/pages/cubits/login_cubit/login_cubit.dart';
import 'package:scholar_chat/pages/register_page.dart';
import 'package:scholar_chat/widgets/custom_button.dart';
import 'package:scholar_chat/widgets/custom_text_form_field.dart';

import '../helper/show_snack_bar.dart';

class LoginPage extends StatelessWidget {
  String? email, password;

  bool isLoading = false;

  GlobalKey<FormState> loginKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatPage(
                        email: email,
                      )));
          isLoading = false;
        } else if (state is LoginFailure) {
          showSnackbar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: loginKey,
              child: ListView(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset('assets/images/scholar.png'),
                      const Text(
                        'Chat App',
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 32,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' Sign In',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        hintText: 'Email',
                        onChanged: (data) {
                          email = data;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        isObscure: true,
                        hintText: 'Password',
                        onChanged: (data) {
                          password = data;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          label: 'LOGIN',
                          onTap: () async {
                            if (loginKey.currentState!.validate()) {
                              isLoading = true;
                              {
                                BlocProvider.of<LoginCubit>(context).loginUser(
                                    email: email!, password: password!);
                              }
                            }
                            isLoading = false;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'don\'t have an account? ',
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            child: Text(
                              '  Register',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
