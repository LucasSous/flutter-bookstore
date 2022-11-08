import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Components/dialog.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Controller/publisher_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Model/publisher_model.dart';

import 'package:flutter_modular/flutter_modular.dart';

class PublishersList extends StatelessWidget {
  final Publisher publisher;
  const PublishersList({
    Key? key,
    required this.publisher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final publisherController = Modular.get<PublisherController>();
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            spreadRadius: 0.1,
            blurRadius: 4,
            color: Colors.black26,
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          left: BorderSide(
              width: 2,
              color: Theme.of(context).primaryColor,
              style: BorderStyle.solid),
        )),
        child: ExpansionTile(
          iconColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#${publisher.id}',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                ),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Text(
                    publisher.name,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                )
              ],
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(9.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Cidade'),
                        Text(publisher.city,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16))
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Modular.to.pushNamed('/publishers/form',
                                arguments: publisher);
                          },
                          icon: const Icon(Icons.edit,
                              size: 18, color: Colors.grey)),
                      IconButton(
                          onPressed: () {
                            openDialog(
                                context: context,
                                title: 'Deletar Editora',
                                message:
                                    'A editora ${publisher.name} será deletada!',
                                confirm: () {
                                  publisherController.deletePublisher(Publisher(
                                      id: publisher.id,
                                      name: publisher.name,
                                      city: publisher.city));
                                  Modular.to.pop();
                                });
                          },
                          icon: const Icon(Icons.delete,
                              size: 18, color: Colors.grey))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
