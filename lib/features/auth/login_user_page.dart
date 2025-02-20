import 'package:flutter/material.dart';
import 'package:mobilite_pmr/features/auth/forgot_password_page.dart';
import '../../core/app_layout.dart'; // Remplace HomeUserPage par AppLayout
import 'signup_page.dart';

class LoginPMR extends StatelessWidget {
  const LoginPMR({super.key, required void Function() onLogin});

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
            // Logo
            SizedBox(height: MediaQuery.of(context).size.width * 0.1),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              child: Image.asset(
                'assets/images/Logo_PMR.png',
                fit: BoxFit.cover,
              ),
            ),
            // Welcome Text
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
            // Form
            Form(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                  // Username Input
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
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
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                  // Password Input
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: TextFormField(
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
                    ),
                  ),            
                  SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                  // Login Button
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
                          // Redirection vers AppLayout qui gère la navbar
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AppLayout(),
                            ),
                          );
                        },
                        textColor: Colors.black,
                        child: const Text('Se connecter'),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                  // Forgot Password & Register
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Forgot Password
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
                        // Register
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
