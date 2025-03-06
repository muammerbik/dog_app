part of 'home_bloc.dart';

enum HomeStatus { init, loading, success, error }
// ignore: must_be_immutable
class HomeState extends Equatable {
  final HomeStatus status;
  final List<DogBreedModel> dogBreedsList;
  final int selectedIndex;
  final String fetchImageName;
  final String searchName;
  final List<DogBreedModel> searchList;
  TextEditingController searchController = TextEditingController();

  HomeState({
    required this.status,
    required this.dogBreedsList,
    required this.selectedIndex,
    required this.fetchImageName,
    required this.searchName,
    required this.searchList,
    required this.searchController,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<DogBreedModel>? dogBreedsList,
    int? selectedIndex,
    String? fetchImageName,
    String? searchName,
    List<DogBreedModel>? searchList,
    TextEditingController? searchController,
  }) {
    return HomeState(
      status: status ?? this.status,
      dogBreedsList: dogBreedsList ?? this.dogBreedsList,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      fetchImageName: fetchImageName ?? this.fetchImageName,
      searchName: searchName ?? this.searchName,
      searchList: searchList ?? this.searchList,
      searchController: searchController ?? this.searchController,
    );
  }

  @override
  List<Object> get props => [
        status,
        dogBreedsList,
        selectedIndex,
        fetchImageName,
        searchName,
        searchList,
        searchController
      ];
}
