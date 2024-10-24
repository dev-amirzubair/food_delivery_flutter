import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:food_delivery/app/constants/colors.dart';
import 'package:food_delivery/app/modules/profile/map/viewModal.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final map = Provider.of<MapViewModal>(context);
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter:
                  LatLng(31.891478, 71.236427), // Center the map over London
              initialZoom: 5.6,
            ),
            children: [
              TileLayer(
                // Display map tiles from any source
                urlTemplate:
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
                userAgentPackageName: 'com.example.app',
                // And many more recommended properties!
              ),
              RichAttributionWidget(
                // Include a stylish prebuilt attribution widget that meets all requirments
                attributions: [
                  TextSourceAttribution('OpenStreetMap contributors',
                      onTap: () {} // (external)
                      ),
                  // Also add images...
                ],
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // profile.goBack(context);
                      map.goBack(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                      child: Text(
                        "Add your location",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
