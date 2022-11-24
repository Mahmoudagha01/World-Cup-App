part of 'news_cubit.dart';


@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final NewsModel data;

  NewsLoadedState(this.data);
}

class NewsErrorState extends NewsState {
  final String message;

  NewsErrorState(this.message);
}