import 'package:flutter/material.dart';
import 'package:mais_the_eau/theme/pallete.dart';

class Loader extends StatefulWidget {
  final String? error;
  final bool isError;

  const Loader({
    Key? key,
    required this.isError,
    required this.error,
  }) : super(key: key);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true); // Ajout de reverse pour l'effet de pulsation

    // Création d'une animation Tween pour la pulsation de l'échelle
    _scaleAnimation = Tween(begin: 0.90, end: 1.10)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Création d'une animation Tween pour l'opacité
    _opacityAnimation = Tween(begin: 0.5, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            PalleteLight.gradiantFromColor,
            PalleteLight.gradiantToColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller, // AnimationController
            builder: (context, child) {
              return Opacity(
                opacity:
                    _opacityAnimation.value, // Utiliser l'animation d'opacité
                child: Transform.scale(
                  scale:
                      _scaleAnimation.value, // Utiliser l'animation d'échelle
                  child: child,
                ),
              );
            },
            child: Image.asset("assets/icons/clouds.png", width: 100),
          ),
          const SizedBox(height: 40),
          widget.isError
              ? Text(
                  widget.error ?? "Une erreur est survenue",
                  style: TextStyle(
                    color: PalleteLight.activeTextColor,
                    fontSize: 16,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
