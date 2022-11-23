import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/views/home.dart';
import '../../presentation/views/matchestable.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());
  int currentIndex = 0;

void changeNavBar(index) {
  currentIndex = index;
  emit(ChangeNavBarState());
}





List<Widget> screens = [
  const Home(),
  MatchTable(),
];
}


