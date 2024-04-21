import 'package:flutter/material.dart';
import 'package:tetrismini/gamescreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GameScreenLoader()),
        );
      },
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 50, left: 20),
                child: Row(
                  children: [
                    cont("T", const Color.fromRGBO(54, 132, 241, 1)),
                    cont("E", const Color.fromARGB(255, 255, 238, 0)),
                    cont("T", const Color.fromARGB(255, 89, 255, 0)),
                    cont("R", const Color.fromARGB(255, 254, 58, 189)),
                    cont("I", Colors.orange),
                    cont("S", const Color.fromARGB(255, 255, 253, 111)),
                  ],
                ),
              ),
              const Text("Press anywhere to start the game",
                  style: TextStyle(color: Colors.white, fontSize: 20))
            ],
          )),
    );
  }
}

Widget cont(String letter, Color color) {
  return Container(
    height: 70,
    width: 60,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Text(
        "$letter",
        style: const TextStyle(
            fontSize: 40,
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w900),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ), // Loading indicator
      ),
    );
  }
}

class GameScreenLoader extends StatefulWidget {
  const GameScreenLoader({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GameScreenLoaderState createState() => _GameScreenLoaderState();
}

class _GameScreenLoaderState extends State<GameScreenLoader> {
  Future<void> _loadGameScreen() async {
    // Simulate loading delay
    await Future.delayed(
        const Duration(seconds: 1)); // Adjust the duration as needed

    // Navigate to the game screen after loading
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const GameScreenState()),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadGameScreen(); // Start loading the game screen
  }

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(); // Show loading screen while loading
  }
}
