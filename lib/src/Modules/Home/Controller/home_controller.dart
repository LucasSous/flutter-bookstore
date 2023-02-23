import 'package:flutter_bookstore2/src/Modules/Rents/Controller/rent_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Model/rent_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final _rentController = Modular.get<RentController>();

  @observable
  int inProgress = 0;

  @observable
  int late = 0;

  @observable
  int onTime = 0;

  @observable
  int pending = 0;

  @action
  setValues() async {
    await _rentController.getAllRents();
    List<Rent> noNullDate = _rentController.rents.map((e) {
      e.returnDate ??= 'in progress';
      return e;
    }).toList();
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);
    DateTime currentDate = DateTime.parse(formatted);
    noNullDate
        .map((rent) => {
              if (rent.returnDate.toString() == 'in progress' &&
                  DateTime.parse(rent.forecastDate).compareTo(currentDate) >= 0)
                {inProgress += 1},
              if (rent.returnDate.toString() == 'in progress' &&
                  DateTime.parse(rent.forecastDate).compareTo(currentDate) < 0)
                {pending += 1},
              if (rent.returnDate.toString() != 'in progress' &&
                  DateTime.parse(rent.returnDate)
                          .compareTo(DateTime.parse(rent.forecastDate)) <=
                      0)
                {onTime += 1},
              if (rent.returnDate.toString() != 'in progress' &&
                  DateTime.parse(rent.returnDate)
                          .compareTo(DateTime.parse(rent.forecastDate)) >
                      0)
                {late += 1},
            })
        .toList();
  }
}
