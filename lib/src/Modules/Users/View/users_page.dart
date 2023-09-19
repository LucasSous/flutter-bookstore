import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/components/add_button.dart';
import 'package:flutter_bookstore2/src/components/default_app_bar.dart';
import 'package:flutter_bookstore2/src/components/loading_page.dart';
import 'package:flutter_bookstore2/src/modules/users/controller/user_controller.dart';
import 'package:flutter_bookstore2/src/modules/users/view/components/users_list.dart';
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
  void dispose() {
    Modular.dispose<UserController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
          title: 'Usuários',
          border: true,
          search: () => {
                userController.resetFilter(),
                Modular.to.pushNamed('/users/users_filter')
              }),
      body: Observer(builder: (_) {
        if (userController.loading == true) {
          return const LoadingPage();
        } else if (userController.users.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Nenhum usuário cadastrado'),
          );
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 80, left: 12, right: 12),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: userController.users.length,
                  itemBuilder: (ctx, i) =>
                      UsersList(user: userController.users[i])),
            ),
          );
        }
      }),
      floatingActionButton: const AddButton(route: '/users/user_form'),
    );
  }
}
