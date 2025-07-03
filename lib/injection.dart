import 'package:clean_architecture_rental_room/core/network/dio.dart';
import 'package:clean_architecture_rental_room/features/auth/data/datasources/local/auth_loacal_datasource.dart';
import 'package:clean_architecture_rental_room/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:clean_architecture_rental_room/features/auth/data/repositories/auth_repsitories_impl.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/repositories/auth_repositories.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auth_signout.dart';

import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auto_signin_auth.dart';

import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auth_signin.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auth_signup.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final sl = GetIt.instance;

Future initializeDependencies() async {
  var box = await Hive.openBox('access_token');
  var dio = Conn.dio;

  sl.registerLazySingleton(() => box);
  sl.registerLazySingleton(() => dio);

  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // ~ Bloc & Cubit
  sl.registerFactory(() => AuthBloc(sl(), sl(), sl(), sl()));

  // ~ Repository
  sl.registerLazySingleton<AuthRepositories>(
    () => AuthRepsitoriesImpl(sl(), sl()),
  );

  // ~ Usecases
  sl.registerLazySingleton(() => AuthSignup(sl()));
  sl.registerLazySingleton(() => AuthSignin(sl()));
  sl.registerLazySingleton(() => AutoSigninAuth(sl()));
  sl.registerLazySingleton(() => AuthSignout(sl()));

  // ~ DataSource
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => ImplAuthRemoteDatasource(sl()),
  );
  sl.registerLazySingleton<AuthLoacalDatasource>(
    () => AuthLoacalDatasourceImpl(sl()),
  );
}
