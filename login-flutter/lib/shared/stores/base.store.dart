// coverage:ignore-file

import 'package:login/shared/helpers/result.helper.dart';
import 'package:login/shared/helpers/successResult.helper.dart';
import 'package:login/shared/stores/store.states.dart';

class BaseStore {
  Future<DataState<T>> loadData<T>(
      {required Future<Result<T>> dataFuture,
      required Function(DataState<T> state) stateSetter}) async {
    DataState<T> finalState;
    stateSetter(DataLoadingState());

    final result = await dataFuture;
    finalState = result.toDataState();

    stateSetter(finalState);
    return finalState;
  }
}
