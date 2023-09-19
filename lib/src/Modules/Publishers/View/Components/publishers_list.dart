import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/components/button_icon.dart';
import 'package:flutter_bookstore2/src/components/dialog.dart';
import 'package:flutter_bookstore2/src/modules/publishers/controller/publisher_controller.dart';
import 'package:flutter_bookstore2/src/core/domain/models/publisher_model.dart';

import 'package:flutter_modular/flutter_modular.dart';

class PublishersList extends StatelessWidget {
  final PublisherModel publisher;
  const PublishersList({
    Key? key,
    required this.publisher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final publisherController = Modular.get<PublisherController>();
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              color: Theme.of(context).shadowColor,
              offset: const Offset(0, 0))
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
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#${publisher.id}',
                  style: const TextStyle(fontSize: 16),
                ),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Text(
                    publisher.name,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18),
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
                crossAxisAlignment: CrossAxisAlignment.end,
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
                      ButtonIcon(
                        onTap: () {
                          Modular.to.pushNamed('/publishers/form',
                              arguments: publisher);
                        },
                        icon: Icons.edit,
                      ),
                      const SizedBox(width: 10),
                      ButtonIcon(
                        onTap: () {
                          openDialog(
                              context: context,
                              title: 'Deletar Editora',
                              message:
                                  'A editora ${publisher.name} será deletada!',
                              confirm: () {
                                publisherController.deletePublisher(publisher);
                                Modular.to.pop();
                              });
                        },
                        icon: Icons.delete,
                        color: const Color(0xFFFF7E7E),
                      ),
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
