import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:zuba_karis/common_widget/dialog_loading_widget.dart';
import 'package:zuba_karis/features/authentication/domain/repositories/auth_repository.dart';
import 'package:zuba_karis/features/authentication/presentation/manager/authentication_bloc.dart';
import 'package:zuba_karis/features/authentication/presentation/pages/register_page.dart';
import 'package:zuba_karis/features/home/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
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
                  builder: (context) => const HomePage(),
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
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const DialogLoadingWidget(),
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Login',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 16.sp),
                        ),
                        TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'email',
                          ),
                        ),
                        TextFormField(
                          controller: password,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              context
                                  .read<AuthenticationBloc>()
                                  .add(Login(email.text, password.text));
                            }
                          },
                          child: const Text("Login"),
                        ),
                        const Text('atau'),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                          child: const Text("Register"),
                        ),
                      ],
                    ),
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
