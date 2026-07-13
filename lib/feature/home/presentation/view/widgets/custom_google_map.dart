import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spot/core/model/places_details_model/places_details_model.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({
    super.key,
    this.placesDetailsModel,
    this.onMapCreated,
  });
  final PlacesDetailsModel? placesDetailsModel;
  final void Function(GoogleMapController controller)? onMapCreated;
  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;

  String? mapStyle;
  Set<Marker> myMarker = {};
  BitmapDescriptor? customIconMarker;

  @override
  void initState() {
    super.initState();
    initStyleMap();
    initialCameraPosition = const CameraPosition(
      target: LatLng(31.2001, 29.9187),
      zoom: 15,
    );
    initMarkerIcon();
  }

  @override
  void didUpdateWidget(covariant CustomGoogleMap oldWidget) {
    super.didUpdateWidget(oldWidget);

    final newPlace = widget.placesDetailsModel;
    final oldPlace = oldWidget.placesDetailsModel;

    if (newPlace != null &&
        newPlace.location?.latitude != null &&
        newPlace.location?.longitude != null &&
        (oldPlace?.location?.latitude != newPlace.location?.latitude ||
            oldPlace?.location?.longitude != newPlace.location?.longitude)) {
      updateMarker(
        LatLng(newPlace.location!.latitude!, newPlace.location!.longitude!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      style: mapStyle,
      markers: myMarker,
      zoomControlsEnabled: false,
      initialCameraPosition: initialCameraPosition,
      minMaxZoomPreference: const MinMaxZoomPreference(12, 18),
      onMapCreated: (controller) {
        widget.onMapCreated?.call(controller);
      },
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

  void initMarkerIcon() async {
    customIconMarker = await BitmapDescriptor.asset(
      const ImageConfiguration(),
      "assets/markerIcon/marker_app.png",
    );
    updateMarker(const LatLng(31.2001, 29.9187));
  }

  void updateMarker(LatLng position) {
    if (customIconMarker == null) return;
    final marker = Marker(
      icon: customIconMarker!,
      position: position,
      markerId: const MarkerId("selected_place_marker"),
    );
    setState(() {
      myMarker
        ..clear()
        ..add(marker);
    });
  }
}
