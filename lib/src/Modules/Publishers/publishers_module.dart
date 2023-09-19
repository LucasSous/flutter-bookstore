import 'package:flutter_bookstore2/src/modules/publishers/controller/publisher_controller.dart';
import 'package:flutter_bookstore2/src/modules/publishers/view/publisher_form.dart';
import 'package:flutter_bookstore2/src/modules/publishers/view/publishers_filter.dart';
import 'package:flutter_bookstore2/src/modules/publishers/view/publishers_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PublishersModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => PublisherController(i(), i(), i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: ((context, args) => const PublishersPage()),
            transition: TransitionType.noTransition),
        ChildRoute('/form',
            child: (context, args) => PublisherForm(publisher: args.data),
            transition: TransitionType.rightToLeft),
        ChildRoute('/filter',
            child: (context, args) => const PublishersFilter(),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 150)),
      ];
}
