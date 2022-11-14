import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final String quantity;
  final Color? cardColor;
  const ItemCard(
      {super.key,
      required this.name,
      required this.icon,
      required this.quantity,
      this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: cardColor ?? Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 20,
              offset: Offset(0, 0), // Shadow position
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: cardColor != null
                      ? Colors.white
                      : Theme.of(context).textTheme.bodyText2?.color,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  name,
                  style: TextStyle(
                      color: cardColor != null
                          ? Colors.white
                          : Theme.of(context).textTheme.bodyText2?.color,
                      fontSize: 16),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  quantity,
                  style: TextStyle(
                    color: cardColor != null
                        ? Colors.white
                        : Theme.of(context).textTheme.bodyText2?.color,
                    fontSize: 25,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: cardColor != null
                      ? Colors.white70
                      : Theme.of(context).iconTheme.color,
                  size: 14,
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
