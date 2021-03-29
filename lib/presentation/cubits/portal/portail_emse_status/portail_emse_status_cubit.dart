import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/domain/usecases/fetch_portail_emse_cookies.dart';

part 'portail_emse_status_cubit.freezed.dart';
part 'portail_emse_status_state.dart';

@injectable
class PortailEmseStatusCubit extends Cubit<PortailEmseStatusState> {
  final FetchPortailEmseCookies fetchPortailEmseCookies;
  PortailEmseStatusCubit(this.fetchPortailEmseCookies)
      : super(const PortailEmseStatusInitial());

  Future<void> refresh() async {
    emit(const PortailEmseStatusState.loading());
    try {
      final success = (await fetchPortailEmseCookies()).isNotEmpty;
      emit(PortailEmseStatusState.loaded(success));
    } on Exception catch (e) {
      emit(PortailEmseStatusState.error(e));
    }
  }
}
