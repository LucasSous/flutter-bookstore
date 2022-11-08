import 'package:flutter_bookstore2/src/Modules/Publishers/View/publisher_form.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/View/publishers_filter.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/View/publishers_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PublishersModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: ((context, args) => const PublishersPage())),
        ChildRoute('/form',
            child: (context, args) => PublisherForm(publisher: args.data),
            transition: TransitionType.rightToLeft),
        ChildRoute('/filter',
            child: (context, args) => const PublishersFilter(),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 150)),
      ];
}
