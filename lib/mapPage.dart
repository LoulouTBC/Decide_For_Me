import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_gmaps/directions_model.dart';
import 'package:flutter_gmaps/directions_repository.dart';
import 'package:flutter_gmaps/location.dart';
import 'package:flutter_gmaps/main.dart';
import 'package:flutter_gmaps/map2.dart';
import 'package:flutter_gmaps/views/constant/linkapi.dart';
import 'package:flutter_gmaps/views/crud.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapScreen extends StatefulWidget {
  var place;
  MapScreen({Key key, @required this.place}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var markers = HashSet<Marker>(); //array
  List<dynamic> data = [];
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(34.8959276, 35.8866900),
    zoom: 11.5,
  );

  void initState() {
    intilize();
    getData();
    super.initState();
  }

  Crud crud = Crud();
  Future<List<dynamic>> sendQuestion() async {
    setState(() {});
    var response = await crud.postRequest(linkMap, {
      "place_id": widget.place,
    });
    response = response["data"];
    var data2 = [];
    data2 = response.map((v) => Coordinates.fromJson(v)).toList();
    setState(() {});
    return data2;
  }

  LatLng pos1 = LatLng(34.912096609463646, 35.87502192859915);
  LatLng pos2;
  intilize() async {
    data = await sendQuestion();

    data.forEach((element) {
      Marker lolo = Marker(
        markerId: MarkerId(element.id),
        position: LatLng(element.latitude, element.longitude),
        infoWindow: InfoWindow(
          onTap: () async {
            LatLng pos1 = LatLng(34.912096609463646, 35.87502192859915);
            LatLng pos2 = LatLng(element.latitude, element.longitude);
            final directions = await DirectionsRepository()
                .getDirections(origin: pos1, destination: pos2);
            setState(() => _info = directions);
          },
          title: (element.deviceName),
        ),
        // onTap: ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        // onTap: () {

        //   pos2 = LatLng(element.latitude, element.longitude);
        //   // Get directions
        //   final directions = await DirectionsRepository()
        //       .getDirections(origin: pos1, destination: pos2);
        //   setState(() => _info = directions);
        // }
      );
      markers.add(lolo);

      // var mydistance = Geolocator.distanceBetween(34.8652593578723,
      //     35.936890560098085, element.latitude, element.longitude);
    });

    setState(() {});
  }

  // double calculateDistance(lat1, lon1, lat2, lon2) {
  //   var p = 0.017453292519943295;
  //   var c = cos;
  //   var a = 0.5 -
  //       c((lat2 - lat1) * p) / 2 +
  //       c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  //   return 12742 * asin(sqrt(a));
  // }

  // print(totalDistance);

  GoogleMapController _googleMapController;
  // Marker _origin;
  // Marker _destination;
  Directions _info;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  var listsearch = [];
  Future getData() async {
    // var url = "http://192.168.1.7/decide_for_me/search.php";
    // var response = await http.get(Uri.parse(url));/
    // var responsebody = jsonDecode(response.body);
    var responsebody = await crud.getRequest(linkSearch);

    for (int i = 0; i < responsebody.length; i++) {
      listsearch.add(responsebody[i]['product_name']);
    }
  }
  // Future getSearchData() async {
  //   var url = "http://192.168.1.6/decide_for_me/searchresult.php";
  //   var data = {""}
  //   var response = await http.get(Uri.parse(url));
  //   var responsebody = jsonDecode(response.body);

  //   for (int i = 0; i < responsebody.length; i++) {
  //     listsearch.add(responsebody[i]['product_name']);
  //   }
  // }
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearch = Text("Decide For Me");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: cusSearch,
        titleSpacing: 4,
        backgroundColor: Color.fromARGB(255, 57, 147, 161),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: cusIcon,
            onPressed: () {
              setState(() {
                if (this.cusIcon.icon == Icons.search) {
                  this.cusIcon = Icon(Icons.cancel);
                  this.cusSearch = TextField(
                    controller: TextEditingController(),
                    // onTap: (() {
                    //   Navigator.of(context).pushNamed("login");
                    // }),
                    textInputAction: TextInputAction.send,
                    onSubmitted: (value) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Map2(place: value)));
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),

                        // border: OutlineInputBorder(
                        //   // borderRadius:
                        //   // new BorderRadius.all(Radius.circular(20.0)),
                        //   borderSide: BorderSide(
                        //       color: Color.fromARGB(255, 239, 240, 243),
                        //       width: 1.0,
                        //       style: BorderStyle.solid),
                        // ),
                        hintText: "Search what you want",
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        hintStyle: TextStyle(
                            color: Color.fromARGB(211, 255, 255, 255))),
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  );
                } else {
                  this.cusIcon = Icon(Icons.search);
                  this.cusSearch = Text(
                    "Decide For Me",
                    style: TextStyle(color: Colors.white),
                  );
                }
              });
            },
          ),
          IconButton(
              onPressed: () {
                sharedPref.clear();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("login", (route) => false);
              },
              icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            //markers : markers,
            markers: markers.map((e) => e).toSet(),

            polylines: {
              if (_info != null)
                Polyline(
                  polylineId: const PolylineId('overview_polyline'),
                  color: Colors.red,
                  width: 5,
                  points: _info.polylinePoints
                      .map((e) => LatLng(e.latitude, e.longitude))
                      .toList(),
                ),
            },
            // onLongPress: _addMarker,
          ),
          if (_info != null)
            Positioned(
              top: 20.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: Text(
                  '${_info.totalDistance}, ${_info.totalDuration}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () async {
          // Position position = await _determinePosition();

          _googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(34.912096609463646, 35.87502192859915),
                  zoom: 14)));
          markers.add(Marker(
              markerId: MarkerId("current"),
              position: LatLng(34.912096609463646, 35.87502192859915)));
          setState(() {});
          await mydistance();
        },
        // onPressed: () => _googleMapController.animateCamera(
        //   _info != null
        //       ? CameraUpdate.newLatLngBounds(_info.bounds, 100.0)
        //       : CameraUpdate.newCameraPosition(_initialCameraPosition),
        // ),
        child: const Icon(Icons.my_location),
      ),
    );
  }

  // Future<Position> _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location Services are disabled');
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();

  //     if (permission == LocationPermission.denied) {
  //       return Future.error("Location permission denied");
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error("location permission are permanently denied");
  //   }
  //   Position position = await Geolocator.getCurrentPosition();
  //   return position;
  // }

  // void _addMarker(LatLng pos) async {
  // if (_origin == null || (_origin != null && _destination != null)) {
  //   // Origin is not set OR Origin/Destination are both set
  //   // Set origin
  //   setState(() {
  //     _origin = Marker(
  //       markerId: const MarkerId('origin'),
  //       infoWindow: const InfoWindow(title: 'Origin'),
  //       icon:
  //           BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  //       position: pos, //هون لازم غير
  //     );
  //     // Reset destination
  //     _destination = null;

  //     // Reset info
  //     _info = null;
  //   });
  // } else {
  //   // Origin is already set
  //   // Set destination
  //   setState(() {
  //     _destination = Marker(
  //       markerId: const MarkerId('destination'),
  //       infoWindow: const InfoWindow(title: 'Destination'),
  //       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //       position: pos,
  //     );
  //   });
  Future mydistance() async {
    setState(() {});
    var response = await crud.postRequest(linkMap, {
      "place_id": widget.place,
    });
    response = response["distance"];
    var data2 = [];
    data2 = response.map((v) => Coordinates.fromJson(v)).toList();
    setState(() {});
    LatLng pos1 = LatLng(34.912096609463646, 35.87502192859915);
    LatLng pos2;
    data2.forEach((element) {
      pos2 = LatLng(element.latitude, element.longitude);
    });
    // Get directions
    final directions = await DirectionsRepository()
        .getDirections(origin: pos1, destination: pos2);
    setState(() => _info = directions);
  }
  // }
}

