import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stream/global_data.dart';
import 'package:stream/models/user.dart';
import 'package:stream/network.dart/user_network.dart';
import 'package:stream/screens/ChatScreen.dart';
import 'package:stream/screens/ProfileScreen.dart';
import 'package:stream/screens/login_screen.dart';

class UsersScreen extends StatelessWidget{
  UserNetwork userNetwork=UserNetwork();

  UsersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: MediaQuery.sizeOf(context).width*0.4,
        child: ListView(
          children: [
            ListTile(
              style: ListTileStyle.drawer,
              title: Row(
                children: [
                  const CircleAvatar(),
                  const SizedBox(width: 10,),
                  Text(GlobalData.user.username!),
                ],
              ),
            ),
            ListTile(
              
              onTap: (){
                GlobalData.user=User();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (Route<dynamic> route) => false);
              },
              style: ListTileStyle.drawer,
              title: Center(child: Container(
                width: MediaQuery.sizeOf(context).width*0.3,
                height: 40,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).primaryColor.withOpacity(0.2)
                ),
                child: const Center(child: Text("Logout")))),
            ),
            const Divider(),
             ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
              },
              style: ListTileStyle.drawer,
              title: Text("Profile"),
            ),
            const ListTile(
              style: ListTileStyle.drawer,
              title: Text("Friends"),
            ),
            const ListTile(
              style: ListTileStyle.drawer,
              title: Text("Settings"),
            ),
            const ListTile(
              style: ListTileStyle.drawer,
              title: Text("FAQ"),
            ),
            const ListTile(
              style: ListTileStyle.drawer,
              title: Text("Feedback"),
            ),
            
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
        title: const Text("Friends"),
        actions: const [Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(child: Icon(Icons.person),),
        )],
        ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: FutureBuilder(
            future: userNetwork.getUsers(),
            builder: (context,snapshot) {
              if(snapshot.connectionState==ConnectionState.done){
                if(snapshot.hasData){
                  List<QueryDocumentSnapshot<Map<String,dynamic>>> res= snapshot.data as List<QueryDocumentSnapshot<Map<String,dynamic>>>;
                  print(res.length);
                   return ListView.separated(
                    separatorBuilder: (context, index) {
            return const Divider();
          },
        
                itemCount: res.length,
                itemBuilder: (context,index){
                  return Container(
                    
                    child: Card(
                      child: ListTile(
                        style: ListTileStyle.list,
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(username: res[index].data()['username'],)));
                        },
                        title: Text(res[index].data()['username']),),
                    ),
                  );
        
                });
                }
                else{
                  return const Center(child: Text('Empty'));
                }
              }
              else if (snapshot.connectionState==ConnectionState.waiting){
                return const LinearProgressIndicator();
              }
              else{
                return const Text("Error");
              }
             
            }
          ),
        ),
      ),
      // bottomNavigationBar: MyBottomBar(),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}