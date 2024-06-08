import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreenAnimation extends StatefulWidget {
  const LoginScreenAnimation({super.key});

  @override
  State<LoginScreenAnimation> createState() => _LoginScreenAnimationState();
}

class _LoginScreenAnimationState extends State<LoginScreenAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late Animation<double> flutterLogoOpacityAnimation;
  late Animation<Offset> offsetAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    flutterLogoOpacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController);
    offsetAnimation =
        Tween<Offset>(begin: const Offset(-1, -1), end: Offset.zero).animate(
            CurvedAnimation(parent: animationController, curve: Curves.ease));
    scaleAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: flutterLogoOpacityAnimation,
              child: const FlutterLogo(
                size: 100.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SlideTransition(
                position: offsetAnimation,
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
