part of 'home_bloc.dart';

enum HomeStatus { init, loading, succes, error }

 class HomeState extends Equatable {
  final HomeStatus status;
  final List<DogBreedModel> dogBreedsList;
  final int selectedIndex;
  final String fetchImageName;
  final int textFieldStatus;

  const HomeState({
    required this.status,
    required this.dogBreedsList,
    required this.selectedIndex,
    required this.fetchImageName,
    required this.textFieldStatus,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<DogBreedModel>? dogBreedsList,
    int? selectedIndex,
    String? fetchImageName,
    int? textFieldStatus,
  }) {
    return HomeState(
      status: status ?? this.status,
      dogBreedsList: dogBreedsList ?? this.dogBreedsList,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      fetchImageName: fetchImageName ?? this.fetchImageName,
      textFieldStatus: textFieldStatus ?? this.textFieldStatus,
    );
  }

  @override
  List<Object> get props =>
      [status, dogBreedsList, selectedIndex, fetchImageName, textFieldStatus];
}
