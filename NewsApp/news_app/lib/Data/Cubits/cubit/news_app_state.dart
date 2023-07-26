part of 'news_app_cubit.dart';

@immutable
abstract class NewsAppState {}

class NewsAppInitial extends NewsAppState {}

class NewsAppLoding extends NewsAppState {}

class NewsAppSucsess extends NewsAppState {
  final NewsApp ourResponse;
  NewsAppSucsess({required this.ourResponse});
}

class NewsAppError extends NewsAppState {}
