import 'package:cubit/cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/data/datasources/emse/stormshield_remote_data_source.dart';

part 'stormshield_status_cubit.freezed.dart';
part 'stormshield_status_state.dart';

@injectable
class StormshieldStatusCubit extends Cubit<StormshieldStatusState> {
  final StormshieldRemoteDataSource stormshieldRemoteDataSource;

  StormshieldStatusCubit(this.stormshieldRemoteDataSource)
      : super(const StormshieldStatusState.initial());

  Future<void> refresh(String selectedUrl) async {
    emit(const StormshieldStatusState.loading());
    try {
      final status = await stormshieldRemoteDataSource.fetchStatus(selectedUrl);
      emit(StormshieldStatusState.loaded(status));
    } on Exception catch (e) {
      emit(StormshieldStatusState.error(e));
    }
  }
}
