// ignore_for_file: file_names

import 'package:coinexa_app/conistant.dart';
import 'package:coinexa_app/features/home/presentation/mange_state/cubit/home_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefreshiconWidet extends StatelessWidget {
  const RefreshiconWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: bacgroundIconButtom,
        borderRadius: BorderRadius.circular(400),
      ),
      child: IconButton(onPressed: () { 
                  context.read<HomeCubitCubit>().featchTrending(isRefresh: true);

      }, icon: Icon(Icons.refresh_outlined)),
    );
  }
}
