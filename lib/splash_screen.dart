part of './import_path.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3100,
        splash: Lottie.asset('assets/animation/animation8.json'),
        splashIconSize: 300,
        backgroundColor: Colors.white,
        nextScreen: LoginScreen());
  }
}
