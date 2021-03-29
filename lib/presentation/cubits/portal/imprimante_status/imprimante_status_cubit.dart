import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/domain/usecases/fetch_printer_cookies.dart';

part 'imprimante_status_cubit.freezed.dart';
part 'imprimante_status_state.dart';

@injectable
class ImprimanteStatusCubit extends Cubit<ImprimanteStatusState> {
  final FetchPrinterCookies fetchPrinterCookies;
  ImprimanteStatusCubit(this.fetchPrinterCookies)
      : super(const ImprimanteStatusInitial());

  Future<void> refresh() async {
    emit(const ImprimanteStatusState.loading());
    try {
      final success = (await fetchPrinterCookies()).isNotEmpty;
      emit(ImprimanteStatusState.loaded(success));
    } on Exception catch (e) {
      emit(ImprimanteStatusState.error(e));
    }
  }
}
