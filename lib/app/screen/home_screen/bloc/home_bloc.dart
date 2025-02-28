import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dogs_app/app/data/data_sources/remote_data_source.dart';
import 'package:dogs_app/app/data/models/dog_breed_model.dart';
import 'package:dogs_app/app/data/repositories/dog_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DogRepository _dogRepository = DogRepository();
  DogRemoteDataSourceImpl dogData = DogRemoteDataSourceImpl();
  HomeBloc()
      : super(
          HomeState(
              status: HomeStatus.init,
              dogBreedsList: const [],
              selectedIndex: 0,
              fetchImageName: "",
              searchList: const [],
              searchController: TextEditingController(),
              searchName: ""),
        ) {
    on<FetchDogBreedsEvent>(onFetchDogBreedsEvent);
    on<SetSelectedIndexEvent>(onSetSelectedIndexEvent);
    on<FetchRandomImageEvent>(onFetchRandomImageEvent);
    on<SearchDogBreedsEvent>(onSearchDogBreedsEvent);
  }

  Future<void> onFetchDogBreedsEvent(
      FetchDogBreedsEvent event, Emitter<HomeState> emit) async {
    emit(
      state.copyWith(status: HomeStatus.loading),
    );
    var response = await _dogRepository.getAllBreeds();

    if (response.success) {
      emit(state.copyWith(
          status: HomeStatus.success, dogBreedsList: response.data));
    } else {
      emit(state.copyWith(
        status: HomeStatus.error,
      ));
    }
  }

  void onSetSelectedIndexEvent(
      SetSelectedIndexEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedIndex: event.selectedIndex));
  }

  Future<void> onFetchRandomImageEvent(
      FetchRandomImageEvent event, Emitter<HomeState> emit) async {
    var response =
        await _dogRepository.getBreedsImage(name: event.fetchRandomImage);
    if (response.success) {
      emit(state.copyWith(
          status: HomeStatus.success, fetchImageName: response.data));
    }
  }


  void onSearchDogBreedsEvent(
      SearchDogBreedsEvent event, Emitter<HomeState> emit) {
    var text =state.searchController.text.trim();
    List<DogBreedModel> newList = [];

    if (text.isEmpty) {
      newList = state.dogBreedsList;
    } else {
      for (var dogBreed in state.dogBreedsList) {
        if (dogBreed.name!.toLowerCase().contains(text.toLowerCase())) {
          newList.add(dogBreed);
        }
      }
    }

    emit(
      state.copyWith(searchList: newList),
    );
  }
}
