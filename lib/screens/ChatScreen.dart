import 'package:flutter/material.dart';
import 'package:stream/global_data.dart';
import 'package:stream/models/message.dart';
import 'package:stream/network.dart/message_network.dart';
import 'package:stream/widgets/my_bottom_bar.dart';

class ChatScreen extends StatefulWidget{
  final String username;

  const ChatScreen({super.key, required this.username});

  @override
  State<ChatScreen> createState() => _ChatScreenState(username: username);
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController listViewScrollController=ScrollController(
    
  );
  final String username;
  double? width;
  bool isFabVisible=false;
  double? height;  
  TextEditingController chatController =TextEditingController();
  MessageNetwork messageNetwork=MessageNetwork();

  _ChatScreenState({required this.username});

  @override
  void initState() {
   
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    
    width =MediaQuery.sizeOf(context).width;
    height =MediaQuery.sizeOf(context).height;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(
        children: [
          const CircleAvatar(child: Icon(Icons.person),),
          const SizedBox(width: 10,),
          Text(username),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
      ),
      body: StreamBuilder(stream: messageNetwork.getMessages(username), builder: (context,snapshot){
        if (snapshot.hasError){
          print(snapshot.error);
          return const Center(
            child: Text("Problem"),
          );
          
        }
        else if(snapshot.connectionState==ConnectionState.waiting){
          return const LinearProgressIndicator();

        }
        else{
          
       
          return Container(
            child: ListView.builder(
              controller: listViewScrollController,
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) { 
                // listViewScrollController.animateTo(listViewScrollController.position.maxScrollExtent,
                // curve: Curves.easeOut,
                // duration: const Duration(milliseconds: 500)
                // );
                 WidgetsBinding.instance.addPostFrameCallback((_) {
                  
                  print('here');
      listViewScrollController.animateTo(
        listViewScrollController.position.maxScrollExtent, 

        duration: const Duration(milliseconds: 
 500), // Adjust animation duration as needed
        curve: Curves.easeInOut,
      );
      //  listViewScrollController.addListener((){
      //   if(listViewScrollController.position==listViewScrollController.position.maxScrollExtent){
      //     isFabVisible=false;
      //   }
      //   else{
      //     isFabVisible=true;
      //   }
      //   });
    });
    // Navigator.pop(context);
              return Directionality(
                textDirection: (snapshot.data!.docs[index]['sender']==GlobalData.user.username)?TextDirection.rtl:TextDirection.ltr,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        // width: 10,
                        // height: 100,
                        // width: 10,
                        constraints: BoxConstraints(maxWidth: width!*0.6),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          color: (snapshot.data!.docs[index]['sender']==GlobalData.user.username)?Theme.of(context).primaryColor:Theme.of(context).dividerColor
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(snapshot.data!.docs[index]['message'],
                          style: const TextStyle(
                            color: Colors.white
                          ),
                          ),
                        )),
                    ],
                  ),
                ));
             },
            
            ),
          );
        }
        
      }),
      floatingActionButton: Visibility(
        visible: false,
        // visible: (listViewScrollController.position!=listViewScrollController.position.maxScrollExtent),
        child: FloatingActionButton(onPressed: (){
          
        },
        child: Icon(Icons.arrow_downward,
        size: 25,
        color: Theme.of(context).primaryColor,
        ),
        ),
      ),
      bottomNavigationBar: MessageBottomBar(width: width,messageNetwork:messageNetwork, chatController: chatController,username:username),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}

