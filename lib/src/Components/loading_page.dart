import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: ((context, index) => Shimmer.fromColors(
                  baseColor: Theme.of(context).cardColor,
                  highlightColor: Theme.of(context).cardColor,
                  child: Container(
                    margin: const EdgeInsets.only(top: 7),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(5)),
                    height: 70,
                    width: double.infinity,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
