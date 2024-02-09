import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';
import 'package:tobeto_app/widgets/profile_screen/certificate_widget.dart';

class CertificatesSection extends StatelessWidget {
  const CertificatesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Theme.of(context).colorScheme.background,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sertifikalarım",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 2),
            BlocBuilder<UserDataBloc, UserDataState>(
              builder: (context, state) {
                if (state is UserDataLoaded) {
                  var certificates = state.userInfo!.certificates ?? [];
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: certificates.length,
                    itemBuilder: (context, index) {
                      var item = certificates[index];
                      return CertificateWidget(title: item.name ?? "");
                    },
                  );
                }
                return Text(
                  "Veriler alınamadı!!",
                  style: Theme.of(context).textTheme.bodySmall,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
