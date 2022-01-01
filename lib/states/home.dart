// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple/bloc/common_bloc.dart';
import 'package:flutter_bloc_simple/bloc/food_bloc.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    context.read<FoodBloc>().add(GetAllFoodEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List All Food'),
      ),
      body: BlocConsumer<FoodBloc, MyState>(
        builder: (context, state) {
          if (state is StateLoading) {
            print(state);
            return Center(child: CircularProgressIndicator());
          } else if (state is GetAllFoodSuccessState) {
            print(state.foodModels);
            var foodModels = state.foodModels;
            return ListView.builder(
              itemCount: foodModels.length,
              itemBuilder: (context, index) => Text(foodModels[index].nameFood),
            );
          }
          return SizedBox();
        },
        listener: (context, state) {
          if (state is StateError) {
            print(state);
          }
        },
      ),
    );
  }
}
