import 'package:app_one/food_app/domain/entities/pizza.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

const MAPBOX_STYLE = 'mapbox/dark-v11';
const MARKER_COLOR = Color(0xFF3DC5A7);
const MAPBOX_ACCESS_TOKEN =
    'pk.eyJ1IjoiaXJvbmRldiIsImEiOiJjbGduMmY0cGMwMGxtM2VvYWtvYXNiaWxvIn0.U2N6GoQOAm6w6q5-UlX7Ug';

final _myLocation = LatLng(8.9473, -75.4395);

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(minZoom: 5, maxZoom: 16, zoom: 13),
            nonRotatedChildren: [
              TileLayer(
                urlTemplate:
                    'https://api.mapbox.com/styles/v1/examples/cjikt35x83t1z2rnxpdmjs7y7?access_token=pk.eyJ1IjoiaXJvbmRldiIsImEiOiJjbGduMmY0cGMwMGxtM2VvYWtvYXNiaWxvIn0.U2N6GoQOAm6w6q5-UlX7Ug',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _myLocation,
                    builder: (context) {
                      return Container();
                    },
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
