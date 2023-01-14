import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:zuba_karis/features/authentication/domain/repositories/auth_repository.dart';
import 'package:zuba_karis/features/authentication/presentation/manager/authentication_bloc.dart';
import 'package:zuba_karis/features/authentication/presentation/pages/login_page.dart';
import 'package:zuba_karis/features/home/screens/home_page.dart';

import '../../constants/color_value.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValue.primary,
      body: BlocProvider(
        create: (context) => AuthenticationBloc(
          repository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is SuccesAuthenticationState) {
              Future.delayed(
                const Duration(milliseconds: 2000),
                () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                ),
              );
            }
            if (state is FailureAuthenticationState) {
              Future.delayed(
                const Duration(milliseconds: 2000),
                () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                ),
              );
            }
          },
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is InitialAuthenticationState) {
                context.read<AuthenticationBloc>().add(const CheckAuth('auth'));
              }
              return SafeArea(
                child: Center(
                  child: Text(
                    'Zuba kasir',
                    style: GoogleFonts.reenieBeanie(
                        fontWeight: FontWeight.w500,
                        fontSize: 64.sp,
                        color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
