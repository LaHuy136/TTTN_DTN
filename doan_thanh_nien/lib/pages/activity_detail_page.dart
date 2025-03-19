// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import 'package:doan_thanh_nien/components/my_appbar.dart';
import 'package:doan_thanh_nien/components/my_button.dart';
import 'package:doan_thanh_nien/components/my_heading.dart';
import 'package:doan_thanh_nien/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/activity_bloc.dart';
import '../bloc/event/activity_event.dart';
import '../bloc/event/home_event.dart';
import '../bloc/home_bloc.dart';
import '../bloc/state/activity_state.dart';
import '../components/my_drawer.dart';
import '../helpers/volunteer_activities.dart';
import '../themes/colors.dart';
import 'activity_registered_page.dart';

class ActivityDetailPage extends StatefulWidget {
  final volunteerActivitiesCategory? category;
  final volunteerActivities activity;

  const ActivityDetailPage({
    super.key,
    this.category,
    required this.activity,
  });

  @override
  State<ActivityDetailPage> createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
  String selectedCategory = 'All';
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
      appBar: MyAppbar(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              selectedCategory: 'All',
            ),
          ),
        ),
        icon: Icons.arrow_back_ios_new,
      ),
      drawer: MyDrawer(
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
                      child: Image.asset(
                        state.imagePath,
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
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
                                  state.registrationEndDate,
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
                    MyButton(
                      text: 'Đăng ký',
                      onTap: () {
                        final activity = volunteerActivities(
                          name: state.name,
                          imagePath: state.imagePath,
                          registrationStartDate: state.registrationStartDate,
                          registrationEndDate: state.registrationEndDate,
                          date: state.date,
                          endDate: state.endDate,
                          location: state.location,
                          currentRegistrations: state.currentRegistrations,
                          maxRegistrations: state.maxRegistrations,
                          score: state.score,
                          eventType: state.eventType,
                          isRegistered: true,
                          category: widget.category ??
                              volunteerActivitiesCategory.another,
                        );

                        if (activity.daysUntilExpiry() < 0) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Sự kiện đã kết thúc ${activity.daysUntilExpiry().abs()} ngày trước."),
                            backgroundColor: AppColor.bgsnackBarColorFailure,
                            duration: const Duration(seconds: 2),
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Đăng ký Sự kiện thành công!"),
                            backgroundColor: AppColor.bgsnackBarColorSuccess,
                            duration: const Duration(seconds: 2),
                          ));
                          context.read<ActivityDetailBloc>().add(
                                RegisterActivity(activity: activity),
                              );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (conext) =>
                                  const RegisteredActivitiesPage(),
                            ),
                          );
                        }
                      },
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
