import 'package:flutter/material.dart';
import 'package:flutter_timerman/src/core/util.dart';
import 'package:flutter_timerman/src/features/event/domain/models/partner.dart';

class PartnerView extends StatelessWidget {
  const PartnerView({Key? key, required this.partner}) : super(key: key);

  final Partner partner;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      height: 137,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Container(
        //color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                //color: Colors.blue,
                width: 105,
                height: 105,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      //color: Colors.green,
                      padding: const EdgeInsets.only(top: 16),
                      //width: 150,
                      //height: 20,
                      child: Text(
                        partner.title,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      color: Colors.yellow,
                      //width: 200,
                      height: 30,
                      child: InkWell(
                        onTap: () {
                          print('Tap');
                        },
                        //splashColor: Colors.blue.withAlpha(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(Icons.ac_unit),
                            Text(l10n.visit_site),
                            const Spacer(),
                            const Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
