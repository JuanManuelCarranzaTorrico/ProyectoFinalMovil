import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
class FullScreenMap extends StatefulWidget {

  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  MapboxMapController mapController;
  var center =LatLng(-16.504293, -68.131189);
  var hop =LatLng(-16.507732, -68.118794);
  var aereo =LatLng(-16.509747, -68.187412);
  var inlasa =LatLng(-16.508838, -68.117576);
  var puc =LatLng(-16.500905, -68.127990);
  var luna =LatLng(-16.567596, -68.093866);
  var typica =LatLng(-16.510808, -68.124645);
  var jabo =LatLng(-16.503402, -68.117313);
  var monti =LatLng(-16.513483, -68.127044);
  String selectedStyle = "mapbox://styles/juancarranza/ckpbzq7iu15ih17qnlhn4crna";
  final oscuroStyle="mapbox://styles/juancarranza/ckpbzlrno0vn117mzmm3sfm03";
  final streedStyle="mapbox://styles/juancarranza/ckpbzq7iu15ih17qnlhn4crna";
  final lpcolor="mapbox://styles/juancarranza/ckpcq06mh04g417pcvx7ircww";
  final satelite="mapbox://styles/juancarranza/ckpcqaygy0ko318mfl4901zr1";

  void _onMapCreated(MapboxMapController controller) {
  mapController = controller;
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text ('Proyecto final'),
          actions: <Widget>[
            mppb1(),
            mppb()
          ],
        ),
      body:  crearMapa(),
      floatingActionButton: botones(),
      );
  }

  Column botones() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // FloatingActionButton(
        //   child: Icon( Icons.sentiment_satisfied),
        //   onPressed: (){
        //     mapController.addSymbol(SymbolOptions(
        //       geometry: center,
        //       iconSize: 2,
        //       iconImage: 'attraction-15',
        //       textField: "montaña Creada aqui",
        //       textOffset: Offset(0, 1)
        //        ),);
        //   }),
      // FloatingActionButton(
      //   child:Icon(Icons.add_alert),
      //   onPressed: (){
      //     if(selectedStyle==oscuroStyle){
      //       selectedStyle=streedStyle;
      //     }
      //     else{
      //       selectedStyle=oscuroStyle;
      //     }
      //     setState(() {
            
      //     });
      //   }),
        FloatingActionButton(
          child: Icon( Icons.zoom_in),
          onPressed: (){
            mapController.animateCamera(CameraUpdate.zoomIn());
          }),
           FloatingActionButton(
          child: Icon( Icons.zoom_out),
          onPressed: (){
            mapController.animateCamera(CameraUpdate.zoomOut());
          }),

        
    ],);
  }

  MapboxMap crearMapa() {
    return MapboxMap(
      styleString: selectedStyle,
      onMapCreated: _onMapCreated,
      initialCameraPosition:
       CameraPosition(target: center,
      zoom: 14),
  );
  }

  Widget mppb(){
    return PopupMenuButton(
        itemBuilder: (ctx) => [
          PopupMenuItem(child: Text('Calles'), value: '0',),
          PopupMenuItem(child: Text('Tema oscuro'), value: '1',),
          PopupMenuItem(child: Text('satelite'), value: '2',),
          PopupMenuItem(child: Text('Colores La Paz'), value: '3',),
          
        ],
      onSelected: (value){
          setState(() {
            switch(value){
              case '0':
                selectedStyle=streedStyle;
                break;
              case '1':
                selectedStyle=oscuroStyle;
                break;
              case '2':
                selectedStyle=satelite;
                break;
              case '3':
                selectedStyle=lpcolor;

                break;
              case '4':
                

                break;

            }
          });
      },
    );
  }
  Widget mppb1(){
    return PopupMenuButton(
        itemBuilder: (ctx) => [
          PopupMenuItem(child: Row(
                      children: <Widget>[
                        Icon(Icons.local_hospital_outlined,color: Colors.black),
                        Text('Hospital general'),
                      ],
                    ), value: '0',),
          PopupMenuItem(child: Row(
                      children: <Widget>[
                        Icon(Icons.airplanemode_active,color: Colors.black),
                        Text('Aereopuerto'),
                      ],
                    ), value: '1',),
          PopupMenuItem(child: Row(
                      children: <Widget>[
                        Icon(Icons.airport_shuttle ,color: Colors.black),
                        Text('PUC'),
                      ],
                    ), value: '2',),
          PopupMenuItem(child: Row(
                      children: <Widget>[
                        Icon(Icons.biotech,color: Colors.black),
                        Text('Inlasa'),
                      ],
                    ), value: '3',),
          PopupMenuItem(child: Row(
                      children: <Widget>[
                        Icon(Icons.brightness_4_outlined,color: Colors.black),
                        Text('Valle de la luna'),
                      ],
                    ), value: '4',),
          PopupMenuItem(child: Row(
                      children: <Widget>[
                        Icon(Icons.color_lens ,color: Colors.black),
                        Text('Museo nacional de arte'),
                      ],
                    ), value: '5',),
          PopupMenuItem(child: Row(
                      children: <Widget>[
                        Icon(Icons.deck_sharp ,color: Colors.black),
                        Text('Typica'),
                      ],
                    ), value: '5',),
          PopupMenuItem(child: Row(
                      children: <Widget>[
                        Icon(Icons.emoji_nature ,color: Colors.black),
                        Text('Jardin Botanico'),
                      ],
                    ), value: '6',),
          PopupMenuItem(child: Row(
                      children: <Widget>[
                        Icon(Icons.emoji_nature ,color: Colors.black),
                        Text('Monticulo'),
                      ],
                    ), value: '7',),
        ],
      onSelected: (value){
          setState(() {
            switch(value){
              case '0':
                
                mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: hop,
            zoom: 16.0,
          ),));
                
                break;
              case '1':
                mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: aereo,
            zoom: 16.0,
          ),));
                break;
              case '2':
                mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: puc,
            zoom: 16.0,
          ),));
                break;
              case '3':
                mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: inlasa,
            zoom: 16.0,
          ),));

                break;
              case '4':
                mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: luna,
            zoom: 16.0,
          ),));

                break;
              case '5':
                mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: aereo,
            zoom: 16.0,
          ),));

                break;
              case '6':
                mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: typica,
            zoom: 16.0,
          ),));

                break;
              case '7':
                mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: monti,
            zoom: 16.0,
          ),));

                break;

            }
          });
      },
    );
  }
}