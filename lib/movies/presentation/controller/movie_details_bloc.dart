import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';
import 'package:movies/movies/domain/usecases/get_recommendation_usecase.dart';
import '../../domain/usecases/get_movie_details_use_case.dart';
import '../../../core/utils/enums.dart';
import "../../domain/entities/movie_details.dart";

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
          movieState: RequestState.error,
          movieDetailsMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieState: RequestState.loaded,
          movieDetails: r,
        ),
      ),
    );
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async{
    final result =
        await getRecommendationUseCase(RecommendationParameters(event.id));
    result.fold(
          (l) => emit(
        state.copyWith(
          recommendationState: RequestState.error,
          recommendationMessage: l.message,
        ),
      ),
          (r) => emit(
        state.copyWith(
          recommendationState: RequestState.loaded,
          recommendation: r,

        ),
      ),
    );
  }
}

