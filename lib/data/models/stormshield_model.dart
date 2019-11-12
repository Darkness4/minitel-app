import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/domain/entities/stormshield.dart';

class StormshieldModel extends Stormshield {
  const StormshieldModel({
    @required String status,
    @required Cookie cookie,
  }) : super(status: status, cookie: cookie);
}
