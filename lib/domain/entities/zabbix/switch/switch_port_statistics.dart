import 'dart:collection';

class SwitchPortStatistics {
  int up = 0;
  int down = 0;
  int testing = 0;
  int unknown = 0;
  int dormant = 0;
  int notPresent = 0;
  int lowerLayerDown = 0;
  final SplayTreeMap<int, String> speedMap =
      SplayTreeMap<int, String>((int key1, int key2) => key1.compareTo(key2));

  @override
  String toString() {
    return 'Up: $up\n'
        ' | With : $speedMap\n'
        'Down: $down\n'
        'Testing: $testing\n'
        'Unknown: $unknown\n'
        'Dormant: $dormant\n'
        'NotPresent: $notPresent\n'
        'LowerLayerDown: $lowerLayerDown';
  }
}
