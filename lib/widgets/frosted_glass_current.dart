import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FrostedGlassCurrent extends StatelessWidget {
  final double borderRadius;

  final String temp;
  final String icon;
  final String description;
  final String location;

  const FrostedGlassCurrent({
    Key? key,
    this.borderRadius = 30.0,
    required this.temp,
    required this.icon,
    required this.description,
    required this.location,
  }) : super(key: key);

  String getFormattedDate() {
    final now = DateTime.now();
    return DateFormat('EEE, d MMM yyyy').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              getFormattedDate(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 30,
                  color: Colors.black,
                ),
                const SizedBox(width: 10),
                Text(
                  location.isNotEmpty ? location : 'Inconnu',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Image.asset(
              "assets/weather/$icon.png",
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 10),
            Text(
              "$temp°C",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
