import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/modules/rents/controller/rent_controller.dart';
import 'package:flutter_bookstore2/src/modules/rents/view/components/rents_list.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class RentsFilter extends StatefulWidget {
  const RentsFilter({super.key});

  @override
  State<RentsFilter> createState() => _RentsFilterState();
}

class _RentsFilterState extends State<RentsFilter> {
  final TextEditingController _date = TextEditingController();
  final rent = Modular.get<RentController>();

  bool clickSearch = false;

  returns(RentController rent) {
    if (!clickSearch) {
      return Container();
    }
    if (clickSearch && rent.rentsFilter.isEmpty) {
      return Text('Nenhum reultado encontrado',
          style: TextStyle(color: Colors.grey.shade600));
    } else {
      return SingleChildScrollView(
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: rent.rentsFilter.length,
            itemBuilder: (ctx, i) => RentsList(rent: rent.rentsFilter[i])),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Flexible(
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    onChanged: (value) {},
                    controller: _date,
                    style: Theme.of(context).textTheme.bodyMedium,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "Pesquisar por data",
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.grey.shade600,
                      ),
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true, //<-- SEE HERE
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(4.0)),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    onTap: () async {
                      DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1999),
                        lastDate: DateTime(2100),
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: Theme.of(context).primaryColor,
                                onPrimary: Colors.white,
                                onSurface:
                                    Theme.of(context).colorScheme.onSurface,
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  foregroundColor: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.color,
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );

                      if (pickeddate != null) {
                        setState(() {
                          _date.text =
                              DateFormat('dd/MM/yyyy').format(pickeddate);
                        });
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  rent.filterRents(_date.text.toString());
                  setState(() {
                    clickSearch = true;
                  });
                },
                borderRadius: BorderRadius.circular(4),
                child: Ink(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(4)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          leadingWidth: 30,
          shape: Border(
            bottom: BorderSide(
                width: 1,
                color: Colors.grey.shade500,
                style: BorderStyle.solid),
          ),
        ),
        body:
            Padding(padding: const EdgeInsets.all(12.0), child: returns(rent)));
  }
}
