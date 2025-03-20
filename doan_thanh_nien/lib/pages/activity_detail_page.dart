// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import 'package:doan_thanh_nien/components/my_appbar.dart';
import 'package:doan_thanh_nien/components/my_button.dart';
import 'package:doan_thanh_nien/components/my_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bloc/activity_bloc.dart';
import '../bloc/event/activity_event.dart';
import '../bloc/event/home_event.dart';
import '../bloc/home_bloc.dart';
import '../bloc/state/activity_state.dart';
import '../components/my_drawer.dart';
import '../helpers/volunteer_activities.dart';
import '../services/event_service.dart';
import '../themes/colors.dart';
import 'activity_registered_page.dart';

class ActivityDetailPage extends StatefulWidget {
  final volunteerActivities activity;

  const ActivityDetailPage({
    super.key,
    required this.activity,
  });

  @override
  State<ActivityDetailPage> createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
  String selectedCategory = 'All';
  final EventService _eventService = EventService();
  SharedPreferences? _prefs;
  bool _isRegistering = false;

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> _registerEvent() async {
    setState(() {
      _isRegistering = true;
    });

    try {
      String? token = _prefs?.getString('token');
      await _eventService.registerEvent(
          widget.activity.eventId, token.toString());

      if (!mounted) return;

      // Tạo bản sao mới của activity với trạng thái đã đăng ký
      final updatedActivity = widget.activity.copyWith(isRegistered: true);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Đăng ký Sự kiện thành công!"),
        backgroundColor: AppColor.bgsnackBarColorSuccess,
        duration: const Duration(seconds: 2),
      ));

      context.read<ActivityDetailBloc>().add(
            RegisterActivity(activity: updatedActivity),
          );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RegisteredActivitiesPage(),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: AppColor.bgsnackBarColorFailure,
        duration: const Duration(seconds: 2),
      ));
    } finally {
      if (mounted) {
        setState(() {
          _isRegistering = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    context.read<ActivityDetailBloc>().add(LoadActivityDetail(
          name: widget.activity.name,
          imagePath: widget.activity.imagePath,
          registrationStartDate: widget.activity.registrationStartDate,
          registrationEndDate: widget.activity.registrationEndDate,
          maxRegistrations: widget.activity.maxRegistrations,
          score: widget.activity.score,
          eventType: widget.activity.eventType,
          date: widget.activity.date,
          endDate: widget.activity.endDate,
          location: widget.activity.location,
          currentRegistrations: widget.activity.currentRegistrations,
        ));

    return Scaffold(
      appBar: MyAppbar(),
      endDrawer: MyDrawer(
        onSelectCategory: (category) {
          setState(() {
            selectedCategory = category;
          });
          context
              .read<HomeBloc>()
              .add(FetchActivitiesEvent(category: category));
        },
      ),
      body: BlocBuilder<ActivityDetailBloc, ActivityDetailState>(
        builder: (context, state) {
          if (state is ActivityDetailLoaded) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    MyHeading(text: state.name),
                    const SizedBox(height: 15),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        state.imagePath,
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: double.infinity,
                            height: 250,
                            color: Colors.grey[300],
                            child: const Icon(Icons.image_not_supported),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Current Register
                    Text(
                      'Số lượng sinh viên đăng ký hiện tại',
                      style: TextStyle(
                        color: AppColor.headingColor,
                        fontFamily: 'Poppins-Semibold',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: AppColor.textColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${state.currentRegistrations}',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    // Max Register
                    Text(
                      'Số lượng sinh viên đăng ký tối đa',
                      style: TextStyle(
                        color: AppColor.headingColor,
                        fontFamily: 'Poppins-Semibold',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: AppColor.textColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${state.maxRegistrations}',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Description
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mô tả',
                            style: TextStyle(
                              color: AppColor.headingColor,
                              fontFamily: 'Poppins-SemiBold',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, top: 4.0),
                            child: Row(
                              children: [
                                Text(
                                  'Thời gian đăng ký: ',
                                  style: TextStyle(
                                    color: AppColor.textColor,
                                    fontFamily: 'Poppins-Semibold',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  state.registrationStartDate,
                                  style: TextStyle(
                                    color: AppColor.textColor,
                                    fontFamily: 'Poppins-Medium',
                                  ),
                                ),
                                Text(
                                  " - ${state.registrationEndDate}",
                                  style: TextStyle(
                                    color: AppColor.textColor,
                                    fontFamily: 'Poppins-Medium',
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, top: 4.0),
                            child: Row(
                              children: [
                                Text(
                                  'Địa điểm: ',
                                  style: TextStyle(
                                    color: AppColor.textColor,
                                    fontFamily: 'Poppins-Semibold',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  state.location,
                                  style: TextStyle(
                                    color: AppColor.textColor,
                                    fontFamily: 'Poppins-Medium',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    if (!widget.activity.isRegistered)
                      MyButton(
                        text: _isRegistering ? 'Đang đăng ký...' : 'Đăng ký',
                        onTap: _isRegistering ? null : _registerEvent,
                      )
                    else
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Đã đăng ký',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontFamily: 'Poppins-Medium',
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
