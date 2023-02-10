
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../models/achive_modle.dart';
import 'package:alqgp/Settings/settings.dart';

class reportABugg extends StatefulWidget {
  static const String screenRout = 'Report A Bug';
  const reportABugg({Key? key}) : super(key: key);
  @override
  _reportABugg createState() => _reportABugg();
}

class _reportABugg extends State<reportABugg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Report A Bug",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        elevation: 0,
        centerTitle: true,
        //backgroundColor: Colors.transparent,
        backgroundColor: Color(0xFF8EA3E2),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //to center
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                // Container(
                //   height: 180,
                //   child: Image.asset('images/logo4.png'),
                // ),
                // const Text(
                //   'عَــلَــــق ',
                //   style: TextStyle(
                //     fontSize: 40,
                //     fontWeight: FontWeight.w900,
                //     color:Color(0xFF8EA3E2),
                //   ),
                // ),
                const SizedBox(height: 48),
                buildAbout(),
                buildAbout2(),
                buildAbout3(),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget buildAbout() => Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We are really sorry that you encountered an bug',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 165, 101, 234),),
            ),
            const SizedBox(height: 10,),
            Text(
              "please let us know about it and our team will fix it for you.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, height: 1.4,fontWeight: FontWeight.bold,color:Color(0xFF8EA3E2).withOpacity(0.75),),
            ),
            const SizedBox(height: 30,),
          ],
        ),
      );


Widget buildAbout3() => Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const SizedBox(height: 100,),
                Container(
                  height: 180,
                  child: Image.asset('images/bug3.png'),
                ),
          ],
            ),
          ],
        ),
      );


Widget buildAbout2() => Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          child: const Text('Open report bug form'),
          style: ElevatedButton.styleFrom(
            primary:  Color.fromARGB(255, 165, 101, 234), // Background color
          ),
          onPressed: () {
            showDialog(
                context: context, builder: (context) => const FeedbackDialog());
          },
        ),
      );
}



class FeedbackDialog extends StatefulWidget {
  const FeedbackDialog({Key? key}) : super(key: key);

  @override
  State<FeedbackDialog> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: 'Enter your report here',
            filled: true,
          ),
          maxLines: 5,
          maxLength: 4096,
          textInputAction: TextInputAction.done,
          validator: (String? text) {
            if (text == null || text.isEmpty) {
              return 'Please enter a value';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          style: TextButton.styleFrom(
            primary:  Color.fromARGB(255, 165, 101, 234), // Text Color
          ),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: const Text('Send'),
          style: TextButton.styleFrom(
            primary:  Color.fromARGB(255, 165, 101, 234), // Text Color
          ),
          onPressed: () async {
            // Only if the input form is valid (the user has entered text)
            if (_formKey.currentState!.validate()) {
              // We will use this var to show the result
              // of this operation to the user
              String message;

              try {
                // Get a reference to the `feedback` collection
                final collection =
                    FirebaseFirestore.instance.collection('ReportABug');

                // Write the server's timestamp and the user's feedback
                await collection.doc().set({
                  'timestamp': FieldValue.serverTimestamp(),
                  'ReportABug': _controller.text,
                });

                message = 'will done! your report is sent successfully';
              } catch (e) {
                message = 'Error when sending report';
              }

              // Show a snackbar with the result
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(message)));
              Navigator.pop(context);
            }
          },
        )
      ],
    );
  }
}
