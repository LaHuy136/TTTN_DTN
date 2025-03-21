// ignore_for_file: use_build_context_synchronously

import 'package:doan_thanh_nien/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/event/update_event.dart';
import '../bloc/state/update_state.dart';
import '../bloc/update_bloc.dart';
import '../components/custom_snack_bar.dart';
import '../components/date_picker.dart';
import '../components/my_button.dart';
import '../components/my_heading.dart';
import '../components/my_sub_textfield.dart';
import '../components/my_textfield.dart';
import '../themes/colors.dart';

class UpdatePage extends StatelessWidget {
  final String? name;
  final String? phoneNumber;
  final String? dateOfBirth;
  final String? email;
  final String? studentId;

  const UpdatePage({
    super.key,
    this.name,
    this.phoneNumber,
    this.dateOfBirth,
    this.email,
    this.studentId,
  });

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: name ?? '');
    final phoneNumberController = TextEditingController(text: phoneNumber ?? '');
    final dateOfBirthController = TextEditingController(text: dateOfBirth ?? '');
    final emailController = TextEditingController(text: email ?? '');
    final studentIDController = TextEditingController(text: studentId ?? '');

    return BlocProvider(
      create: (context) => UpdateBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appBarColor,
          iconTheme: IconThemeData(
            color: AppColor.iconAppBarColor,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: BlocConsumer<UpdateBloc, UpdateState>(
              listener: (context, state) {
                if (state is UpdateSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 1),
                      backgroundColor: AppColor.bgsnackBarColorSuccess,
                      content: Text(
                        'Cập nhật thành công!',
                        style: TextStyle(
                          color: AppColor.textSnackBarColor,
                        ),
                      ),
                    ),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(selectedCategory: 'All'),
                    ),
                  );
                }

                if (state is UpdateFailure) {
                  CustomSnackBar.showSnackBar(
                    context,
                    state.errorMessage ?? "Lỗi không xác định",
                    AppColor.bgsnackBarColorFailure,
                    AppColor.textSnackBarColor,
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const MyHeading(text: 'Cập nhật tài khoản'),
                    const SizedBox(height: 25),
                    const MySubTextfield(text: 'Họ và tên'),
                    const SizedBox(height: 10),
                    MyTextfield(
                      controller: nameController,
                      hintText: 'Nguyễn Văn A',
                      obsecureText: false,
                    ),
                    const SizedBox(height: 15),
                    const MySubTextfield(text: 'Số điện thoại'),
                    MyTextfield(
                      controller: phoneNumberController,
                      hintText: '0000000000',
                      obsecureText: false,
                    ),
                    const SizedBox(height: 10),
                    const MySubTextfield(text: 'Ngày sinh'),
                    const SizedBox(height: 10),
                    DatePicker(dateOfBirthController: dateOfBirthController),
                    const SizedBox(height: 15),
                    const MySubTextfield(text: 'Email'),
                    const SizedBox(height: 10),
                    MyTextfield(
                      controller: emailController,
                      hintText: 'example@gmail.com',
                      obsecureText: false,
                    ),
                    const SizedBox(height: 15),
                    const MySubTextfield(text: 'Mã sinh viên'),
                    const SizedBox(height: 10),
                    MyTextfield(
                      controller: studentIDController,
                      hintText: '102210xxxxx',
                      obsecureText: false,
                    ),
                    const SizedBox(height: 35),
                    MyButton(
                      onTap: () {
                        context.read<UpdateBloc>().add(UpdateUserDataEvent(
                          name: nameController.text,
                          phoneNumber: phoneNumberController.text,
                          dateOfBirth: dateOfBirthController.text,
                          email: emailController.text,
                          studentId: studentIDController.text,
                        ));
                      },
                      text: 'Xác nhận',
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
