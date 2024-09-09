import 'package:flutter/material.dart';

class RowInfoWidget extends StatelessWidget {
  const RowInfoWidget({
    super.key,
    required this.textController, required this.txt, required this.keyboardType,
  });

  final TextEditingController textController;
  final String txt;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(txt),
        Container(
          width: MediaQuery.sizeOf(context).width*0.6,
          child: TextFormField(
            keyboardType: keyboardType,
                      
                        validator: (value) {
                          // if(value==''||value==null||value.isEmpty) {return 'This field is required';}
                          return null;
                        },
                        controller: textController,
                        decoration: InputDecoration(
                          // labelStyle: TextStyle(
                          //   color: Colors.red
                          // ),
                          hintText: txt,
                          hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                          labelText: txt,
                            fillColor: Colors.white,
                            border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                        ),
                      ),
        ),
      ],
    );
  }
}