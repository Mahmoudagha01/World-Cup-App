import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_cup/helper/constants.dart';
import '../../business_logic/cubit/global_cubit.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
       
        return Scaffold(
      
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: primaryColor,
            unselectedItemColor: Colors.grey,
            currentIndex: BlocProvider.of<GlobalCubit>(context).currentIndex,
            onTap: BlocProvider.of<GlobalCubit>(context).changeNavBar,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.table_chart),
                label: 'Groups',
              ),
             
            ],
          ),
          body: BlocProvider.of<GlobalCubit>(context)
              .screens[BlocProvider.of<GlobalCubit>(context).currentIndex],
        );
      },
    );
  }
}

