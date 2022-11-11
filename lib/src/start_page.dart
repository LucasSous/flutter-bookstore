import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Modules/Books/View/books_page.dart';
import 'package:flutter_bookstore2/src/Modules/Home/View/home_page.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/View/publishers_page.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/View/rents_page.dart';
import 'package:flutter_bookstore2/src/Modules/Users/View/users_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<StartPage> {
  int currentPage = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: currentPage);
  }

  setCurrentPage(page) {
    setState(() {
      currentPage = page;
    });
    pc.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        onPageChanged: setCurrentPage,
        children: const [
          HomePage(),
          UsersPage(),
          PublishersPage(),
          BooksPage(),
          RentsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        fixedColor: Theme.of(context).primaryColor,
        iconSize: 25,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined), label: 'Usuários'),
          BottomNavigationBarItem(
              icon: Icon(Icons.align_vertical_bottom_sharp), label: 'Editoras'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.book_outlined,
              ),
              label: 'Livros'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
              ),
              label: 'Aluguéis'),
        ],
        onTap: (page) {
          setCurrentPage(page);
        },
      ),
    );
  }
}
