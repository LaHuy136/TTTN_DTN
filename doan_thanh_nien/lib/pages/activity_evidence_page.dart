// ignore_for_file: sized_box_for_whitespace, library_private_types_in_public_api

import 'package:doan_thanh_nien/components/my_appbar.dart';
import 'package:doan_thanh_nien/components/my_heading.dart';
import 'package:doan_thanh_nien/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../themes/colors.dart';

class ActivityEvidencePage extends StatefulWidget {
  final String name;
  final String date;
  final String endDate;
  final String eventType;
  final int score;
  const ActivityEvidencePage({
    super.key,
    required this.name,
    required this.date,
    required this.endDate,
    required this.eventType,
    required this.score,
  });

  @override
  _ActivityEvidencePageState createState() => _ActivityEvidencePageState();
}

class _ActivityEvidencePageState extends State<ActivityEvidencePage> {
  // File? _image;

  // Future<void> _pickImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? pickedFile =
  //       await picker.pickImage(source: ImageSource.gallery);

  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final startDate =
        dateFormat.parse(widget.date.replaceAll(' - ', '').trim());
    final endDate = dateFormat.parse(widget.endDate);
    final volunteerDays = endDate.difference(startDate).inDays + 1;
    return Scaffold(
      appBar: MyAppbar(
        icon: Icons.arrow_back_ios_new,
        onPressed: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(
              selectedCategory: 'All',
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyHeading(text: widget.name),
            const SizedBox(height: 15),
            Text(
              'Thời gian tình nguyện',
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                fontSize: 16,
                color: AppColor.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: AppColor.textColor,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$volunteerDays',
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Ngày',
                style: TextStyle(
                    color: AppColor.bgButtonColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Mô tả chi tiết',
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                fontSize: 16,
                color: AppColor.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Score
            Row(
              children: [
                Icon(
                  Icons.star_half_outlined,
                  color: AppColor.textColor,
                ),
                const SizedBox(width: 4),
                Text(
                  "Điểm của hoạt động: ${widget.score} điểm",
                  style: TextStyle(
                    letterSpacing: 0.4,
                    fontSize: 14,
                    color: AppColor.textColor,
                    fontFamily: 'Roboto-Regular',
                  ),
                ),
              ],
            ),
            // Event Type
            Row(
              children: [
                Icon(
                  Icons.featured_play_list_outlined,
                  color: AppColor.textColor,
                ),
                const SizedBox(width: 4),
                Text(
                  "Đặc điểm: ${widget.eventType}",
                  style: TextStyle(
                    letterSpacing: 0.4,
                    fontSize: 14,
                    color: AppColor.textColor,
                    fontFamily: 'Roboto-Regular',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Evidence Images
            // Text(
            //   'Minh chứng',
            //   style: TextStyle(
            //     color: AppColor.textColor,
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // if (_image != null)
            //   Image.file(
            //     _image!,
            //     width: double.infinity,
            //     height: 200,
            //     fit: BoxFit.cover,
            //   ),
            // const SizedBox(height: 25),
            // Center(
            //   child: Container(
            //     decoration:
            //         BoxDecoration(borderRadius: BorderRadius.circular(25)),
            //     width: double.infinity,
            //     height: 250,
            //     child: ElevatedButton(
            //       onPressed: _pickImage,
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Icon(
            //             Icons.file_upload_outlined,
            //             size: 35,
            //             color: AppColor.textColor,
            //             weight: 5.0,
            //           ),
            //           const SizedBox(height: 10),
            //           Text(
            //             'Tải lên',
            //             style: TextStyle(
            //               fontFamily: 'Poppins-SemiBold',
            //               fontSize: 18,
            //               color: AppColor.textColor,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
