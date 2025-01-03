import 'package:flutter/material.dart';
import '../Page_Test/Page_principal_test.dart';
class LoginPMR extends StatelessWidget {
  const LoginPMR({Key? key}) : super(key: key);

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
          // Texte de bienvenue
          const Text(
            'Bienvenue',
            style: TextStyle(
              fontSize: 35,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
            ),
          ),
          // Formulaire
          Form(
            child: Column(
              children: [
                // Champ de saisie pour le nom d'utilisateur
                SizedBox(height: MediaQuery.of(context).size.width * 0.2),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
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
                      // Action lors de la saisie
                    },
                    validator: (value) {
                      return value!.isEmpty
                          ? "Entrez votre nom d'utilisateur"
                          : null;
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.1),

                // Champ de saisie pour le mot de passe
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
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
                      // Action lors de la saisie
                    },
                    validator: (value) {
                      return value!.isEmpty
                          ? "Entrez votre mot de passe"
                          : null;
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.1),

                // Bouton 'se connecter'
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
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
                            builder: (context) => Main_Page()));

                      },
                      child: const Text('Se connecter'),
                      textColor: Colors.black,
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
