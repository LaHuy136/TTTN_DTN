import 'package:doan_thanh_nien/bloc/event_bloc.dart';
import 'package:doan_thanh_nien/bloc/event/event_event.dart';
import 'package:doan_thanh_nien/bloc/state/event_state.dart';
import 'package:doan_thanh_nien/components/my_appbar.dart';
import 'package:doan_thanh_nien/components/my_activity_tile.dart';
import 'package:doan_thanh_nien/components/my_heading.dart';
import 'package:doan_thanh_nien/services/event_service.dart';
import 'package:doan_thanh_nien/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'activity_evidence_page.dart';
import 'package:intl/intl.dart'; 

class RegisteredActivitiesPage extends StatelessWidget {
  const RegisteredActivitiesPage({super.key});


  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _getToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return Scaffold(
            appBar: MyAppbar(
              onPressed: () => Navigator.pop(context),
              icon: Icons.arrow_back_ios_new,
            ),
            body: Center(
              child: Text(
                'Vui lòng đăng nhập để xem hoạt động đã đăng ký!',
                style: TextStyle(fontSize: 18, color: AppColor.textColor),
              ),
            ),
          );
        }

        final token = snapshot.data!;
        return BlocProvider(
          create: (context) =>
              EventBloc()..add(LoadRegisteredEvents(token)),
          child: Scaffold(
            appBar: MyAppbar(
              onPressed: () => Navigator.pop(context),
              icon: Icons.arrow_back_ios_new,
            ),
            body: BlocBuilder<EventBloc, EventState>(
              builder: (context, state) {
                if (state is EventLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is EventError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColor.textColor,
                      ),
                    ),
                  );
                }
                if (state is EventLoaded) {
                  final registeredEvents = state.registeredEvents ?? [];
                  if (registeredEvents.isEmpty) {
                    return Center(
                      child: Text(
                        'Bạn chưa đăng ký hoạt động nào!',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColor.textColor,
                        ),
                      ),
                    );
                  }
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
                                activity: event.toVolunteerActivity(),
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ActivityEvidencePage(
                                      name: event.name,
                                      date: DateFormat('dd/MM/yyyy')
                                          .format(event.date), // Chuyển DateTime thành String
                                      endDate: DateFormat('dd/MM/yyyy')
                                          .format(event.endDate), // Chuyển DateTime thành String
                                      score: event.score,
                                      eventType: event.eventType,
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
                return Center(
                  child: Text(
                    'Không có dữ liệu',
                    style: TextStyle(fontSize: 18, color: AppColor.textColor),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}