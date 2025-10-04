import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';
import 'package:hackthon/screens/on_boarding/on_boarding_screen.dart';
import 'package:hackthon/screens/splash/controllers/splash_controller.dart';

// Your splash1 and splash2 widgets remain almost the same,
// just update splash1 to modify the notifier's value.

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> animations = [
      const Splash1(),
      Splash2(),
      Splash3(),
      Splash4(),
    ];

    return Scaffold(
      body: Center(
        // 1. Listen to the ValueNotifier
        child: ValueListenableBuilder<int>(
          valueListenable: SplashController.curView,
          builder: (context, currentViewIndex, child) {
            // 2. This builder function re-runs every time the value changes
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Container(
                // 3. Use the new value from the builder for the key
                key: ValueKey<int>(currentViewIndex),
                child: animations[currentViewIndex],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  double size = 80;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1250), () {
      // 4. Update the notifier's value. This automatically triggers the ValueListenableBuilder.
      size = 15;
      setState(() {});

      Future.delayed(Duration(milliseconds: 500), () {
        SplashController.curView.value++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // ... your build method here, no changes needed
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset('assets/img/logo_splash1.svg'),
        AnimatedContainer(
          height: size,
          width: size,
          duration: const Duration(milliseconds: 500),
          child: SvgPicture.asset('assets/img/circle_splash1.svg'),
        ),
      ],
    );
  }
}

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      // 4. Update the notifier's value. This automatically triggers the ValueListenableBuilder.
      SplashController.curView.value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ... your build method here, no changes needed
    return Stack(
      alignment: Alignment.center,
      children: [SvgPicture.asset('assets/img/logo_splash2.svg')],
    );
  }
}

class Splash3 extends StatefulWidget {
  const Splash3({super.key});

  @override
  State<Splash3> createState() => _Splash3State();
}

class _Splash3State extends State<Splash3> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      // 4. Update the notifier's value. This automatically triggers the ValueListenableBuilder.
      SplashController.curView.value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ... your build method here, no changes needed
    return Stack(
      alignment: Alignment.center,
      children: [SvgPicture.asset('assets/img/logo_splash3.svg')],
    );
  }
}

class Splash4 extends StatefulWidget {
  const Splash4({super.key});

  @override
  State<Splash4> createState() => _Splash4State();
}

class _Splash4State extends State<Splash4> {
  // to 150
  double logo_left = 0;
  //to 70
  double title_left = -150;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      // 4. Update the notifier's value. This automatically triggers the ValueListenableBuilder.
      logo_left = 150;
      title_left = 70;
      setState(() {});
      Future.delayed(Duration(milliseconds: 500), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnBoardingScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // ... your build method here, no changes needed
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          left: title_left,
          duration: Duration(milliseconds: 500),
          child: Text(
            "title",
            style: context.heading1.copyWith(fontWeight: FontWeight.bold),
          ).tr(),
        ),
        AnimatedPositioned(
          right: 0,
          left: logo_left,
          duration: Duration(milliseconds: 500),
          curve: Easing.linear,
          child: SvgPicture.asset('assets/img/logo.svg'),
        ),
      ],
    );
  }
}
// Splash2 can remain a StatefulWidget or be a StatelessWidget, no changes needed.