import 'dart:io';

import 'package:equatable/equatable.dart';

class Stormshield extends Equatable {
  final String status;
  final Cookie cookie;

  const Stormshield({
    this.status,
    this.cookie,
  });

  @override
  List<Object> get props => <Object>[status, cookie];
}
