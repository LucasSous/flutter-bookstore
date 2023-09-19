import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/components/button_icon.dart';
import 'package:flutter_bookstore2/src/components/dialog.dart';
import 'package:flutter_bookstore2/src/modules/users/controller/user_controller.dart';
import 'package:flutter_bookstore2/src/core/domain/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UsersList extends StatelessWidget {
  final UserModel user;
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
                      color: Theme.of(context).textTheme.bodyMedium?.color,
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Endereço:',
                        ),
                        Text('${user.address}, ${user.city}',
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            )),
                        const SizedBox(height: 10),
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
                      ButtonIcon(
                        onTap: () {
                          Modular.to
                              .pushNamed('/users/user_form', arguments: user);
                        },
                        icon: Icons.edit,
                      ),
                      const SizedBox(width: 10),
                      ButtonIcon(
                        onTap: () {
                          openDialog(
                              context: context,
                              title: 'Deletar Usuário',
                              message: 'O usuário ${user.name} será deletado!',
                              confirm: () {
                                userController.deleteUser(user);
                                Modular.to.pop();
                              });
                        },
                        icon: Icons.delete,
                        color: const Color(0xFFFF7E7E),
                      ),
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
