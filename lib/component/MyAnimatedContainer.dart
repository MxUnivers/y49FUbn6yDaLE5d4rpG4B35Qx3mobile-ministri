import  "package:flutter/material.dart" ;

class MyAnimatedContainer extends StatefulWidget {
  const MyAnimatedContainer({Key? key}) : super(key: key);

  @override
  _MyAnimatedContainerState createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  Color _backgroundColor = Colors.blue;

  void _changeColor() {
    setState(() {
      _backgroundColor = _backgroundColor == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: 200.0,
          height: 200.0,
          color: _backgroundColor,
        ),
      ),
    );
  }

}
