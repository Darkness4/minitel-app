import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/network/network_info.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([Connectivity])
void main() {
  late NetworkInfoImpl networkInfo;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    networkInfo = NetworkInfoImpl(mockConnectivity);
  });

  group('networkInfo.result', () {
    test(
      'is connected to Wifi',
      () async {
        // arrange
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => ConnectivityResult.wifi);
        // act
        final result = await networkInfo.result;
        // assert
        verify(mockConnectivity.checkConnectivity());
        expect(result, ConnectivityResult.wifi);
      },
    );

    test(
      'is connected to Mobile',
      () async {
        // arrange
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => ConnectivityResult.mobile);
        // act
        final result = await networkInfo.result;
        // assert
        verify(mockConnectivity.checkConnectivity());
        expect(result, ConnectivityResult.mobile);
      },
    );

    test(
      'is connected to None',
      () async {
        // arrange
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => ConnectivityResult.none);
        // act
        final result = await networkInfo.result;
        // assert
        verify(mockConnectivity.checkConnectivity());
        expect(result, ConnectivityResult.none);
      },
    );
  });
}
