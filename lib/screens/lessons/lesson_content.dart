import 'package:alqgp/models/lesson_model.dart';
import 'package:flutter/material.dart';

class LessonContent extends StatelessWidget {
  final LessonModle data;
  const LessonContent(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      height: 10000,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color.fromARGB(255, 156, 203, 247),
          //Color.fromARGB(255, 223, 115, 115)
          elevation: 0,
          title: Text(
            "${data.id}",
            style: TextStyle(
              fontSize: 23,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        // appBar: AppBar(
        //   title: Text('${data.id}'),
        // ),
        body: Column(children: [
          SizedBox(
              width: double.infinity,
              height: 50,
          ),
          Text(
            'Urinary System',
            //textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 223, 115, 115),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50),
            child:Text(
              'What is the urinary system ?',
              //textAlign: TextAlign.left,
              style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              //foreground: Paint()
              color: Color.fromARGB(255, 223, 115, 115),
            ),
          ),
          ),
          
           SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Urinary system is a body drainage system comprised of the group of organs that produce and excrete urine. It consists of the kidneys, ureters, urinary bladder and urethra.',
              //textAlign: TextAlign.left,
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              //foreground: Paint()
              color: Color.fromARGB(255, 156, 203, 247),
            ),
          ),
          ),
          
          SizedBox(
              width: double.infinity,
              height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: Text(
              'How dose the organs of this system work together?',
              //textAlign: TextAlign.left,
              style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              //foreground: Paint()
              color: Color.fromARGB(255, 223, 115, 115),
            ),
          ),
          ),
           SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              'Kidneys are paired bean-shaped organs placed retroperitoneally.\n\nThe kidneys have a rich blood supply provided by the renal artery.\n\nNephrons within the kidneys filter the blood that passes through their web of capillaries (glomerulus).\n\nThe blood filtrate then passes through a series of tubules and collecting ducts, eventually forming the final ultrafiltrate, urine. \n\nUrine passes into the ureters, tubes of smooth muscle that convey urine from the kidneys to the urinary bladder.\n\nThe bladder is a hollow muscular organ that collects and stores urine before disposal by urination (micturition).',
              //textAlign: TextAlign.left,
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              //foreground: Paint()
              color: Color.fromARGB(255, 156, 203, 247),
            ),
          ),
          ),
          SizedBox(
              width: double.infinity,
              height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: Text(
              'The main functions',
              //textAlign: TextAlign.left,
              style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              //foreground: Paint()
              color: Color.fromARGB(255, 223, 115, 115),
            ),
          ),
          ),
           SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              'Functions of the urinary system include; elimination of body waste, regulation of blood volume and blood pressure, regulation of electrolyte levels and blood pH.',
              //textAlign: TextAlign.left,
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              //foreground: Paint()
              color: Color.fromARGB(255, 156, 203, 247),
            ),
          ),
          ),
        ]),
      ),
    ));
  }
}

/*
'${data.des?.replaceAll("\\n", "\n")}',
            //'What is the urinary system?\nUrinary system is a body drainage system comprised of the group of organs that produce and excrete urine. It consists of the kidneys, ureters, urinary bladder and urethra.\nHow does the organs of this system work together?!\nKidneys are paired bean-shaped organs placed retroperitoneally. The kidneys have a rich blood supply provided by the renal artery.\n\nThe main functions:\nNephrons within the kidneys filter the blood that passes through their web of capillaries (glomerulus). The blood filtrate then passes through a series of tubules and collecting ducts, eventually forming the final ultrafiltrate, urine.\nUrine passes into the ureters, tubes of smooth muscle that convey urine from the kidneys to the urinary bladder. The bladder is a hollow muscular organ that collects and stores urine before disposal by urination (micturition).\nFunctions of the urinary system include; elimination of body waste, regulation of blood volume and blood pressure, regulation of electrolyte levels and blood pH.',
            style: TextStyle(fontSize: 20.0),
            */