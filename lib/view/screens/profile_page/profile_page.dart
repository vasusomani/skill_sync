import 'package:flutter/material.dart';
import 'package:profile_page/components/text_box_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //edit field
  Future<void> editField(String field) async {

  }

  // int? _value = 1;
  int? selected=0;
  String? _occupation = "";
  var items=[
    "Student",
    "Professor",
    "Business",
    "Job",
    "Freelancer"
  ];
  Widget customRadio(String text, int index){
    return TextButton(
        onPressed: (){
          setState(() {
            selected=index;
          });
        },
      child: Text(
        text,
        style: TextStyle(color: (selected==index) ? Colors.black : Colors.white),

      ),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        backgroundColor: MaterialStateProperty.all((selected==index) ? Color(0xffffbc0e) : Colors.black),

      ),


    );
  }

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Profile Page",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
      //   backgroundColor: Colors.grey[900],
      // ),
      appBar: null,
      body:
      ListView(
        children: [
          const SizedBox(height: 50),
          //profile pic
          // Icon(Icons.person,size: 72,),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/Profile.png'))
            ),
          ),
              CircleAvatar(
                backgroundColor: Colors.green,
                // backgroundColor: Color(0xffffbc0e),
                radius: 80,
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 70,
                    child: Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage('assets/images/Group.png'),fit: BoxFit.contain),
                      ),
                      // child: Icon(Icons.person,size: 72,),
                      // child: CircleAvatar(
                      //   backgroundImage: AssetImage('assets/images/Group.png'),
                      //   radius: 100,
                      // )
                    )  //CircleAvatar
                ), //CircleAvatar
              ), //CircleAvatar


              Transform.translate(
                offset: const Offset(50, -40),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/Gem.png")),
                  ),
                ),),

          //Username
          Text(
            "abc123",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[700],fontSize: 20),
          ),

          const SizedBox(height: 50,),

          Padding(
              padding: const EdgeInsets.only(left:25.0),
              child: Text(
                "My Details",
                style: TextStyle(color: Colors.grey[600]),
              )
          ),

          MyTextBox(text: "Hello World", sectionName: ("  Name"),onPressed: ()=>editField('Name') , ),
          Padding(
              padding: const EdgeInsets.only(left:20.0),

              child: Row(
                children: [
                  Text("Gender: ",style: TextStyle(color: Colors.white),),
                  customRadio("Male", 1),
                  customRadio("Female", 2),
                  customRadio("Other", 3),
                  // Radio(
                  //     value: 1,
                  //     groupValue: _value,
                  //     onChanged: (value){
                  //       setState(() {
                  //         _value=value;
                  //         Container(
                  //           height: 40,
                  //           width: 40,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(20),
                  //             color: Color(0xffffbc0e),
                  //           ),
                  //           child: Text("Other",style: TextStyle(color: Colors.white)),
                  //
                  //         );
                  //       }
                  //     );
                  //     }
                  //     ),
                  // Text("Male",style: TextStyle(color: Colors.white),),
                  // Radio(
                  //     value: 2,
                  //     groupValue: _value,
                  //     onChanged: (value){
                  //       setState(() {
                  //         _value=value;
                  //         Container(
                  //           height: 40,
                  //           width: 40,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(20),
                  //             color: Color(0xffffbc0e),
                  //           ),
                  //           child: Text("Other",style: TextStyle(color: Colors.black)),
                  //
                  //         );
                  //       }
                  //       );
                  //     }
                  // ),
                  // Text("Female",style: TextStyle(color: Colors.white),),
                  // Radio(
                  //     value: 3,
                  //     groupValue: _value,
                  //     onChanged: (value){
                  //       setState(() {
                  //         _value=value;
                  //         Container(
                  //           height: 40,
                  //           width: 40,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(20),
                  //             color: Color(0xffffbc0e),
                  //           ),
                  //           child: Text("Other",style: TextStyle(color: Colors.black)),
                  //
                  //         );
                  //       }
                  //       );
                  //     }
                  // ),
                  // Text("Other",style: TextStyle(color: Colors.white),),

                ],
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyTextBox(text: "20", sectionName: "Age", onPressed: ()=>editField('Age')),
              // DropdownMenu(
              //   enableSearch: false,
              //   label: const Text("Occupation"),
              //   onSelected: (occupation){
              //     setState(() {
              //       _occupation=_occupation;
              //
              //     });
              //   },
              //     dropdownMenuEntries: <DropdownMenuEntry>[
              //   DropdownMenuEntry(value: "Student", label: "Student"),
              //   DropdownMenuEntry(value: "Professor", label:"Professor"),
              //   DropdownMenuEntry(value: "Business", label: "Business"),
              //   DropdownMenuEntry(value: "Job", label: "Job"),
              //   DropdownMenuEntry(value: "Freelancer", label: "Freelancer"),
              //
              //
              // ])
              Transform.translate(offset: const Offset(-20,0), child: Container(
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
                Transform.translate(offset: const Offset(0, -16.5),child: Text("  Occupation".padRight(
                  "Occupation".length + "  ".length,
                  String.fromCharCodes([
                    // no-brake space
                    0x00A0,
                    // space
                    0x0020
                  ])),style: TextStyle(color: Colors.white, backgroundColor: Colors.black,),),),
                  DropdownButton(
                    value: _occupation,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items){
                      return DropdownMenuItem(child: Text(items,style: TextStyle(color: Color(0xffffbc0e)),),value: items,);
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _occupation = newValue!;

                      });
                    },
                  ) ,

                  ],
                )

              ),
              )

              
            ],
          ),
          MyTextBox(text: "HTML, CSS, JS, NodeJS, Flutter, Dart, Java, C++,HTML, CSS, JS, NodeJS", sectionName: "  Skills",onPressed: ()=> editField("Skills")),
          MyTextBox(text: "9876543210", sectionName: "  Mobile Number", onPressed: ()=>editField('Mobile Number'),),
          MyTextBox(text: "abc_123@gmail.com", sectionName: "  Email ID", onPressed: ()=>editField('Email ID') ,),


          const SizedBox(height: 10,),
          Text("Portfolio",style: TextStyle(color: Colors.white,fontSize: 20),),
          MyTextBox(text: "Github", sectionName: "  Github", onPressed: ()=>editField("Github"),),
          MyTextBox(text: "LinkedIn", sectionName: "  LinkedIn", onPressed: ()=>editField("LinkedIn"),),
          MyTextBox(text: "Personal Website", sectionName: "  Personal Website", onPressed: ()=>editField("Website"),),




        ],
      ),
    );
  }
}
