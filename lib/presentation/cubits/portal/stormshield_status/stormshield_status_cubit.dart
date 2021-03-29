import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/domain/usecases/fetch_stormshield_status.dart';

part 'stormshield_status_cubit.freezed.dart';
part 'stormshield_status_state.dart';

@injectable
class StormshieldStatusCubit extends Cubit<StormshieldStatusState> {
  final FetchStormshieldStatus fetchStormshieldStatus;

  StormshieldStatusCubit(this.fetchStormshieldStatus)
      : super(const StormshieldStatusState.initial());

  Future<void> refresh(String selectedUrl) async {
    emit(const StormshieldStatusState.loading());
    try {
      final status = await fetchStormshieldStatus(selectedUrl);
      emit(StormshieldStatusState.loaded(status));
    } on Exception catch (e) {
      emit(StormshieldStatusState.error(e));
    }
  }
}
