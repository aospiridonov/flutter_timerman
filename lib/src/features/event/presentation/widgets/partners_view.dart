import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timerman/src/features/event/domain/bloc/partners_bloc.dart';
import 'package:flutter_timerman/src/features/event/presentation/widgets/partner_view.dart';

class PartnersView extends StatelessWidget {
  const PartnersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PartnersBloc, PartnersState>(
      builder: (context, state) {
        if (state is PartnersStateLoading) {
          return const CircularProgressIndicator();
        }

        if (state is PartnersStateSuccess) {
          final partners = state.partners;
          return Wrap(
            spacing: 20,
            runSpacing: 20,
            children: partners.map((partner) {
              return PartnerView(partner: partner);
            }).toList(),
          );

          return ListView.separated(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 16,
            ),
            itemBuilder: (context, index) =>
                PartnerView(partner: partners[index]),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 10),
            itemCount: partners.length,
          );
        }

        return Container();
      },
    );
  }
}
