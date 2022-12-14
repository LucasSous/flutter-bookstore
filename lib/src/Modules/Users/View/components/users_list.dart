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
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              color: Theme.of(context).shadowColor,
              offset: const Offset(0, 0))
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
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#${user.id}',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText2?.color,
                      fontSize: 16),
                ),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Text(
                    user.name,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18),
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
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Endere??o:',
                        ),
                        Text('${user.address}, ${user.city}',
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            )),
                        const Text(
                          'Email',
                        ),
                        Text(user.email,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ))
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Modular.to
                                .pushNamed('/users/user_form', arguments: user);
                          },
                          icon: const Icon(Icons.edit, size: 18)),
                      IconButton(
                          onPressed: () {
                            openDialog(
                                context: context,
                                title: 'Deletar Usu??rio',
                                message:
                                    'O usu??rio ${user.name} ser?? deletado!',
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
                          icon: const Icon(Icons.delete, size: 18))
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
