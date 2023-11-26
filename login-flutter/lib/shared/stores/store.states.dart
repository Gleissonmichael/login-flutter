// coverage:ignore-file
import 'package:login/shared/helpers/errorResult.helper.dart';
import 'package:login/shared/helpers/result.helper.dart';
import 'package:login/shared/helpers/successResult.helper.dart';

abstract class DataState<TData> {}

class DataStartState<TData> implements DataState<TData> {}

class DataLoadingState<TData> implements DataState<TData> {}

class DataErrorState<TData> implements DataState<TData> {
  final ErrorResult<TData> error;
  const DataErrorState(this.error);
}

class DataLoadedState<TData> implements DataState<TData> {
  final TData data;
  const DataLoadedState(this.data);
}

extension DataStateExtension<TData> on DataState<TData> {
  bool isLoaded() => this is DataLoadedState<TData>;
  bool isError() => this is DataErrorState<TData>;
  bool isLoading() => this is DataLoadingState<TData>;
  bool isStart() => this is DataStartState<TData>;

  TData getLoadedData() {
    assert(
        isLoaded(), "Estado inválido. Verifique com state.isSuccess() antes de usar esse método.");

    return (this as DataLoadedState<TData>).data;
  }

  ErrorResult<TData> getError() {
    assert(isError(),
        "O estado não é um erro. Verifique com state.isError() antes de usar esse método.");

    return (this as DataErrorState<TData>).error;
  }

  Result<TData> toResult() {
    assert(isLoaded() || isError(),
        "Estado inválido. O estado precisa ser de erro ou sucesso para usar esse método.");
    if (isLoaded()) {
      return SuccessResult<TData>(getLoadedData());
    } else {
      return getError();
    }
  }
}
