import 'package:flutter/material.dart';
import 'package:stream/global_data.dart';
import 'package:stream/network.dart/user_network.dart';
import 'package:stream/widgets/users/profile_widgets.dart';

class ProfileScreen extends StatelessWidget{
  UserNetwork userNetwork=UserNetwork();
  TextEditingController firstnameController=TextEditingController(text: GlobalData.user.firstName??'');
  TextEditingController lastnameController=TextEditingController(text: GlobalData.user.lastName??'');
  TextEditingController ageController=TextEditingController(text: (GlobalData.user.age!=null)?GlobalData.user.age.toString():'');
  TextEditingController birthController=TextEditingController(text: (GlobalData.user.birthDate!=null)?GlobalData.user.birthDate.toString():'');
  TextEditingController countryController=TextEditingController(text: GlobalData.user.country??'');
  TextEditingController stateController=TextEditingController(text: GlobalData.user.state??'');
  TextEditingController cityController=TextEditingController(text: GlobalData.user.city??'');
  TextEditingController addressController=TextEditingController(text: GlobalData.user.address??'');
  TextEditingController emailController=TextEditingController(text: GlobalData.user.email??'');
  TextEditingController phoneController=TextEditingController(text: (GlobalData.user.phone!=null)?GlobalData.user.phone.toString():'');
  TextEditingController zipController=TextEditingController(text: (GlobalData.user.zipCode!=null)?GlobalData.user.zipCode.toString():'');
  // TextEditingController firstnameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"),
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
      
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            shrinkWrap: true,
            // mainAxisSize: MainAxisSize.min,
            // shrinkWrap: true,
            children: [
              Center(child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.person,
                  size: 70,
                  ),),
                  Text(GlobalData.user.username!),
                ],
              )),
              
              SizedBox(height: 10,),
              RowInfoWidget(textController: firstnameController,txt:"First Name",keyboardType: TextInputType.text,),
              SizedBox(height: 4,),
              Divider(),
              SizedBox(height: 4,),
              RowInfoWidget(textController: lastnameController,txt:"Last Name",keyboardType: TextInputType.text,),
              SizedBox(height: 4,),
              Divider(),
              SizedBox(height: 4,),
              RowInfoWidget(textController: emailController,txt:"Email",keyboardType: TextInputType.emailAddress,),
              SizedBox(height: 4,),
              Divider(),
              SizedBox(height: 4,),
              RowInfoWidget(textController: phoneController,txt:"Phone",keyboardType: TextInputType.phone,),
              SizedBox(height: 4,),
              Divider(),
              SizedBox(height: 4,),
              RowInfoWidget(textController: countryController,txt:"Country ",keyboardType: TextInputType.text,),
              SizedBox(height: 4,),
              Divider(),
              SizedBox(height: 4,),
              RowInfoWidget(textController: stateController,txt:"State ",keyboardType: TextInputType.text,),
              SizedBox(height: 4,),
              Divider(),
              SizedBox(height: 4,),
              RowInfoWidget(textController: cityController,txt:"City ",keyboardType: TextInputType.text,),
              SizedBox(height: 4,),
              Divider(),
              SizedBox(height: 4,),
              RowInfoWidget(textController: addressController,txt:"Address ",keyboardType: TextInputType.streetAddress,),
              SizedBox(height: 4,),
              Divider(),
              SizedBox(height: 4,),
              RowInfoWidget(textController: ageController,txt:"Age ",keyboardType: TextInputType.number,),
              SizedBox(height: 4,),
              Divider(),
              SizedBox(height: 4,),
              RowInfoWidget(textController: birthController,txt:"Birth Date",keyboardType: TextInputType.datetime,),
              SizedBox(height: 4,),
              Divider(),
              SizedBox(height: 4,),
              RowInfoWidget(textController: zipController,txt:"Zip Code",keyboardType: TextInputType.number,),
              // RowInfoWidget(textController: firstnameController,txt:"Birth Date",),
              // RowInfoWidget(textController: firstnameController,txt:"Birth Date",),
              // RowInfoWidget(textController: firstnameController,txt:"Birth Date",),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                userNetwork.updateUser(firstName:firstnameController.text,lastName: lastnameController.text,address: addressController.text,age: ageController.text,birthDate: birthController.text,city: cityController.text,country: countryController.text,email: emailController.text,phone: phoneController.text,state: stateController.text,zipCode: zipController.text);
              }, child: Text("Confirm"))
              
            ],
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}