// class DataSearch extends SearchDelegate<String> {
//   List<dynamic> list;
//   DataSearch({this.list});
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     // action appbar
//     return [
//       IconButton(
//           onPressed: () {
//             query = "";
//           },
//           icon: Icon(Icons.clear))
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     // الايقونة قبل المربع النصي
//     // throw UnimplementedError();
//     return IconButton(
//         onPressed: () {
//           close(context, null);
//         },
//         icon: Icon(Icons.arrow_back));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // result search
//     // Future.delayed(Duration.zero, () {
//     //   close(context, query);
//     // });

//     return Map2(place: query);

//     // Navigator.of(context).push(MaterialPageRoute(
//     //                                   builder: (context) => Map2(place: query)));

//     // FutureBuilder(
//     //     future: getSearchData(),
//     //     builder: (BuildContext context, AsyncSnapshot snapshot) {
//     //       if (snapshot.hasData) {
//     //         return ListView.builder(
//     //             itemCount: snapshot.data.length,
//     //             itemBuilder: (context, i) {
//     //               Map2(place: snapshot.data[i]);
//     //             });
//     //       }
//     //     });
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // show when search something
//     var searchlist =
//         query.isEmpty ? list : list.where((p) => p.startsWith(query)).toList();
//     return ListView.builder(
//         itemCount: searchlist.length,
//         itemBuilder: (context, i) {
//           return ListTile(
//             leading: Icon(Icons.mobile_screen_share),
//             title: Text(searchlist[i]),
//             onTap: () {
//               query = searchlist[i];
//               showResults(context);
//             },
//           );
//         });
//   }
// }
