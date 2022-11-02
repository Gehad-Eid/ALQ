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
          padding: EdgeInsets.only(left:60, bottom: 50, right: 60, top:70),
          child: Text(
            "Welcame to ALQ",
            style: TextStyle(
              fontSize: 30,
              color: Colors.black
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left:20, bottom: 0, right: 20, top:0),
            child: Wrap(
                alignment: WrapAlignment.start,
                children: [
                //chapter1 size
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 196, 93, 83),
                    onPrimary: Colors.white,
                    shadowColor: Color.fromARGB(255, 234, 134, 117),
                    elevation: 9,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(150, 140), 
                      //internal content margin
                  ),
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const chapterContent()),
                  );
                  },
                  child: Text("chapter1")
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
                    primary: Color.fromARGB(255, 196, 93, 83),
                    onPrimary: Colors.white,
                    shadowColor: Color.fromARGB(255, 234, 134, 117),
                    elevation: 9,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(150, 140),
                    ),
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const chapterContent()),
                  );
                  },
                  child: Text("chapter2")
                ),
                Divider(),
                //chapter3 size
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 196, 93, 83),
                    onPrimary: Colors.white,
                    shadowColor: Color.fromARGB(255, 234, 134, 117),
                    elevation: 9,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(150, 140),),
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const chapterContent()),
                  );
                  },
                  child: Text("chapter3")
                ),
                Spacer(),
                Container(
                  width: 5,
                  color: Colors.blue,
                ),
                //chapter4 size
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 196, 93, 83),
                    onPrimary: Colors.white,
                    shadowColor: Color.fromARGB(255, 234, 134, 117),
                    elevation: 9,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(150, 140),),
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const chapterContent()),
                  );
                  },
                  child: Text("chapter4")
                ),
                Divider(),
                //chapter5 size
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 196, 93, 83),
                    onPrimary: Colors.white,
                    shadowColor: Color.fromARGB(255, 234, 134, 117),
                    elevation: 9,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(150, 140),),
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const chapterContent()),
                  );
                  },
                  child: Text("chapter5")
                ), 
            ],)
          ),
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
          padding: EdgeInsets.only(left:60, bottom: 70, right: 60, top:70),
          child: Text(
            "Chapter number ?",//name of the chapter
            style: TextStyle(
              fontSize: 30,
              color: Colors.black
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left:20, bottom: 0, right: 20, top:0),
            child: Wrap(
                alignment: WrapAlignment.start,
                children: [
                //chapter1 size
                ButtonTheme(
                  minWidth: 200.0,
                  height: 100.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                     primary: Color.fromARGB(255, 196, 93, 83),
                    onPrimary: Colors.white,
                    shadowColor: Color.fromARGB(255, 234, 134, 117),
                    elevation: 9,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(150, 150),
                    ),
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const chapterContent()),
                  );
                  },
                  child: Text("AR")
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
                    primary: Color.fromARGB(255, 196, 93, 83),
                    onPrimary: Colors.white,
                    shadowColor: Color.fromARGB(255, 234, 134, 117),
                    elevation: 9,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(150, 150),
                    ),
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const chapterContent()),
                  );
                  },
                  child: Text("Lessons")
                ),
                Divider(),
                //chapter3 size
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 196, 93, 83),
                    onPrimary: Colors.white,
                    shadowColor: Color.fromARGB(255, 234, 134, 117),
                    elevation: 9,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(300, 150),
                    ),
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const chapterContent()),
                  );
                  },
                  child: Text("Quiz")
                ),
            ],)
          ),
        ),
      ],
    );
  }
}

//chpters
/*
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