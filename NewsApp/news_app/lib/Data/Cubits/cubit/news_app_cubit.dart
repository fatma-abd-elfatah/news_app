import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/news_app/news_app.dart';
import '../../Repositories/news_app_repo.dart';

part 'news_app_state.dart';

class NewsAppCubit extends Cubit<NewsAppState> {
  NewsAppCubit() : super(NewsAppInitial());

  getAllNew() {
    emit(NewsAppLoding());
    AllNewsRepo().getAllNew().then((value) {
      if (value != null) {
        emit(NewsAppSucsess(ourResponse: value));
      } else {
        emit(NewsAppError());
      }
    });
  }
}
