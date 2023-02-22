import 'package:flutter_bookstore2/src/Modules/Users/View/user_form.dart';
import 'package:flutter_bookstore2/src/Modules/Users/View/users_filter.dart';
import 'package:flutter_bookstore2/src/Modules/Users/View/users_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UsersModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

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
