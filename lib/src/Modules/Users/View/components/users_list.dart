import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Components/dialog.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Controller/user_controller.dart';

import 'package:flutter_bookstore2/src/Modules/Users/Model/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UsersList extends StatelessWidget {
  final User user;
  const UsersList({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Modular.get<UserController>();
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            spreadRadius: 0.1,
            blurRadius: 4,
            color: Colors.black26,
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          left: BorderSide(
              width: 2,
              color: Theme.of(context).primaryColor,
              style: BorderStyle.solid),
        )),
        child: ExpansionTile(
          iconColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#${user.id}',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                ),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Text(
                    user.name,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(9.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Endereço:'),
                      Text('${user.address}, ${user.city}',
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                      const Text('Email'),
                      Text(user.email,
                          style: const TextStyle(fontWeight: FontWeight.w500))
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Modular.to.pushNamed('/user_form', arguments: user);
                          },
                          icon: const Icon(Icons.edit,
                              size: 18, color: Colors.grey)),
                      IconButton(
                          onPressed: () {
                            openDialog(
                                context: context,
                                title: 'Deletar Usuário',
                                message:
                                    'O usuário ${user.name} será deletado!',
                                confirm: () {
                                  userController.deleteUser(User(
                                    id: user.id,
                                    name: user.name,
                                    address: user.address,
                                    city: user.city,
                                    email: user.email,
                                  ));
                                  Modular.to.pop();
                                });
                          },
                          icon: const Icon(Icons.delete,
                              size: 18, color: Colors.grey))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
