// home_page_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doan_thanh_nien/models/activities.dart';
import 'event/home_event.dart';
import 'state/home_state.dart';



class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final String selectedCategory;

  HomeBloc(this.selectedCategory)
      : super(HomeState(activities: [], isLoading: true)) {
    on<FetchActivitiesEvent>(_onFetchActivities);
  }

  void _onFetchActivities(
      FetchActivitiesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
        isLoading: true)); 

    try {
      final activities = News().getActivitiesByCategory(selectedCategory);
      emit(state.copyWith(activities: activities, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false)); 
    }
  }
}
