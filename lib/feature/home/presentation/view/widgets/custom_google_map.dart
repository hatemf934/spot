import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(31.2001, 29.9187),
    zoom: 15,
  );

  static final LatLngBounds alexandriaBounds = LatLngBounds(
    southwest: const LatLng(31.10, 29.75),
    northeast: const LatLng(31.35, 30.10),
  );
  String? mapStyle;
  Set<Marker> myMarker = {};
  @override
  initState() {
    super.initState();
    initStyleMap();
    intiMarker();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      style: mapStyle,
      markers: myMarker,
      zoomControlsEnabled: false,
      cameraTargetBounds: CameraTargetBounds(alexandriaBounds),
      initialCameraPosition: initialCameraPosition,
      minMaxZoomPreference: const MinMaxZoomPreference(12, 18),
    );
  }

  void initStyleMap() async {
    var mapInterfaceStyle = await DefaultAssetBundle.of(
      context,
    ).loadString("assets/mapStyles/Interface_map.json");
    setState(() {
      mapStyle = mapInterfaceStyle;
    });
  }

  void intiMarker() async {
    var customIconMarker = await BitmapDescriptor.asset(
      ImageConfiguration(),
      "assets/markerIcon/marker_app.png",
    );
    var marker = Marker(
      icon: customIconMarker,
      position: LatLng(31.2001, 29.9187),
      markerId: MarkerId("my marker"),
    );
    setState(() {
      myMarker.add(marker);
    });
  }
}
