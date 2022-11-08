import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Components/default_title.dart';
import 'package:flutter_bookstore2/src/Components/loading_page.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Controller/publisher_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/View/Components/publishers_list.dart';
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
    super.dispose();
    Modular.dispose<PublisherController>();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        name: 'observerPublisherPage',
        builder: (_) {
          if (publisher.loading == true) {
            return const LoadingPage();
          } else {
            return Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              appBar: AppBar(
                title: const DefaultTitle(text: 'Editoras'),
                elevation: 1.0,
                backgroundColor: Colors.white,
                shape: Border(
                  bottom: BorderSide(
                      width: 1,
                      color: Colors.grey.shade500,
                      style: BorderStyle.solid),
                ),
                actions: <Widget>[
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            publisher.resetFilter();
                            Modular.to.pushNamed('/publishers/filter');
                          },
                          icon: const Icon(Icons.search),
                          color: Colors.black),
                      IconButton(
                          onPressed: () {
                            Modular.to.pushNamed('/publishers/form');
                          },
                          icon: const Icon(Icons.add),
                          color: Colors.black)
                    ],
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: publisher.publishers.length,
                      itemBuilder: (ctx, i) =>
                          PublishersList(publisher: publisher.publishers[i])),
                ),
              ),
            );
          }
        });
  }
}
