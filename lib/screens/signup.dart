import 'package:alqgp/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';


class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {

  TextEditingController fname=TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password= TextEditingController();
  TextEditingController confirm =TextEditingController();

  @override
  void initState() {
    super.initState();
    ToastContext().init(context);

  }


  sign_up(){
    CollectionReference db = FirebaseFirestore.instance.collection("student");
    db.doc().set({
      "FIRST_NAME":fname.text,
      "LAST_NAME":lastname.text,
      "EMAIL":email.text,
      "PASSWORD":password.text,
    }).then((value){
        Toast.show("Account Registered", duration: Toast.lengthShort, gravity:  Toast.bottom);
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { 
        return WelcomeScreen();
       }));
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 177, 217),
      appBar: AppBar(title: Text("Sign Up"), backgroundColor: Colors.pinkAccent,),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Center(
            child: Column(
              children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Image.asset("images/logo.jpeg", width: 120, height: 120,)),
              Container(
                margin: EdgeInsets.only(top: 50),
               
                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Container(width: 100,child: Text("FIRST NAME :", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),),
                  Container(decoration: BoxDecoration(border: Border.all(color: Colors.pink), borderRadius: BorderRadius.circular(10)),width: 200,child: TextField(controller: fname,decoration: InputDecoration(hintText: " First Name"),),)
                ]),
              ),
               Container(
                margin: EdgeInsets.only(top: 10),
               
                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Container(width: 100,child: Text("LAST NAME :", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),),
                  Container(decoration: BoxDecoration(border: Border.all(color: Colors.pink), borderRadius: BorderRadius.circular(10)),width: 200,child: TextField(controller: lastname,decoration: InputDecoration(hintText: " Last Name"),),)
                ]),
              ),
               Container(
                margin: EdgeInsets.only(top: 10),
               
                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Container(width: 100,child: Text("EMAIL :", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),),
                  Container(decoration: BoxDecoration(border: Border.all(color: Colors.pink), borderRadius: BorderRadius.circular(10)),width: 200,child: TextField(controller: email,decoration: InputDecoration(hintText: " Email Address"),),)
                ]),
              ),
               Container(
                margin: EdgeInsets.only(top: 10),
               
                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Container(width: 100,child: Text("PASSWORD :", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),),
                  Container(decoration: BoxDecoration(border: Border.all(color: Colors.pink), borderRadius: BorderRadius.circular(10)),width: 200,child: TextField(controller: password,decoration: InputDecoration(hintText: " Password"),),)
                ]),
              ),
               Container(
                margin: EdgeInsets.only(top: 10),
               
                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Container(width: 100,child: Text("CONFIRM PASSWORD :", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),),
                  Container(decoration: BoxDecoration(border: Border.all(color: Colors.pink), borderRadius: BorderRadius.circular(10)),width: 200,child: TextField(controller: confirm,decoration: InputDecoration(hintText: " Confirm Password"),),)
                ]),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                width: 150,
                height: 50,
                child: ElevatedButton(onPressed: (){
                  sign_up();
                }, child: Text("Register"), style: ElevatedButton.styleFrom(primary: Colors.pinkAccent),),
              )
            ],),
          ),
        ),
      ),
    );
  }
}