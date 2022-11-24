
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:world_cup/data/repository/app_repository.dart';

import '../../data/models/news.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(
    this.appRepository,
  ) : super(NewsInitial());
  final AppRepository appRepository;
  NewsModel? newsData;
  Future<NewsModel?> getNews() async {
    try {
      emit(NewsLoadingState());
      newsData = await appRepository.getNews();
      emit(NewsLoadedState(newsData!));
    } catch (e) {
      emit(NewsErrorState("Error in Fetching Data$e"));
    }
    return newsData;
  }
}
