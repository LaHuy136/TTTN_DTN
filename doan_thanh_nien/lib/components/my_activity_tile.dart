import 'package:doan_thanh_nien/helpers/volunteer_activities.dart';
import 'package:flutter/material.dart';

import '../themes/colors.dart';

class MyActivityTile extends StatelessWidget {
  final volunteerActivities activity;
  final Icon? icon;
  final VoidCallback onTap;
  const MyActivityTile({
    super.key,
    required this.activity,
    this.icon,
    required this.onTap,
    // required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // name image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  activity.imagePath,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey[300],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_not_supported,
                            size: 50,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Không thể tải ảnh',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              // name
              Text(
                activity.name,
                style: TextStyle(
                  color: AppColor.headingColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins-Medium',
                ),
              ),
      
              const SizedBox(height: 4),
      
              // date
              Row(
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    color: AppColor.textColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    activity.date,
                    style: TextStyle(
                      letterSpacing: 0.4,
                      fontSize: 14,
                      color: AppColor.textColor,
                      fontFamily: 'Roboto-Regular',
                    ),
                  ),
                   Text(
                    " - ${activity.endDate}",
                    style: TextStyle(
                      letterSpacing: 0.4,
                      fontSize: 14,
                      color: AppColor.textColor,
                      fontFamily: 'Roboto-Regular',
                    ),
                  ),
                ],
              ),
      
              // location
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColor.textColor,
                      ),
                      Text(
                        activity.location,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColor.textColor,
                          fontFamily: 'Roboto-Regular',
                        ),
                      ),
                    ],
                  ),
      
                  // details button
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: AppColor.textColor,
                      ),
                      child: IconButton(
                        onPressed: onTap,
                        icon: icon ?? const Icon(Icons.add_rounded),
                        color: AppColor.bgColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
