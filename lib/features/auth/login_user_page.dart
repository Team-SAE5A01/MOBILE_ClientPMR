import 'package:flutter/material.dart';
import '../../core/api_service.dart';
import 'forgot_password_page.dart';
import 'signup_page.dart';

class LoginPMR extends StatefulWidget {
  final Function(String email) onLogin;

  const LoginPMR({super.key, required this.onLogin});

  @override
  _LoginPMRState createState() => _LoginPMRState();
}

class _LoginPMRState extends State<LoginPMR> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ApiService _apiService = ApiService();

  Future<void> _loginUser() async {
    try {
      final user = await _apiService.loginUser(
        _usernameController.text,
        _passwordController.text,
      );
      widget.onLogin(user['email']);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nom d\'utilisateur ou mot de passe incorrect')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(16, 36, 50, 1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.width * 0.1),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              child: Image.asset(
                'assets/images/Logo_PMR.png',
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              'Bienvenue',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: TextFormField(
                      controller: _usernameController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Nom d'utilisateur",
                        hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),
                        prefixIcon: Icon(Icons.person, color: Colors.white),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre nom d\'utilisateur';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Mot de passe",
                        hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre mot de passe';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: const Color.fromRGBO(47, 184, 222, 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _loginUser();
                          }
                        },
                        textColor: Colors.black,
                        child: const Text('Se connecter'),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgotPasswordPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Mot de passe oublié ?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'S\'inscrire',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
