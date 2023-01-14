import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:zuba_karis/constants/app_theme_data.dart';
import 'package:zuba_karis/constants/bloc_observer.dart';
import 'package:zuba_karis/features/authentication/data/data_sources/auth_remote_datasource.dart';
import 'package:zuba_karis/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:zuba_karis/features/authentication/domain/repositories/auth_repository.dart';
import 'package:zuba_karis/features/authentication/presentation/manager/authentication_bloc.dart';
import 'package:zuba_karis/firebase/auth.dart';

import 'features/splash/splash_page.dart';
import 'network_info/network_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (_) => Connectivity(),
          ),
          RepositoryProvider<NetworkInfo>(
            create: (context) => NetworkInfoImpl(
              RepositoryProvider.of<Connectivity>(context),
            ),
          ),
          RepositoryProvider<AuthRemoteDataSource>(
            create: (context) => AuthRemoteDataSourceImpl(
              Auth(),
            ),
          ),
          RepositoryProvider<AuthRepository>(
            create: (context) => AuthRepositoryImpl(
              networkInfo: RepositoryProvider.of<NetworkInfo>(context),
              dataSource: RepositoryProvider.of<AuthRemoteDataSource>(context)
            ),
          ),

        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemeData.getTheme(context),
          home: const SplashPage(),
        ),
      );
    });
  }
}
