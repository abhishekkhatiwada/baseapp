import 'package:baseapp/common/cubit/data_state.dart';
import 'package:baseapp/common/http/response.dart';
import 'package:baseapp/features/dashboard/model/model.dart';
import 'package:baseapp/features/dashboard/resources/dashboard_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionLimitCubit extends Cubit<CommonState> {
  TransactionLimitCubit({required this.transactionRepository})
      : super(CommonInitial());

  final TransactionRepository transactionRepository;

  fetchTransactionLimit() async {
    emit(CommonLoading());
    final res = await transactionRepository.fetchTransactionLimit();
    if (res.status == Status.success && res.data != null) {
      emit(CommonStateSuccess<FetchedList>(data: res.data!));
    } else {
      emit(
        CommonError(message: res.message ?? 'Unable to load data'),
      );
    }
  }
}
