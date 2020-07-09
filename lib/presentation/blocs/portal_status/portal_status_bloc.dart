import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/data/datasources/emse/imprimante_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/portail_emse_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/stormshield_remote_data_source.dart';
import 'package:minitel_toolbox/domain/repositories/calendar_url_repository.dart';

part 'portal_status_bloc.freezed.dart';
part 'portal_status_event.dart';
part 'portal_status_state.dart';

@injectable
class PortalStatusBloc extends Bloc<PortalStatusEvent, PortalStatusState> {
  final StormshieldRemoteDataSource stormshieldRemoteDataSource;
  final CalendarURLRepository calendarURLRepository;
  final ImprimanteRemoteDataSource imprimanteRemoteDataSource;
  final PortailEMSERemoteDataSource portailEMSERemoteDataSource;

  PortalStatusBloc({
    @required this.stormshieldRemoteDataSource,
    @required this.imprimanteRemoteDataSource,
    @required this.portailEMSERemoteDataSource,
    @required this.calendarURLRepository,
  })  : assert(stormshieldRemoteDataSource != null),
        assert(imprimanteRemoteDataSource != null),
        assert(portailEMSERemoteDataSource != null),
        assert(calendarURLRepository != null),
        super(PortalStatusState.empty());

  @override
  Stream<PortalStatusState> mapEventToState(
    PortalStatusEvent event,
  ) {
    return event.map(
      calendarStatusChanged: _mapCalendarStatusChangedEventToState,
      portalStatusChanged: _mapPortalStatusChangedEventToState,
      failure: (event) async* {
        yield state.update(
          isFailure: true,
          error: event.error,
        );
      },
      printerStatusChanged: _mapPrinterStatusChangedEventToState,
      refresh: _mapRefreshEventToState,
      stormshieldStatusChanged: _mapStormshieldStatusChangedEventToState,
    );
  }

  Stream<PortalStatusState> _mapRefreshEventToState(RefreshEvent event) async* {
    yield PortalStatusState.loading();

    final refreshStormshield =
        stormshieldRemoteDataSource.fetchStatus(event.selectedUrl);

    final refreshCalendar = calendarURLRepository.isSaved;

    final portalIsSuccess = portailEMSERemoteDataSource.cookies.isNotEmpty;
    if (state.portalIsSuccess != portalIsSuccess) {
      add(PortalStatusChanged(portalIsSuccess));
    }

    final printerIsSuccess = imprimanteRemoteDataSource.cookies.isNotEmpty;
    if (state.printerIsSuccess != printerIsSuccess) {
      add(PrinterStatusChanged(printerIsSuccess));
    }

    try {
      await refreshCalendar.then((calendarIsSuccess) {
        if (state.calendarIsSuccess != calendarIsSuccess) {
          add(CalendarStatusChanged(calendarIsSuccess ?? false));
        }
      });
    } on Exception catch (e) {
      add(StormshieldStatusChanged(
        stormshieldState: e.toString(),
        stormshieldIsSuccess: false,
      ));
      add(PortalStatusFailureEvent(e));
    }
    try {
      await refreshStormshield.then((status) {
        if (state.stormshieldState != status) {
          add(StormshieldStatusChanged(
            stormshieldState: status,
            stormshieldIsSuccess: true,
          ));
        }
      });
    } on Exception catch (e) {
      add(const CalendarStatusChanged(false));
      add(PortalStatusFailureEvent(e));
    }
  }

  Stream<PortalStatusState> _mapCalendarStatusChangedEventToState(
      CalendarStatusChanged event) async* {
    yield state.update(calendarIsSuccess: event.calendarIsSuccess);
  }

  Stream<PortalStatusState> _mapPortalStatusChangedEventToState(
      PortalStatusChanged event) async* {
    yield state.update(portalIsSuccess: event.portalIsSuccess);
  }

  Stream<PortalStatusState> _mapPrinterStatusChangedEventToState(
      PrinterStatusChanged event) async* {
    yield state.update(printerIsSuccess: event.printerIsSuccess);
  }

  Stream<PortalStatusState> _mapStormshieldStatusChangedEventToState(
      StormshieldStatusChanged event) async* {
    yield state.update(
      stormshieldState: event.stormshieldState,
      stormshieldIsSuccess: event.stormshieldIsSuccess,
    );
  }
}
