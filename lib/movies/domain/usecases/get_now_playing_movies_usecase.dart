import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/base_use_case.dart';
import '/movies/domain/entities/movie.dart';
import '/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>>  call(NoParameters parameters)async{
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}