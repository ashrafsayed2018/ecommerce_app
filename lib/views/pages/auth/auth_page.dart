import 'package:ecommerce_tarek_alabd/controllers/auth_controller.dart';
import 'package:ecommerce_tarek_alabd/utilities/enums.dart';
import 'package:ecommerce_tarek_alabd/utilities/routes.dart';
import 'package:ecommerce_tarek_alabd/views/widgets/custom_input.dart';
import 'package:ecommerce_tarek_alabd/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  Future<void> _submit(AuthController model) async {
    try {
      await model.submit();

      if (!mounted) return;

      Navigator.of(context).pushReplacementNamed(AppRoutes.bottomNavbar);
    } catch (e) {
      debugPrint("here me");
      // TODO: we will refactor this code later in a separate widget
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(
                "Error",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              content: Text(
                e.toString(),
                style: Theme.of(context).textTheme.subtitle1,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("موافق"))
              ],
            );
          });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Consumer<AuthController>(
      builder: (_, model, __) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    model.authFormType == AuthFormType.login
                        ? Text(
                            'دخول',
                            style: Theme.of(context).textTheme.headline4,
                          )
                        : Text(
                            'تسجيل',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                    const SizedBox(height: 20),
                    CustomInput(
                      onChanged: model.updateEmail,
                      hintText: "البريد الإلكتروني",
                      labelText: "البريد الإلكتروني",
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      isPassowrd: false,
                      focusNode: _emailFocusNode,
                      icon: const Icon(Icons.email_outlined),
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'البريد الإلكتروني مطلوب';
                        }
                        if (!value.contains('@')) {
                          return 'البريد الإلكتروني غير صحيح';
                        }

                        if (!value.contains("gmail") &&
                            !value.contains("yahoo")) {
                          return 'البريد الإلكتروني غير صحيح';
                        }
                        if (!value.contains(".com")) {
                          return 'البريد الإلكتروني غير صحيح';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomInput(
                      onChanged: model.updatePassword,
                      hintText: "كلمة المرور",
                      labelText: "كلمة المرور",
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      isPassowrd: true,
                      focusNode: _passwordFocusNode,
                      icon: const Icon(Icons.lock_outline),
                      onEditingComplete: () {
                        // FocusScope.of(context).requestFocus(_emailFocusNode);
                      },
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'كلمة المرور مطلوبة';
                        }
                        if (value.length < 6) {
                          return 'كلمة المرور يجب أن تكون أكثر من 6 أحرف';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    model.authFormType == AuthFormType.login
                        ? InkWell(
                            onTap: () {},
                            child: const Text(
                              "نسيت كلمة المرور؟",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : const SizedBox(
                            height: 24,
                          ),
                    const SizedBox(height: 20),
                    MianButton(
                      text: model.authFormType == AuthFormType.login
                          ? 'دخول'
                          : "تسجيل",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _submit(model);
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        model.toggleFormType();
                      },
                      child: model.authFormType == AuthFormType.login
                          ? const Text(
                              "ليس لديك حساب؟ سجل الآن",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const Text(
                              "هل لديك حساب؟ دخول",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "او تسجيل بواسطة",
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
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                          ),
                          child: const Icon(Icons.facebook),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          width: 80,
                          height: 60,
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
        ),
      ),
    );
  }
}
