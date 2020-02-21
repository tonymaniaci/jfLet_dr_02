import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc.dart';

import 'video_display.dart';


class PocWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeepLinkBloc _bloc = Provider.of<DeepLinkBloc>(context);
    return StreamBuilder<String>(
      stream: _bloc.state,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          //return Container(width: 0.0, height: 0.0);
          return Container(
              child: Center(
                //child: Text('Snap NO DATA, No deep link, ${snapshot.data}',
                child: Text('*** Login Error ***',
                style: TextStyle(fontSize: 20.0, color: Colors.red,fontWeight: FontWeight.w600),)));
        } else {
            return new VideoDisplayPage(uri: snapshot.data);
          /*return Container(
              child: Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new Text('Snap DATA, Redirected link, ${snapshot.data}',
                      style: TextStyle(fontSize: 20.0, color: Colors.blue,fontWeight: FontWeight.w600),),
                    new VideoDisplayPage(uri: snapshot.data),
                  ],
                ),),); */
        }
      },
    );
  }
}
