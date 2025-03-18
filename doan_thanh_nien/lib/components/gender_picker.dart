import 'package:doan_thanh_nien/bloc/event/signup_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/signup_bloc.dart';
import '../bloc/state/signup_state.dart';
import '../themes/colors.dart';

class GenderPicker extends StatelessWidget {
  final TextEditingController genderController;
  const GenderPicker({super.key, required this.genderController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: 180,
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
        decoration: BoxDecoration(
          color: AppColor.textFieldColor,
          border: Border.all(color: AppColor.bordertfColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            final gender = genderController.text.isEmpty
                ? 'Chọn giới tính'
                : genderController.text;
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: const Text(
                                'Nam',
                                textAlign: TextAlign.center,
                              ),
                              onTap: () {
                                genderController.text =
                                    'Nam'; 
                                context.read<SignUpBloc>().add(GenderChanged(
                                    genderController
                                        .text)); 
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: const Text(
                                'Nữ',
                                textAlign: TextAlign.center,
                              ),
                              onTap: () {
                                genderController.text =
                                    'Nữ'; 
                                context.read<SignUpBloc>().add(GenderChanged(
                                    genderController
                                        .text)); 
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: const Text(
                                'Khác',
                                textAlign: TextAlign.center,
                              ),
                              onTap: () {
                                genderController.text =
                                    'Khác'; 
                                context.read<SignUpBloc>().add(GenderChanged(
                                    genderController
                                        .text)); 
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  gender, 
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 16,
                    color: AppColor.textPickerColor,
                    letterSpacing: 0.7,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
