import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:zuba_karis/features/authentication/domain/repositories/auth_repository.dart';
import 'package:zuba_karis/features/authentication/presentation/manager/authentication_bloc.dart';
import 'package:zuba_karis/features/navigation/navigation_page.dart';

import '../../../../core/common_widget/custom_text_field_widget.dart';
import '../../../../core/common_widget/dialog_loading_widget.dart';
import '../../../home/screens/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register Page",
          style: TextStyle(fontSize: 10.sp),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
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
                child: Center(
              child: Container(
                width: 60.w,
                height: 50.h,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(5, 0),
                        blurRadius: 7)
                  ],
                ),
                child: Form(
                  key: key,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Register',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 16.sp),
                        ),
                      ),
                      CustomTextFieldWidget(
                        controller: nameController,
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
                        height: 20,
                      ),
                      CustomTextFieldWidget(
                        controller: passController,
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
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            context.read<AuthenticationBloc>().add(PostRegister(
                                  nameController.text,
                                  passController.text,
                                ));
                          }
                        },
                        child: const Text("Register"),
                      ),
                    ],
                  ),
                ),
              ),
            ));
          }),
        ),
      ),
    );
  }
}
