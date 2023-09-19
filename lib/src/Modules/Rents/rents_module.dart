import 'package:flutter_bookstore2/src/modules/rents/controller/rent_controller.dart';
import 'package:flutter_bookstore2/src/modules/rents/view/components/rent_form.dart';
import 'package:flutter_bookstore2/src/modules/rents/view/components/rents_details.dart';
import 'package:flutter_bookstore2/src/modules/rents/view/components/rents_filter.dart';
import 'package:flutter_bookstore2/src/modules/rents/view/rents_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RentsModlule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => RentController(i(), i(), i(), i(), i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: ((context, args) => const RentsPage()),
            transition: TransitionType.noTransition),
        ChildRoute('/details',
            child: (context, args) => RentsDetail(rent: args.data),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 150)),
        ChildRoute('/form',
            child: (context, args) => RentForm(rent: args.data),
            transition: TransitionType.rightToLeft),
        ChildRoute('/filter',
            child: (context, args) => const RentsFilter(),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 150)),
      ];
}
