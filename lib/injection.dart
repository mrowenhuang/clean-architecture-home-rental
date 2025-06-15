import 'package:clean_architecture_rental_room/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:clean_architecture_rental_room/features/auth/data/repositories/auth_repsitories_impl.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/repositories/auth_repositories.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auth_get_credential.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auth_get_user.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auth_google_singin.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auth_signin.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auth_signup.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future initializeDependencies() async {
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // ~ Bloc & Cubit
  sl.registerFactory(() => AuthBloc(sl(), sl(), sl(), sl(), sl()));

  // ~ Repository
  sl.registerLazySingleton<AuthRepositories>(() => AuthRepsitoriesImpl(sl()));

  // ~ Usecases
  sl.registerLazySingleton(() => AuthSignup(sl()));
  sl.registerLazySingleton(() => AuthGetCredential(sl()));
  sl.registerLazySingleton(() => AuthSignin(sl()));
  sl.registerLazySingleton(() => AuthGetUser(sl()));
  sl.registerLazySingleton(() => AuthGoogleSingin(sl()));

  // ~ DataSource
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => ImplAuthRemoteDatasource(sl(), sl()),
  );
}
