import 'package:flutter/material.dart';

import '../../components/containers/text_box_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int? selected = 0;
  String? _occupation = "Student";
  var items = ["Student", "Professor", "Business", "Job", "Freelancer"];

  Widget customRadio(String text, int index) {
    return TextButton(
      onPressed: () {
        setState(() {
          selected = index;
        });
      },
      child: Text(
        text,
        style:
            TextStyle(color: (selected == index) ? Colors.black : Colors.white),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        backgroundColor: MaterialStateProperty.all(
            (selected == index) ? const Color(0xffffbc0e) : Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: 80,
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/Group.png'),
                        fit: BoxFit.contain),
                  ),
                )),
          ),
          Transform.translate(
            offset: const Offset(50, -40),
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/images/Gem.png")),
              ),
            ),
          ),
          Text(
            "vasusomani_2004",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[300], fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "My Details",
                style: TextStyle(color: Colors.grey[600]),
              )),
          MyTextBox(
            text: "Vasu Somani",
            sectionName: ("  Name"),
            onPressed: () => editField('Name'),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  const Text(
                    "Gender: ",
                    style: TextStyle(color: Colors.white),
                  ),
                  customRadio("Male", 1),
                  customRadio("Female", 2),
                  customRadio("Other", 3),
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyTextBox(
                  text: "20",
                  sectionName: "Age",
                  onPressed: () => editField('Age')),
              Transform.translate(
                offset: const Offset(-20, 0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.only(
                        left: 15, top: 10, right: 15, bottom: 5),
                    margin: const EdgeInsets.all(15),
                    child: Stack(
                      children: <Widget>[
                        Transform.translate(
                          offset: const Offset(0, -16.5),
                          child: Text(
                            "  Occupation".padRight(
                                "Occupation".length + "  ".length,
                                String.fromCharCodes([0x00A0, 0x0020])),
                            style: const TextStyle(
                              color: Colors.white,
                              backgroundColor: Colors.black,
                            ),
                          ),
                        ),
                        DropdownButton(
                          value: _occupation,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              child: Text(
                                items,
                                style:
                                    const TextStyle(color: Color(0xffffbc0e)),
                              ),
                              value: items,
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _occupation = newValue!;
                            });
                          },
                        ),
                      ],
                    )),
              )
            ],
          ),
          MyTextBox(
              text:
                  "HTML, CSS, JS, NodeJS, Flutter, Dart, Java, C++,HTML, CSS, JS, NodeJS",
              sectionName: "  Skills",
              onPressed: () => editField("Skills")),
          MyTextBox(
            text: "9876543210",
            sectionName: "  Mobile Number",
            onPressed: () => editField('Mobile Number'),
          ),
          MyTextBox(
            text: "abc_123@gmail.com",
            sectionName: "  Email ID",
            onPressed: () => editField('Email ID'),
          ),
          const SizedBox(height: 10),
          const Text(
            "Portfolio",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          MyTextBox(
            text: "Github",
            sectionName: "  Github",
            onPressed: () => editField("Github"),
          ),
          MyTextBox(
            text: "LinkedIn",
            sectionName: "  LinkedIn",
            onPressed: () => editField("LinkedIn"),
          ),
          MyTextBox(
            text: "Personal Website",
            sectionName: "  Personal Website",
            onPressed: () => editField("Website"),
          ),
        ],
      ),
    );
  }

  void editField(String fieldName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $fieldName'),
          content: TextField(
            onChanged: (value) {
              // Handle the text field value here
            },
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                // Handle save action here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
