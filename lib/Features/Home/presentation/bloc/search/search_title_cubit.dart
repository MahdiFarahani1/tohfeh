import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/Features/Home/presentation/bloc/search/search_status.dart';

part 'search_title_state.dart';

class SearchTitleCubit extends Cubit<SearchTitleState> {
  SearchTitleCubit() : super(SearchTitleState(status: Init()));

  searchData() {
    emit(SearchTitleState(status: Complete()));
  }
}
