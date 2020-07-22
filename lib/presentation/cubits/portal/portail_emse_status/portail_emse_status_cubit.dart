import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/data/datasources/emse/portail_emse_remote_data_source.dart';

part 'portail_emse_status_cubit.freezed.dart';
part 'portail_emse_status_state.dart';

@injectable
class PortailEmseStatusCubit extends Cubit<PortailEmseStatusState> {
  final PortailEMSERemoteDataSource portailEMSERemoteDataSource;
  PortailEmseStatusCubit(this.portailEMSERemoteDataSource)
      : super(const PortailEmseStatusInitial());

  void refresh() {
    emit(const PortailEmseStatusState.loading());
    try {
      final success = portailEMSERemoteDataSource.cookies.isNotEmpty;
      emit(PortailEmseStatusState.loaded(success));
    } on Exception catch (e) {
      emit(PortailEmseStatusState.error(e));
    }
  }
}
