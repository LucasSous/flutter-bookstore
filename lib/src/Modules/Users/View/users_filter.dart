import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/components/app_bar_filter.dart';
import 'package:flutter_bookstore2/src/modules/users/controller/user_controller.dart';
import 'package:flutter_bookstore2/src/modules/users/view/components/users_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UsersFilter extends StatelessWidget {
  const UsersFilter({Key? key}) : super(key: key);

  returns(UserController user) {
    if (user.isEmptyInput) {
      return Container();
    } else if (!user.isEmptyInput && user.usersFilter.isEmpty) {
      return Text('Nenhum reultado encontrado',
          style: TextStyle(color: Colors.grey.shade600));
    } else {
      return SingleChildScrollView(
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: user.usersFilter.length,
            itemBuilder: (ctx, i) => UsersList(user: user.usersFilter[i])),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userController = Modular.get<UserController>();
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBarFilter(
            onChanged: (text) => userController.filter(text.toString())),
        body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: returns(userController)),
      );
    });
  }
}
