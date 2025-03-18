import 'package:doan_thanh_nien/bloc/activity_bloc.dart';
import 'package:doan_thanh_nien/components/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/state/activity_state.dart';
import '../components/my_activity_tile.dart';
import '../components/my_heading.dart';
import '../themes/colors.dart';
import 'activity_evidence_page.dart';

class RegisteredActivitiesPage extends StatelessWidget {
  const RegisteredActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        onPressed: () {},
        icon: Icons.arrow_back_ios_new,
      ),
      body: BlocBuilder<ActivityDetailBloc, ActivityDetailState>(
        builder: (context, state) {
          if (state.registeredEvents.isEmpty) {
            return Scaffold(
              body: Center(
                child: Text(
                  'Bạn chưa đăng ký hoạt động nào!',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColor.textColor,
                  ),
                ),
              ),
            );
          } if (state is ActivityDetailLoaded) {
            final registeredEvents = state.registeredEvents;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const MyHeading(text: 'Các hoạt động đã đăng ký'),
                  const SizedBox(height: 25),
                  Expanded(
                    child: ListView.builder(
                      itemCount: registeredEvents.length,
                      itemBuilder: (context, index) {
                        final event = registeredEvents[index];
                        return MyActivityTile(
                          icon: const Icon(Icons.read_more_outlined),
                          activity: event,
                          onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ActivityEvidencePage(
                                title: event.title,
                                day: event.day,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
