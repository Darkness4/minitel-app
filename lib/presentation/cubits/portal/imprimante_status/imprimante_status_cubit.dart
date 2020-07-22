import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/data/datasources/emse/imprimante_remote_data_source.dart';

part 'imprimante_status_cubit.freezed.dart';
part 'imprimante_status_state.dart';

@injectable
class ImprimanteStatusCubit extends Cubit<ImprimanteStatusState> {
  final ImprimanteRemoteDataSource imprimanteRemoteDataSource;
  ImprimanteStatusCubit(this.imprimanteRemoteDataSource)
      : super(const ImprimanteStatusInitial());

  void refresh() {
    emit(const ImprimanteStatusState.loading());
    try {
      final success = imprimanteRemoteDataSource.cookies.isNotEmpty;
      emit(ImprimanteStatusState.loaded(success));
    } on Exception catch (e) {
      emit(ImprimanteStatusState.error(e));
    }
  }
}
