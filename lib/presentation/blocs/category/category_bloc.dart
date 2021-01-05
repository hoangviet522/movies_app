import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mygarment/domain/entities/no_params.dart';
import 'package:mygarment/domain/entities/category_entity.dart';
import 'package:mygarment/domain/usecases/get_categories.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategories getCategories;
  CategoryBloc({@required this.getCategories}) : super(CategoryInitial());

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is CategoryLoadEvent) {
      yield CategoryLoading();
      final categoryEither = await getCategories(NoParams());
      yield categoryEither.fold(
        (l) => CategoryError(),
        (categories) => CategoryLoaded(categories: categories),
      );
    }
  }
}
