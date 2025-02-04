import 'package:flutter/material.dart';
import 'user_profile_page.dart';
import 'home_user_page.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 36, 50, 1),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Image.asset(
                  'lib/assets/images/Logo_PMR.png',
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Réserver",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                child: const Text("Aller simple"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: const Text("Clear", style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Départ", style: TextStyle(color: Colors.white)),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Entrer le départ",
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text("Destination", style: TextStyle(color: Colors.white)),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Entrer la destination",
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
