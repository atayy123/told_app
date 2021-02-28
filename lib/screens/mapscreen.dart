import 'dart:async';
import 'package:told_app/components/videobuilder.dart';
import 'package:told_app/data.dart';
import 'package:told_app/screens/trendscreen.dart';

import '../class.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  final List<LocationPost> locPosts;

  const MapPage({Key key, this.locPosts}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _mController;
  Location location = Location();
  Set<Marker> markers = {};
  double latitude = 38.423733;
  double longitude = 27.142826;
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  void _start() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    latitude = _locationData.latitude;
    longitude = _locationData.longitude;

    if ((latitude == null) | (longitude == null)) {
      latitude = 38.423733;
      longitude = 27.142826;
    }
  }

  @override
  void initState() {
    for (var i = 0; i < widget.locPosts.length; i++) {
      markers.add(Marker(
          markerId: MarkerId(widget.locPosts[i].id),
          position:
              LatLng(widget.locPosts[i].latitude, widget.locPosts[i].longitude),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TrendScreen(
                        item: Trend(header: "Izmir", posts: trendposts))));
          }));
    }
    _mController = Completer();
    _start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              mapToolbarEnabled: false,
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                _mController.complete(controller);
              },
              initialCameraPosition:
                  CameraPosition(target: LatLng(latitude, longitude), zoom: 12),
              markers: markers,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 160,
                  child: ListView.builder(
                    itemCount: widget.locPosts.length,
                    padding: EdgeInsets.all(6),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, index) {
                      if (widget.locPosts[index].post is PhotoPost) {
                        return GestureDetector(
                          onTap: () async {
                            final GoogleMapController controller =
                                await _mController.future;
                            controller.animateCamera(
                                CameraUpdate.newCameraPosition(CameraPosition(
                              target: LatLng(widget.locPosts[index].latitude,
                                  widget.locPosts[index].longitude),
                              zoom: 15,
                              tilt: 50.0,
                              bearing: 45.0,
                            )));
                          },
                          child: Container(
                              height: 160,
                              width: 110,
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        widget.locPosts[index].post.photoUrl),
                                    fit: BoxFit.cover,
                                  ))),
                        );
                      } else if (widget.locPosts[index].post is VideoPost) {
                        return GestureDetector(
                          onTap: () async {
                            final GoogleMapController controller =
                                await _mController.future;
                            controller.animateCamera(
                                CameraUpdate.newCameraPosition(CameraPosition(
                              target: LatLng(widget.locPosts[index].latitude,
                                  widget.locPosts[index].longitude),
                              zoom: 15,
                              tilt: 50.0,
                              bearing: 45.0,
                            )));
                          },
                          child: Container(
                            height: 160,
                            width: 110,
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: VideoPlayerScreen(
                                video: widget.locPosts[index].post.videoUrl,
                                typeof: "asset",
                              ),
                            ),
                          ),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}
