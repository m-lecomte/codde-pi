/*import 'package:codde_pi/src/model/device/device.dart';
import 'package:codde_pi/src/model/device/device_card.dart';
import 'package:codde_pi/src/model/user/leave.dart';
import 'package:codde_pi/src/model/user/user_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'license.dart';

class Settings extends StatefulWidget {
  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(),
      bottomNavigationBar: null,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserInfo(),
          Row(mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Text('Device'/*, style: Theme.of(context).textTheme.headline5*/),
                ),
                SizedBox(width: 8.0,),
                Expanded(child: Container(color: Colors.white, height: 1.0)),
              ]),
          DeviceList(),
          Row(mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Text('Conditions of use'/*, style: Theme.of(context).textTheme.headline5*/),
                ),
                SizedBox(width: 8.0,),
                Expanded(child: Container(color: Colors.white, height: 1.0)),
              ]),
          ListTile(
              title: Text('Terms and conditions of use'),
            onTap:  () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => License('https://dopy.tech/cgu')),
              );
            },
          ),
          ListTile(
              title: Text('Privacy Charter'),
            onTap:  () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => License('https://dopy.tech/privacy')),
              );
            },
          ),
          ListTile(
            title: Text('License Creative Commons 4.0 BY-NC-ND'),
            onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => License('https://creativecommons.org/licenses/by-nc-nd/4.0/deed.fr')),
            );
          },
          ),
          ListTile(title: Text('Copyright © 2022 Mathis Lecomte, All rights reserved.')),
          ListTile(
              title: Text('Thanks'),
            onTap: () => showDialog(context: context, builder: (BuildContext context) {
              return AlertDialog(
                content: SingleChildScrollView(
                  child: Text('Server icons created by Freepik - Flaticon - https://www.flaticon.com/free-icons/server\n\n'
                      'Remote Desktop Icon - Flaticon - https://www.flaticon.com/free-icons/remote-desktop')
                ),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: Text('OK')),
                ],
              );
            }),
          ),
          Row(mainAxisSize: MainAxisSize.max,
              children: [
          Padding(
            padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Text('Leave'/*, style: Theme.of(context).textTheme.headline5*/),
          ),
            SizedBox(width: 8.0,),
            Expanded(child: Container(color: Colors.white, height: 1.0)),
    ]),
          LeaveCard(setState)
        ],
      ),
      ),
    );
  }

}*/