import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/data/datasources/emse/imprimante_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/portail_emse_remote_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/stormshield_remote_data_source.dart';
import 'package:minitel_toolbox/domain/repositories/calendar_url_repository.dart';

part 'portal_status_event.dart';
part 'portal_status_state.dart';

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
  });

  @override
  PortalStatusState get initialState => PortalStatusState.empty();

  @override
  Stream<PortalStatusState> mapEventToState(
    PortalStatusEvent event,
  ) async* {
    if (event is RefreshEvent) {
      yield PortalStatusState.loading();

      final refreshStormshield =
          stormshieldRemoteDataSource.fetchStatus(event.selectedUrl);

      final refreshCalendar = calendarURLRepository.isSaved;

      final portalIsSuccess = portailEMSERemoteDataSource.cookies.isNotEmpty;
      if (state.portalIsSuccess != portalIsSuccess) {
        add(PortalStatusChanged(portalIsSuccess: portalIsSuccess));
      }

      final printerIsSuccess = imprimanteRemoteDataSource.cookies.isNotEmpty;
      if (state.printerIsSuccess != printerIsSuccess) {
        add(PrinterStatusChanged(printerIsSuccess: printerIsSuccess));
      }

      try {
        await refreshCalendar.then((calendarIsSuccess) {
          if (state.calendarIsSuccess != calendarIsSuccess) {
            add(CalendarStatusChanged(
                calendarIsSuccess: calendarIsSuccess ?? false));
          }
        });
      } catch (e) {
        add(StormshieldStatusChanged(
          stormshieldState: e.toString(),
          stormshieldIsSuccess: false,
        ));
        add(PortalStatusFailureEvent(error: e));
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
        ;
      } catch (e) {
        add(CalendarStatusChanged(calendarIsSuccess: false));
        add(PortalStatusFailureEvent(error: e));
      }
    } else if (event is CalendarStatusChanged) {
      yield* _mapCalendarStatusChangedEventToState(event);
    } else if (event is PortalStatusChanged) {
      yield* _mapPortalStatusChangedEventToState(event);
    } else if (event is PrinterStatusChanged) {
      yield* _mapPrinterStatusChangedEventToState(event);
    } else if (event is StormshieldStatusChanged) {
      yield* _mapStormshieldStatusChangedEventToState(event);
    } else if (event is PortalStatusFailureEvent) {
      yield state.update(error: event.error);
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
