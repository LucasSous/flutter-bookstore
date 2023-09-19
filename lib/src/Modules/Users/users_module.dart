import 'package:flutter_bookstore2/src/modules/users/controller/user_controller.dart';
import 'package:flutter_bookstore2/src/modules/users/view/user_form.dart';
import 'package:flutter_bookstore2/src/modules/users/view/users_filter.dart';
import 'package:flutter_bookstore2/src/modules/users/view/users_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UsersModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => UserController(i(), i(), i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: ((context, args) => const UsersPage()),
            transition: TransitionType.noTransition),
        ChildRoute('/user_form',
            child: (context, args) => UserForm(user: args.data),
            transition: TransitionType.rightToLeft),
        ChildRoute('/users_filter',
            child: (context, args) => const UsersFilter(),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 150)),
      ];
}
