// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
//
// class LocationSelectionPage extends StatefulWidget {
//   @override
//   _LocationSelectionPageState createState() => _LocationSelectionPageState();
// }
//
// class _LocationSelectionPageState extends State<LocationSelectionPage> {
//   GoogleMapController? _mapController;
//   LatLng _selectedPosition = const LatLng(0, 0); // 初始位置
//
//   void _onMapCreated(GoogleMapController controller) {
//     _mapController = controller;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Select Location'),
//       ),
//       body: GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: _selectedPosition,
//           zoom: 15,
//         ),
//         onTap: (LatLng position) {
//           setState(() {
//             _selectedPosition = position;
//           });
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // 返回选定的位置信息
//           Navigator.pop(context, _selectedPosition);
//         },
//         child: const Icon(
//             Icons.check,
//           color: Color(0xFF5641EF),
//         ),
//       ),
//     );
//   }
// }