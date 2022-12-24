part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final String movieDetailsMessage;
  final RequestState movieState;
  final List<Recommendation> recommendation;
  final String recommendationMessage;
  final RequestState recommendationState;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsMessage = '',
    this.movieState = RequestState.loading,
    this.recommendation = const [],
    this.recommendationMessage = '',
    this.recommendationState = RequestState.loading,
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    String? movieDetailsMessage,
    RequestState? movieState,
    List<Recommendation>? recommendation,
    String? recommendationMessage,
    RequestState? recommendationState,
  }) {
    return MovieDetailsState(
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieState: movieState ?? this.movieState,
      movieDetails: movieDetails ?? this.movieDetails,
      recommendation: recommendation ?? this.recommendation,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
      recommendationState: recommendationState ?? this.recommendationState,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsMessage,
        movieState,
        recommendation,
        recommendationState,
        recommendationMessage,
      ];
}
