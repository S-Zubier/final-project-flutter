import 'package:flutter/material.dart';
import 'package:mobile_project/Screens/profilePage.dart';

class Settingscreen extends StatefulWidget {
  const Settingscreen({super.key});

  @override
  State<Settingscreen> createState() => _SettingscreenState();
}

class _SettingscreenState extends State<Settingscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: const Text('Setting', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/images/logoshop.png',scale: 1.3,),


          ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
   //  ScaffoldMessenger.of(context).showSnackBar(
      //const SnackBar(content: Text('Will Make It Soon')));
    },
      leading: const Icon(Icons.key, color: Colors.red),
      title: const Text(' Account'),
            subtitle: const Text('Your Account'),
          ),
          const Divider(),

          ListTile(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Will Make It Soon')));
            },
            leading: const Icon(Icons.notifications, color: Colors.red),
            title: const Text(' Notifications'),
          ),
          const Divider(),

          ListTile(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Will Make It Soon')));
            },
            leading: const Icon(Icons.location_on_outlined, color: Colors.red),
            title: const Text('  Addresses'),
            subtitle: const Text('Add your Address'),

          ),
          const Divider(),

          ListTile(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Will Make It Soon')));
            },
            leading: const Icon(Icons.phone, color: Colors.red),
            title: const Text(' Live Support'),
            subtitle: const Text('Support agents are available 24 hours to help.'),
          ),
          const Divider(),

          ListTile(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Will Make It Soon')));
            },
            leading: const Icon(Icons.payments_outlined, color: Colors.red),
            title: const Text(' Payment'),
            subtitle: const Text('Payment Options:'),
          ),
          
          Image.asset('assets/images/cashOronline.png',
            scale: 2.5,

          )
        ],
      ),
    );
  }
}
