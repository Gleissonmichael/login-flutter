import 'package:login/shared/helpers/result.helper.dart';
import 'package:login/shared/stores/store.states.dart';

import '../enums/resultType.enum.dart';

class SuccessResult<TData> extends Result<TData> {
  final TData data;

  const SuccessResult(this.data, [ResultTypes status = ResultTypes.ok]) : super(status);
}

extension DataStateExtension<TData> on Result<TData> {
  DataState<TData> toDataState() {
    if (isSuccess()) {
      return DataLoadedState(getSuccessData());
    } else {
      return DataErrorState(toErrorResult());
    }
  }
}
