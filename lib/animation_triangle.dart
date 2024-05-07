import 'package:flutter/material.dart';

class AnimasiTriangelContainer extends StatefulWidget {
  const AnimasiTriangelContainer({Key? key}) : super(key: key);

  @override
  State<AnimasiTriangelContainer> createState() =>
      _AnimasiTriangelContainerState();
}

class _AnimasiTriangelContainerState extends State<AnimasiTriangelContainer> {
  bool _isCircle = false;
  double pageScale = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animasi Container'),
      ),
      body: buildPage("Auto Animate"),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () => setState(() {
              _isCircle = false;
            }),
            child: const Icon(Icons.navigate_before),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () => setState(() {
              _isCircle = true;
            }),
            child: const Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }

  Widget buildPage(String text) {
    return ListView(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                buildAnimatedContainer(Colors.cyan, 200, 200),
                const SizedBox(width: 10),
                buildAnimatedContainer(Colors.pink, 150, 150),
                const SizedBox(width: 10),
                buildAnimatedContainer(Colors.yellow, 90, 90),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
        Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildAnimatedContainer(Color color, double width, double height) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
      transform: Matrix4.translationValues(
        _isCircle ? calculateXOffset(color) : 0,
        0,
        -1.0,
      )..scale(pageScale),
      width: _isCircle ? width : 150,
      height: _isCircle ? height : 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius:
            _isCircle ? BorderRadius.circular(100) : BorderRadius.circular(0),
      ),
    );
  }

  double calculateXOffset(Color color) {
    switch (color) {
      case Colors.cyan:
        return 130;
      case Colors.pink:
        return -55;
      case Colors.yellow:
        return -185;
      default:
        return 0;
    }
  }
}