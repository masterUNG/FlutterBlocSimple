// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_simple/bloc/common_bloc.dart';
import 'package:flutter_bloc_simple/models/foood_model.dart';
import 'package:flutter_bloc_simple/utility/my_constant.dart';

class FoodBloc extends Bloc<MyEvent, MyState> {
  FoodBloc() : super(StateInitialized()) {
    on<GetAllFoodEvent>(_onGetAllFood);
  }

  void _onGetAllFood(
      GetAllFoodEvent getAllFoodEvent, Emitter<MyState> emit) async {
    emit(StateLoading());

    final res = await Dio().get(MyConstant.apiGetAllFood);
    if (res.statusCode != HttpStatus.ok) {
      emit(StateError(message: 'Error Connected Server'));
      return;
    }

    var foodModels = <FoodModel>[];
    for (var item in json.decode(res.data)) {
      FoodModel model = FoodModel.fromMap(item);
      foodModels.add(model);
    }
    emit(GetAllFoodSuccessState(foodModels: foodModels));
    
  }
}

class GetAllFoodEvent extends MyEvent {}

class GetAllFoodSuccessState extends MyState {
  List<FoodModel> foodModels;
  GetAllFoodSuccessState({
    required this.foodModels,
  });
}
