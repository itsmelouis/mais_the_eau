import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FrostedGlassDate extends StatelessWidget {
  final double borderRadius;
  final String tempMin;
  final String tempMax;
  final String icon;
  final String description;
  final DateTime date;
  final String location;

  const FrostedGlassDate({
    Key? key,
    this.borderRadius = 30.0,
    required this.tempMin,
    required this.tempMax,
    required this.icon,
    required this.description,
    required this.date,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  Text(
                    DateFormat('EEE d MMM yyyy', 'fr').format(date),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on, color: Theme.of(context).iconTheme.color),
                      Text(
                        location.isNotEmpty ? location : 'Inconnu',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "assets/weather/$icon.png",
                      width: 100,
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$tempMin°/$tempMax°",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 14,
                                ),
                          ),
                          Text(
                            description,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
