import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final String img;
  final void Function()? onPressed;
  const MyTextBox({
    super.key,
    required this.text,
    required this.sectionName,
    required this.img,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.grey[200],
        color: Colors.black,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 5),
      margin: const EdgeInsets.all(15),

      child: Stack(
        children: <Widget>[
              // Positioned(
              //   top: -30.0,
              //   left: 10,
              //   child: Text(sectionName,style: TextStyle(color: Colors.white)),
              // ),
              Transform.translate(offset: const Offset(0, -16.5),child: Text(sectionName.padRight(
        sectionName.length + "  ".length,
        String.fromCharCodes([
          // no-brake space
          0x00A0,
          // space
          0x0020
        ])),style: TextStyle(color: Colors.white, backgroundColor: Colors.black,),),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  (img.compareTo(" ")!=0)?
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/"+img))
                    ),
                  ):Text(" "),
                  (sectionName.compareTo('Age')==0)?(SizedBox(width: 75,child: TextFormField(style: TextStyle(color: Color(0xffffbc0e)),),)):
                  Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText:'what people call you?',
                        ),
                        style: TextStyle(color: Color(0xffffbc0e)),
                      ),
                  ),
                  IconButton(
                      onPressed: onPressed,
                      icon: Icon(Icons.edit,color: Colors.grey[400])
                  )
                ],

              ),


            ],
          )



    );
  }
}
