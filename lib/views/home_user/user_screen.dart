import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_apps_app/config/components/button/laporan_button.dart';
import 'package:mobile_apps_app/config/components/button/logout_button.dart';
import 'package:mobile_apps_app/repository/profile/get_user_byid_repository.dart';
import 'package:mobile_apps_app/services/session/session_controller.dart';
import 'package:mobile_apps_app/views/home_user/bloc/profile_bloc_bloc.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});

  final SessionController sessionController = SessionController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(
        repository: GetUserHttpApiRepository(),
        sessionController: sessionController,
      )..add(
          GetProfileEvent(sessionController.user.id),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is ProfileLoaded) {
              final profile = state.profile;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: Card(
                      color: Colors.yellow[200],
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hallo, ${profile.name}',
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Nomer Rumah: ${profile.house_number}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Saldo: ${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(profile.wallet?.balance ?? 0)}',
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 50),
                      // Kolom untuk tombol logout
                      Expanded(
                        child: Column(
                          children: [
                            LogoutButton(width: 80, height: 80),
                            SizedBox(height: 8),
                            Text('Logout', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Column(
                          children: [
                            LaporanButton(width: 80, height: 80),
                            SizedBox(height: 8),
                            Text('Laporan', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}
