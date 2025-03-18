// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../bloc/event/signup_event.dart';
import '../bloc/signup_bloc.dart';
import '../bloc/state/signup_state.dart';
import '../themes/colors.dart';

class DatePicker extends StatelessWidget {
  final TextEditingController dateOfBirthController;

  const DatePicker({
    super.key,
    required this.dateOfBirthController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: InkWell(
        onTap: () async {
          final selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (selectedDate != null) {
            final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);

            dateOfBirthController.text = formattedDate;

            context.read<SignUpBloc>().add(
                  DateOfBirthChanged(formattedDate),
                );
          }
        },
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
              final dateOfBirth = (state is SignUpFormUpdated)
                  ? state.dateOfBirth
                  : ''; 
              return Text(
                dateOfBirth.isEmpty ? 'Chọn ngày sinh' : dateOfBirth,
                style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 16,
                  color: AppColor.textPickerColor,
                  letterSpacing: 0.7,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
