import 'package:auto_login_flutter/components/drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:flutter/material.dart';

class MapsPage extends StatefulWidget {
  final String title;

  MapsPage({Key key, this.title}) : super(key: key);

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(43.4449842, 5.4794195),
              zoom: 19,
            ),
            onMapCreated: (controller) => _onMapCreated(),
            myLocationEnabled: true,
            compassEnabled: true,
            trackCameraPosition: true,
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  void _onMapCreated() async {
    if (!await SimplePermissions.checkPermission(Permission.AccessFineLocation)) SimplePermissions.requestPermission(Permission.AccessFineLocation);
  }
}

