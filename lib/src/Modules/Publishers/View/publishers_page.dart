import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/components/add_button.dart';
import 'package:flutter_bookstore2/src/components/default_app_bar.dart';
import 'package:flutter_bookstore2/src/components/loading_page.dart';
import 'package:flutter_bookstore2/src/modules/publishers/controller/publisher_controller.dart';
import 'package:flutter_bookstore2/src/modules/publishers/view/components/publishers_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PublishersPage extends StatefulWidget {
  const PublishersPage({Key? key}) : super(key: key);

  @override
  State<PublishersPage> createState() => _PublishersPageState();
}

class _PublishersPageState extends State<PublishersPage> {
  final publisher = Modular.get<PublisherController>();

  @override
  void dispose() {
    Modular.dispose<PublisherController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Editoras',
        search: () {
          publisher.resetFilter();
          Modular.to.pushNamed('/publishers/filter');
        },
        border: true,
      ),
      body: Observer(builder: (_) {
        if (publisher.loading == true) {
          return const LoadingPage();
        } else if (publisher.publishers.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Nenhuma editora cadastrada'),
          );
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 80, left: 12, right: 12),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: publisher.publishers.length,
                  itemBuilder: (ctx, i) =>
                      PublishersList(publisher: publisher.publishers[i])),
            ),
          );
        }
      }),
      floatingActionButton: const AddButton(route: '/publishers/form'),
    );
  }
}
