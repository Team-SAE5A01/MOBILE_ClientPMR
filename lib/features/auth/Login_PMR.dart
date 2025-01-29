import 'package:flutter/material.dart';
import 'package:mobilite_pmr/features/utilisateur/Page_principal_test.dart';

class LoginPMR extends StatelessWidget {
  const LoginPMR({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(16, 36, 50, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.width * 0.5,
            child: Image.asset(
              'Assets/Images/Logo/Logo_PMR.png',
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
                SizedBox(height: MediaQuery.of(context).size.width * 0.2),
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
                      prefixIcon: Icon(Icons.man),
                    ),
                    onChanged: (String value) {
                      // Action when text changes
                    },
                    validator: (value) {
                      return value!.isEmpty
                          ? "Entrez votre nom d'utilisateur"
                          : null;
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                // Password Input
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      hintText: "Mot de passe",
                      hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      prefixIcon: Icon(Icons.password),
                    ),
                    onChanged: (String value) {
                      // Action when text changes
                    },
                    validator: (value) {
                      return value!.isEmpty ? "Entrez votre mot de passe" : null;
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                // Login Button
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: const Color.fromRGBO(186, 251, 223, 0.8),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Main_Page(),
                          ),
                        );
                      },
                      textColor: Colors.black,
                      child: const Text('Se connecter'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}