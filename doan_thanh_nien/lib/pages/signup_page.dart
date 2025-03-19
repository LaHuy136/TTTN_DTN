// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doan_thanh_nien/components/my_button.dart';
import 'package:doan_thanh_nien/components/my_sub_textfield.dart';
import 'package:doan_thanh_nien/components/my_textfield.dart';
import '../bloc/event/signup_event.dart';
import '../bloc/state/signup_state.dart';
import '../components/date_picker.dart';
import '../components/my_heading.dart';
import '../bloc/signup_bloc.dart';
import '../themes/colors.dart';
import 'login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _studentIdController = TextEditingController();
  final _addressController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _retypePasswordController = TextEditingController();
  final _classIdController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _studentIdController.dispose();
    _addressController.dispose();
    _dateOfBirthController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _retypePasswordController.dispose();
    _classIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: Scaffold(
        body: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {},
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    const MyHeading(text: 'Tạo tài khoản'),
                    const SizedBox(height: 15),
                    BlocBuilder<SignUpBloc, SignUpState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MySubTextfield(text: 'Họ và tên'),
                            const SizedBox(height: 10),
                            MyTextfield(
                              controller: _fullNameController,
                              onChanged: (value) {
                                context
                                    .read<SignUpBloc>()
                                    .add(FullNameChanged(value));
                              },
                              hintText: 'Nguyễn Văn A',
                              obsecureText: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Vui lòng nhập họ và tên';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            const MySubTextfield(text: 'Số điện thoại'),
                            const SizedBox(height: 10),
                            MyTextfield(
                              controller: _phoneNumberController,
                              onChanged: (value) {
                                context
                                    .read<SignUpBloc>()
                                    .add(PhoneNumberChanged(value));
                              },
                              hintText: '0123456789',
                              obsecureText: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Vui lòng nhập số điện thoại';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            const MySubTextfield(text: 'Mã sinh viên'),
                            const SizedBox(height: 10),
                            MyTextfield(
                              controller: _studentIdController,
                              onChanged: (value) {
                                context
                                    .read<SignUpBloc>()
                                    .add(StudentIdChanged(value));
                              },
                              hintText: '10221xxxx',
                              obsecureText: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Vui lòng nhập mã sinh viên';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            const MySubTextfield(text: 'Địa chỉ'),
                            const SizedBox(height: 10),
                            MyTextfield(
                              controller: _addressController,
                              onChanged: (value) {
                                context
                                    .read<SignUpBloc>()
                                    .add(AddressChanged(value));
                              },
                              hintText: 'Nhập địa chỉ của bạn',
                              obsecureText: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Vui lòng nhập địa chỉ';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            const MySubTextfield(text: 'Ngày sinh'),
                            const SizedBox(height: 10),
                            DatePicker(
                                dateOfBirthController: _dateOfBirthController),
                            const SizedBox(height: 15),
                            const MySubTextfield(text: 'Email'),
                            const SizedBox(height: 10),
                            MyTextfield(
                              controller: _emailController,
                              onChanged: (value) {
                                context
                                    .read<SignUpBloc>()
                                    .add(EmailChanged(value));
                              },
                              hintText: 'example@email.com',
                              obsecureText: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Vui lòng nhập email';
                                }
                                if (!value.contains('@')) {
                                  return 'Email không hợp lệ';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            const MySubTextfield(text: 'Tên đăng nhập'),
                            const SizedBox(height: 10),
                            MyTextfield(
                              controller: _usernameController,
                              onChanged: (value) {
                                context
                                    .read<SignUpBloc>()
                                    .add(UsernameChanged(value));
                              },
                              hintText: 'username',
                              obsecureText: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Vui lòng nhập tên đăng nhập';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            const MySubTextfield(text: 'Mật khẩu'),
                            const SizedBox(height: 10),
                            MyTextfield(
                              controller: _passwordController,
                              onChanged: (value) {
                                context
                                    .read<SignUpBloc>()
                                    .add(PasswordChanged(value));
                              },
                              hintText: '******',
                              obsecureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Vui lòng nhập mật khẩu';
                                }
                                if (value.length < 6) {
                                  return 'Mật khẩu phải có ít nhất 6 ký tự';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            const MySubTextfield(text: 'Xác nhận mật khẩu'),
                            const SizedBox(height: 10),
                            MyTextfield(
                              controller: _retypePasswordController,
                              onChanged: (value) {
                                context
                                    .read<SignUpBloc>()
                                    .add(RetypePasswordChanged(value));
                              },
                              hintText: '******',
                              obsecureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Vui lòng xác nhận mật khẩu';
                                }
                                if (value != _passwordController.text) {
                                  return 'Mật khẩu xác nhận không khớp';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            const MySubTextfield(text: 'Mã lớp'),
                            const SizedBox(height: 10),
                            MyTextfield(
                              controller: _classIdController,
                              onChanged: (value) {
                                context
                                    .read<SignUpBloc>()
                                    .add(ClassIdChanged(value));
                              },
                              hintText: 'Nhập mã lớp',
                              obsecureText: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Vui lòng nhập mã lớp';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 25),
                            MyButton(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  context
                                      .read<SignUpBloc>()
                                      .add(SignUpSubmitted());
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: const Text('Đăng ký thành công'),
                                    backgroundColor:
                                        AppColor.bgsnackBarColorSuccess,
                                    duration: const Duration(seconds: 2),
                                  ));
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                }
                              },
                              text: state.isLoading
                                  ? 'Đang tạo tài khoản...'
                                  : 'Tạo tài khoản',
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
