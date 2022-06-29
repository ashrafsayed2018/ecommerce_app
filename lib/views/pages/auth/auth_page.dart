import 'package:ecommerce_tarek_alabd/utilities/enums.dart';
import 'package:ecommerce_tarek_alabd/views/widgets/custom_input.dart';
import 'package:ecommerce_tarek_alabd/views/widgets/main_button.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthFormType _authFormType = AuthFormType.login;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _authFormType == AuthFormType.login
                    ? Text(
                        'Login',
                        style: Theme.of(context).textTheme.headline4,
                      )
                    : Text(
                        'Register',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                const SizedBox(height: 64),
                CustomInput(
                  hintText: "Enter your Email",
                  labelText: "Email",
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  isPassowrd: false,
                ),
                const SizedBox(height: 20),
                CustomInput(
                  hintText: "Enter your password",
                  labelText: "Password",
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  isPassowrd: true,
                ),
                const SizedBox(height: 20),
                _authFormType == AuthFormType.login
                    ? InkWell(
                        onTap: () {},
                        child: const Text(
                          "Forget your Password ?",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : const SizedBox(
                        height: 16,
                      ),
                const SizedBox(height: 20),
                _authFormType == AuthFormType.login
                    ? MianButton(
                        text: 'Login',
                        onPressed: () {},
                      )
                    : MianButton(
                        text: 'Register',
                        onPressed: () {},
                      ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (_authFormType == AuthFormType.login) {
                        _authFormType = AuthFormType.register;
                      } else {
                        _authFormType = AuthFormType.login;
                      }
                    });
                  },
                  child: _authFormType == AuthFormType.login
                      ? const Text(
                          "Don't have an account ?",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const Text(
                          "Already have an account ?",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Or Login with Social Media",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.facebook),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
