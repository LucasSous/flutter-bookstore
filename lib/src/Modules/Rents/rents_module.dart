import 'package:flutter_bookstore2/src/Modules/Rents/View/Components/rent_form.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/View/Components/rents_details.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/View/rents_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RentsModlule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: ((context, args) => const RentsPage())),
        ChildRoute('/details',
            child: (context, args) => RentsDetail(rent: args.data),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 150)),
        ChildRoute('/form',
            child: (context, args) => RentForm(rent: args.data),
            transition: TransitionType.rightToLeft),
      ];
}
