import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: 80,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.calendar_today,
                    color: selectedIndex == 0 ? Colors.black : Colors.white,
                    size: 30,
                  ),
                  onPressed: () => onItemTapped(0),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectedIndex == 1 ? Colors.white : Colors.transparent,
                  ),
                  child: Icon(
                    Icons.home,
                    color: selectedIndex == 1 ? Colors.blueAccent : Colors.white,
                    size: 35,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.person,
                    color: selectedIndex == 2 ? Colors.black : Colors.white,
                    size: 30,
                  ),
                  onPressed: () => onItemTapped(2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
