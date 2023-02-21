import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Components/default_title.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  itemStyle(label, IconData icon, route) {
    return GestureDetector(
      onTap: () => {Modular.to.navigate(route)},
      child: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(icon),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    label,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Colors.grey.shade700,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const DefaultTitle(text: 'Menu'),
            const SizedBox(height: 30),
            itemStyle('Dashboard', Icons.dashboard_outlined, '/home'),
            const Divider(),
            itemStyle('Usuários', Icons.people_alt_outlined, '/users/'),
            const Divider(),
            itemStyle(
                'Editoras', Icons.align_vertical_bottom_sharp, '/publishers/'),
            const Divider(),
            itemStyle('Livros', Icons.book_outlined, '/books/'),
            const Divider(),
            itemStyle('Aluguéis', Icons.calendar_today, '/rents/'),
          ]),
        ));
  }
}
