import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:zuba_karis/core/common_widget/custom_text_field_widget.dart';
import 'package:zuba_karis/core/constants/color_value.dart';
import 'package:zuba_karis/features/authentication/domain/repositories/auth_repository.dart';
import 'package:zuba_karis/features/authentication/presentation/manager/authentication_bloc.dart';
import 'package:zuba_karis/features/authentication/presentation/pages/register_page.dart';
import 'package:zuba_karis/features/home/screens/home_page.dart';
import 'package:zuba_karis/features/navigation/navigation_page.dart';

import '../../../../core/common_widget/dialog_loading_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(
            repository: RepositoryProvider.of<AuthRepository>(context)),
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is SuccesAuthenticationState) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const NavigationPage(),
                ),
              );
            }
            if (state is FailureAuthenticationState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.msg),
                ),
              );
            }
            if (state is LoadingAuthenticationState) {
              const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return SafeArea(
                  child: SingleChildScrollView(
                child: SizedBox(
                  height: 96.5.w,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/login_left_side.png',
                        fit: BoxFit.fill,
                        width: 55.h,
                        height: double.infinity,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 40.0),
                          child: Form(
                            key: key,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          'Selamat Datang,',
                                          style: GoogleFonts.roboto(
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                        Text(
                                          'Zuba Barista',
                                          style: GoogleFonts.roboto(
                                            fontSize: 15.sp,
                                            color: ColorValue.primary,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                CustomTextFieldWidget(
                                  controller: name,
                                  icon: Padding(
                                    padding: EdgeInsets.only(
                                      left: 10.sp,
                                      right: 6.sp,
                                      top: 5.sp,
                                      bottom: 5.sp,
                                    ),
                                    child: SvgPicture.asset(
                                        'assets/icons/icon_email.svg'),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  label: 'name',
                                  obsecure: false,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                CustomTextFieldWidget(
                                  controller: password,
                                  icon: Padding(
                                    padding: EdgeInsets.only(
                                      left: 10.sp,
                                      right: 6.sp,
                                      top: 5.sp,
                                      bottom: 5.sp,
                                    ),
                                    child: SvgPicture.asset(
                                        'assets/icons/icon_password.svg'),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  label: 'password',
                                  obsecure: true,
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (key.currentState!.validate()) {
                                      context.read<AuthenticationBloc>().add(
                                          PostLogin(name.text, password.text));
                                    }
                                  },
                                  child: const Text("Masuk"),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  child: Text('atau'),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(double.infinity, 22.sp),
                                      foregroundColor: ColorValue.primary,
                                      backgroundColor: Colors.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          side: const BorderSide(
                                            color: ColorValue.primary,
                                          )),
                                      textStyle: TextStyle(
                                        color: ColorValue.primary,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 8.sp,
                                      )),
                                  onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterPage(),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  child: const Text("Daftar"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
            },
          ),
        ),
      ),
    );
  }
}
