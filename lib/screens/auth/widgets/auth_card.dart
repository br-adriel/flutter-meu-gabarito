import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthCard extends StatelessWidget {
  final Widget child;
  final String image;

  const AuthCard({super.key, required this.child, required this.image});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        Image(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenSize.height * 0.6),
                Container(
                  constraints:
                      BoxConstraints(minHeight: screenSize.height * 0.4),
                  padding: const EdgeInsets.all(16),
                  width: screenSize.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(8),
                      bottom: Radius.zero,
                    ),
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: child,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
