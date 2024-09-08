import 'package:baseapp/common/constants/env.dart';
import 'package:baseapp/features/dashboard/cubit/cubit.dart';
import 'package:baseapp/features/dashboard/resources/dashboard_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocWrapper extends StatelessWidget {
  final Widget child;
  final Env env;

  const MultiBlocWrapper({
    super.key,
    required this.child,
    required this.env,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TransactionLimitCubit(
            transactionRepository:
                RepositoryProvider.of<TransactionRepository>(context),
          ),
          lazy: false,
        ),
      ],
      child: child,
    );
  }
}
