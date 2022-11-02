import 'package:alqgp/screens/lessons/lessonsList.dart';
import 'package:flutter/material.dart';
import 'package:alqgp/screens/chapters.dart';
import 'package:alqgp/screens/chapterContent.dart';

class Body extends StatelessWidget {
  const Body({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 60, bottom: 50, right: 60, top: 70),
          child: Text(
            "Welcame to ALQ",
            style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 196, 93, 83),
            ),
          ),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.only(left: 20, bottom: 0, right: 20, top: 0),
              child: Wrap(
                alignment: WrapAlignment.start,
                children: [
                  //chapter1 size
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 46, 94, 107),
                      onPrimary: Colors.white,
                      shadowColor: Color.fromARGB(255, 71, 145, 165),
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(150, 140),
                      //internal content margin
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const chapterContent()),
                      );
                    },
                    child: Material(
                      color: Color.fromARGB(255, 46, 94, 107),
                      //elevation:8,
                      //borderRadius: BorderRadius.circular(28),
                      //clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const chapterContent()),
                          );
                        },
                        child: Column(
                          //mainAxisAlignment: MainAxisSize.min,
                          children: [
                            Ink.image(
                              image: AssetImage('images/Picture4.png'),
                              height: 100,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              'Circulatory system',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            SizedBox(height: 6),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 5,
                    color: Colors.blue,
                  ),
                  //Divider(),//new line
                  //chapter2 size
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 46, 94, 107),
                      onPrimary: Colors.white,
                      shadowColor: Color.fromARGB(255, 71, 145, 165),
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(150, 140),
                      //internal content margin
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const chapterContent()),
                      );
                    },
                    child: Material(
                      color: Color.fromARGB(255, 46, 94, 107),
                      //elevation:8,
                      //borderRadius: BorderRadius.circular(28),
                      //clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const chapterContent()),
                          );
                        },
                        child: Column(
                          //mainAxisAlignment: MainAxisSize.min,
                          children: [
                            Ink.image(
                              image: AssetImage('images/Picture1.png'),
                              height: 100,
                              width: 55,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              'Respiratory system',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            SizedBox(height: 6),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  //chapter3 size
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 46, 94, 107),
                      onPrimary: Colors.white,
                      shadowColor: Color.fromARGB(255, 71, 145, 165),
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(150, 140),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const chapterContent()),
                      );
                    },
                    child: Material(
                      color: Color.fromARGB(255, 46, 94, 107),
                      //elevation:8,
                      //borderRadius: BorderRadius.circular(28),
                      //clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const chapterContent()),
                          );
                        },
                        child: Column(
                          //mainAxisAlignment: MainAxisSize.min,
                          children: [
                            Ink.image(
                              image: AssetImage('images/Picture2.png'),
                              height: 100,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              'Digestive system',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            SizedBox(height: 6),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 5,
                    color: Colors.blue,
                  ),
                  //chapter4 size
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 46, 94, 107),
                      onPrimary: Colors.white,
                      shadowColor: Color.fromARGB(255, 71, 145, 165),
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(150, 140),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const chapterContent()),
                      );
                    },
                    child: Material(
                      color: Color.fromARGB(255, 46, 94, 107),
                      //elevation:8,
                      //borderRadius: BorderRadius.circular(28),
                      //clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const chapterContent()),
                          );
                        },
                        child: Column(
                          //mainAxisAlignment: MainAxisSize.min,
                          children: [
                            Ink.image(
                              image: AssetImage('images/Picture5.png'),
                              height: 100,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              'Urinary system',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            SizedBox(height: 6),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  //chapter5 size
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 46, 94, 107),
                      onPrimary: Colors.white,
                      shadowColor: Color.fromARGB(255, 71, 145, 165),
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(150, 140),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const chapterContent()),
                      );
                    },
                    child: Material(
                      color: Color.fromARGB(255, 46, 94, 107),
                      //elevation:8,
                      //borderRadius: BorderRadius.circular(28),
                      //clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const chapterContent()),
                          );
                        },
                        child: Column(
                          //mainAxisAlignment: MainAxisSize.min,
                          children: [
                            Ink.image(
                              image: AssetImage('images/Picture3.png'),
                              height: 100,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              'Muscular system',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            SizedBox(height: 6),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}

class Body2 extends StatelessWidget {
  const Body2({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 60, bottom: 70, right: 60, top: 70),
          child: Text(
            "Chapter number ?", //name of the chapter
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.only(left: 20, bottom: 0, right: 20, top: 0),
              child: Wrap(
                alignment: WrapAlignment.start,
                children: [
                  //chapter1 size
                  ButtonTheme(
                    minWidth: 200.0,
                    height: 100.0,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 46, 94, 107),
                          onPrimary: Colors.white,
                          shadowColor: Color.fromARGB(255, 71, 145, 165),
                          elevation: 9,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: Size(150, 150),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const chapterContent()),
                          );
                        },
                        child: Text("AR")),
                  ),
                  Spacer(),
                  Container(
                    width: 5,
                    color: Colors.blue,
                  ),
                  //Divider(),//new line
                  //chapter2 size
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 46, 94, 107),
                        onPrimary: Colors.white,
                        shadowColor: Color.fromARGB(255, 71, 145, 165),
                        elevation: 9,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: Size(150, 150),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Lessons.screenRout);
                      },
                      child: Text("Lessons")),
                  Divider(),
                  //chapter3 size
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 46, 94, 107),
                        onPrimary: Colors.white,
                        shadowColor: Color.fromARGB(255, 71, 145, 165),
                        elevation: 9,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: Size(300, 150),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const chapterContent()),
                        );
                      },
                      child: Text("Quiz")),
                ],
              )),
        ),
      ],
    );
  }
}

//chpters
/*

backgound :

              /*
              
              GestureDetector(
                    child: Container(
                    width:150,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image:AssetImage("images/1.png"), 
                        fit:BoxFit.cover
                      ),
                    )
                    )
                  ),
              primary: Color.fromARGB(255, 196, 93, 83),
                    onPrimary: Colors.white,
                    shadowColor: Color.fromARGB(255, 234, 134, 117),
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("images/backgraund.png"), fit: BoxFit.cover,),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/backgraund.png"), fit: BoxFit.cover),
          ),
          child: Center(child: FlutterLogo(size: 300)),
        ),
        Positioned.fill(  //
            child: Image(
              image: AssetImage('images/backgraund.png'),
              fit : BoxFit.fill,
           ),
          ), 
        */
              Expanded(
          child: Padding(
            padding: EdgeInsets.only(left:20, bottom: 20, right: 20, top:20),
            child: Wrap(
                alignment: WrapAlignment.start,
                children: [
                //chapter1 size
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(50) 
                      //internal content margin
                  ),
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const chapterContent()),
                  );
                  },
                  child: Text("AR")
                ),
              ],)
          ),
        ),
              //Divider(),//new line
                //chapter2 size
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(50)),
                  onPressed: (){},
                  child: Text("lessons")
                ),
                //chapter2 size
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(50)),
                  onPressed: (){},
                  child: Text("Quiz")
                ),


            

                Divider(),
                //chapter2 size
                ElevatedButton(
                  onPressed: (){},
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child:Text("chapter2")
                  )
                )
                */  