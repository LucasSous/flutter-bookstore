import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final String quantity;
  final Color? cardColor;
  final String route;
  const ItemCard(
      {super.key,
      required this.name,
      required this.icon,
      required this.quantity,
      required this.route,
      this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => {Modular.to.navigate(route)},
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          decoration: BoxDecoration(
            color: cardColor ?? Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                blurRadius: 20,
                offset: const Offset(0, 0), // Shadow position
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
                        : Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        color: cardColor != null
                            ? Colors.white
                            : Theme.of(context).textTheme.bodyMedium?.color,
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
                          : Theme.of(context).textTheme.bodyMedium?.color,
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
      ),
    );
  }
}
