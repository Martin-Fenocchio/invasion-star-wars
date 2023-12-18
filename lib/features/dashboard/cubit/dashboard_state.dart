part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  const DashboardState({
    this.characters = const [],
    this.isLoading = false,
    this.page = 1,
    this.isLoadingReport = false,
    this.conectionIsOpen = false,
    this.isLoadingMore = false,
    this.vehicles = const [],
    this.reportedCharacters = const [],
    this.starships = const [],
  });
  const DashboardState.init() : this();

  final List<Character> characters;
  final List<VehiclesModel> vehicles;
  final List<String> reportedCharacters;
  final List<StarshipModel> starships;
  final int page;
  final bool isLoading, isLoadingReport, isLoadingMore, conectionIsOpen;

  DashboardState copyWith({
    List<Character>? characters,
    bool? isLoading,
    bool? conectionIsOpen,
    bool? isLoadingReport,
    bool? isLoadingMore,
    List<VehiclesModel>? vehicles,
    List<StarshipModel>? starships,
    List<String>? reportedCharacters,
    int? page,
  }) {
    return DashboardState(
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      page: page ?? this.page,
      conectionIsOpen: conectionIsOpen ?? this.conectionIsOpen,
      reportedCharacters:
          reportedCharacters ?? this.reportedCharacters.toSet().toList(),
      isLoading: isLoading ?? this.isLoading,
      isLoadingReport: isLoadingReport ?? this.isLoadingReport,
      characters: characters ?? this.characters,
      vehicles: vehicles ?? this.vehicles,
      starships: starships ?? this.starships,
    );
  }

  @override
  List<Object> get props => [
        characters,
        page,
        isLoadingReport,
        isLoading,
        isLoadingMore,
        conectionIsOpen,
        reportedCharacters,
        vehicles,
        starships
      ];
}
