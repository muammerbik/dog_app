import 'package:dogs_app/app/data/data_sources/remote_data_source.dart';
import 'package:dogs_app/app/data/repositories/dog_repository.dart';
import 'package:dogs_app/app/domain/data_source/remote_data_source.dart';
import 'package:dogs_app/app/domain/repository/repository.dart';
import 'package:dogs_app/app/screen/home_screen/bloc/home_bloc.dart';
import 'package:dogs_app/app/screen/main_screen/bloc/main_bloc.dart';
import 'package:dogs_app/app/screen/settings_screen/bloc/settings_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupGetit() {
  setUpdataSource();
  setUprepository();
  setUpBloc();
}

void setUpdataSource() {
  locator.registerLazySingleton<FetchDogBreeds>(() => RemoteDogBreedsFetchI());
}

void setUprepository() {
  locator.registerLazySingleton<Repository>(() => DogRepository());
}

void setUpBloc() {
  locator
    ..registerLazySingleton<HomeBloc>(() => HomeBloc())
    ..registerLazySingleton<MainBloc>(() => MainBloc())
    ..registerLazySingleton<SettingsBloc>(() => SettingsBloc());
}
