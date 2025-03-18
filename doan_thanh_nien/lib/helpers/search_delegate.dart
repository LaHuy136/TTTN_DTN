import 'package:flutter/material.dart';

import 'volunteer_activities.dart';
import '../pages/activity_detail_page.dart';
import '../themes/colors.dart';

class ActivitySearchDelegate extends SearchDelegate {
  final List<volunteerActivities> activities;
  final Function(String) onSearchChanged;

  ActivitySearchDelegate({
    required this.activities,
    required this.onSearchChanged,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: AppColor.drawerTileColor,
        ),
        onPressed: () {
          query = '';
          onSearchChanged(query);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: AppColor.drawerTileColor,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredActivities = activities.where((activity) {
      return activity.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: filteredActivities.length,
      itemBuilder: (context, index) {
        final activity = filteredActivities[index];
        return ListTile(
          title: Text(activity.title),
          titleTextStyle: TextStyle(
            color: AppColor.headingColor,
            fontFamily: 'OpenSans-Bold',
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          subtitle: Text(activity.day),
          subtitleTextStyle: TextStyle(
            color: AppColor.textColor,
            fontFamily: 'Poppins-Regular',
            fontSize: 12,
          ),
          leading: Image.asset(
            activity.imagePath,
            width: 80,
            height: 50,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ActivityDetailPage(activity: activity),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredActivities = activities.where((activity) {
      return activity.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: filteredActivities.length,
      itemBuilder: (context, index) {
        final activity = filteredActivities[index];
        return ListTile(
          title: Text(activity.title),
          titleTextStyle: TextStyle(
            color: AppColor.headingColor,
            fontFamily: 'OpenSans-Bold',
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          subtitle: Text(activity.day),
          subtitleTextStyle: TextStyle(
            color: AppColor.textColor,
            fontFamily: 'Poppins-Regular',
            fontSize: 12,
          ),
          leading: Image.asset(
            activity.imagePath,
            width: 80,
            height: 50,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ActivityDetailPage(activity: activity),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void showResults(BuildContext context) {
    onSearchChanged(query);
    super.showResults(context);
  }
}
