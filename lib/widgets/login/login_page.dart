import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:haikapp/providers/autentication_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void loginWthGoogle(BuildContext context) {
    context.read<AutenticationService>().signInWithGoogle();
  }

  Future<void> loginWithEmail(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;

    String output = await context
        .read<AutenticationService>()
        .signIn(email: email, password: password);

    print(output);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5 < 300
                ? 300
                : MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 50),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16) * 0.5,
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your email',
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5 < 300
                ? 300
                : MediaQuery.of(context).size.width,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16) * 0.5,
              child: TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your password',
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5 < 300
                ? 300
                : MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(bottom: 32),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16) *
                        0.5,
                child: TextButton(
                    child: const Text("Login"),
                    onPressed: () => loginWithEmail(context))),
          ),
          Container(
            height: 60,
            child: SignInButton(
              Buttons.Google,
              text: "Logg in med Google",
              onPressed: () => loginWthGoogle(context),
            ),
          ),
        ],
      ),
    );
  }
}
