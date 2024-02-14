// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundraising_fullstack/home/views/home_page.dart';

import '../cubit/auth_cubit.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final emailcontroller = TextEditingController(text: "20gcs32@meaec.edu.in");
  final passwordcontroller = TextEditingController(text: "12341234");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              InkWell(
                onTap: () {},
                child: Text(
                  "English (US)",
                  style: TextStyle(
                    color: Color.fromARGB(255, 192, 186, 186),
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Color.fromARGB(255, 78, 77, 77),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 8,
                  ),
                  child: TextField(
                      controller: emailcontroller,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Username, email or Phone number",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 192, 186, 186),
                          ))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Color.fromARGB(255, 78, 77, 77),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 8,
                  ),
                  child: TextField(
                      controller: passwordcontroller,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password...",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 192, 186, 186),
                          ))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthError) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.message),
                      ));
                    }

                    if (state is AuthSuccess) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                    }
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      final email = emailcontroller.text;
                      final password = passwordcontroller.text;
                      context.read<AuthCubit>().login(email, password);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, shape: StadiumBorder()),
                    child: Text(
                      "Log in",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
