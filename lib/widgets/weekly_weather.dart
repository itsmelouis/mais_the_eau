import 'package:flutter/material.dart';

class WeeklyWeather extends StatelessWidget {
  final int length;
  final List<String> dayList;
  final List<String> iconList;
  final List<String> tempList;

  const WeeklyWeather({
    super.key,
    required this.length,
    required this.dayList,
    required this.iconList,
    required this.tempList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 15,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.secondary,
            ),
            width: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${dayList[index].substring(0, 3)}.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 5),
                Image.asset(
                  "assets/weather/${iconList[index]}.png",
                  width: 30,
                ),
                const SizedBox(height: 5),
                Text(
                  "${tempList[index]}°",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
