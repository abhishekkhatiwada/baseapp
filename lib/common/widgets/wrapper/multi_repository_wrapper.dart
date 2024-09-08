import 'package:baseapp/common/constants/env.dart';
import 'package:baseapp/common/http/api_provider.dart';
import 'package:baseapp/common/utils/internet_check.dart';
import 'package:baseapp/features/dashboard/resources/dashboard_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiRepositoryWrapper extends StatelessWidget {
  final Widget child;
  final Env env;

  const MultiRepositoryWrapper(
      {super.key, required this.child, required this.env});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Env>(
          create: (context) => env,
          lazy: true,
        ),
        RepositoryProvider<InternetCheck>(
          create: (context) => InternetCheck(),
          lazy: true,
        ),
        RepositoryProvider<ApiProvider>(
          create: (context) => ApiProvider(
            baseUrl: RepositoryProvider.of<Env>(context).baseUrl,
          ),
          lazy: true,
        ),
        RepositoryProvider(
          create: (context) => TransactionRepository(
              env: env,
              apiProvider: RepositoryProvider.of<ApiProvider>(context)),
          lazy: true,
        )
        // RepositoryProvider<UserRepository>(
        //   create: (context) => UserRepository(
        //     env: RepositoryProvider.of<Env>(context),
        //     apiProvider: RepositoryProvider.of<ApiProvider>(context),
        //   )..initialState(),
        //   lazy: true,
        // ),

        // RepositoryProvider<VotingRepository>(
        //   create: (context) => VotingRepository(
        //     env: RepositoryProvider.of<Env>(context),
        //     apiProvider: RepositoryProvider.of<ApiProvider>(context),
        //     userRepository: RepositoryProvider.of<UserRepository>(context),
        //   ),
        //   lazy: true,
        // ),
        // RepositoryProvider<BankAccountsRepository>(
        //   create: (context) => BankAccountsRepository(
        //     env: RepositoryProvider.of<Env>(context),
        //     apiProvider: RepositoryProvider.of<ApiProvider>(context),
        //     userRepository: RepositoryProvider.of<UserRepository>(context),
        //   ),
        //   lazy: true,
        // ),
      ],
      child: child,
    );
  }
}
