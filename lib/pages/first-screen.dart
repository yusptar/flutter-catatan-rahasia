import 'package:flutter/material.dart';
import 'package:flutter_evaluasi/pages/second-screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _pin = TextEditingController();

  bool checkValid = true;
  bool passwordHidden = true;

  Future<void> _login() async {
    if (_pin.text.isNotEmpty) {
      setState(() {
        if (_pin.text == "240801") {
          checkValid = true;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const SecondScreen();
              },
            ),
          );
        } else {
          checkValid = false;
          const snackBar = SnackBar(
            content: Text('Oops, something went wrong! check your PIN again.'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    } else {
      const snackBar = SnackBar(
        content: Text('Input your PIN'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _showPassword() {
    setState(() {
      passwordHidden = !passwordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Login Page',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Image(
                  image: AssetImage('CR.png'),
                  width: 120,
                ),
              ),
              TextField(
                controller: _pin,
                obscureText: passwordHidden,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Masukkan Pin Anda",
                  suffixIcon: IconButton(
                    onPressed: () {
                      _showPassword();
                    },
                    icon: (passwordHidden)
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: ListTile(
                  title: const Text(
                    "Log In",
                    textAlign: TextAlign.center,
                  ),
                  onTap: _login,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
