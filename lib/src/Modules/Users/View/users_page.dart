import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Components/default_title.dart';
import 'package:flutter_bookstore2/src/Components/loading_page.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Controller/user_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Users/View/components/users_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final userController = Modular.get<UserController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
        name: 'observerUserPage',
        builder: (_) {
          if (userController.loading == true) {
            return const LoadingPage();
          } else {
            return Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              appBar: AppBar(
                title: const DefaultTitle(text: 'Usuários'),
                elevation: 1.0,
                backgroundColor: Colors.white,
                leading: IconButton(
                  onPressed: () {
                    Modular.to.pushNamed('/menu');
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
                shape: Border(
                  bottom: BorderSide(
                      width: 1,
                      color: Colors.grey.shade500,
                      style: BorderStyle.solid),
                ),
                actions: <Widget>[
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            userController.resetFilter();
                            Modular.to.pushNamed('/users/users_filter');
                          },
                          icon: const Icon(Icons.search),
                          color: Colors.black),
                      IconButton(
                          onPressed: () {
                            Modular.to.pushNamed('/users/user_form');
                          },
                          icon: const Icon(Icons.add),
                          color: Colors.black)
                    ],
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: userController.users.length,
                      itemBuilder: (ctx, i) =>
                          UsersList(user: userController.users[i])),
                ),
              ),
            );
          }
        });
  }
}
