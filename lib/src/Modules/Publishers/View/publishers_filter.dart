import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Components/app_bar_filter.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Controller/publisher_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/View/Components/publishers_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PublishersFilter extends StatelessWidget {
  const PublishersFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final publisher = Modular.get<PublisherController>();
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBarFilter(
            onChanged: (text) => publisher.filter(text.toString())),
        body: Padding(
            padding: const EdgeInsets.all(12.0), child: returns(publisher)),
      );
    });
  }

  Widget returns(PublisherController publisher) {
    if (publisher.isEmptyInput) {
      return Container();
    } else if (!publisher.isEmptyInput && publisher.publishersFilter.isEmpty) {
      return Text('Nenhum reultado encontrado',
          style: TextStyle(color: Colors.grey.shade600));
    } else {
      return SingleChildScrollView(
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: publisher.publishersFilter.length,
            itemBuilder: (ctx, i) =>
                PublishersList(publisher: publisher.publishersFilter[i])),
      );
    }
  }
}
