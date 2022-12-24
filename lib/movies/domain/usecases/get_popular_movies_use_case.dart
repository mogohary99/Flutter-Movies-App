import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/base_use_case.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>>  call(NoParameters parameters)async{
    return await baseMoviesRepository.getPopularMovies();
  }
}