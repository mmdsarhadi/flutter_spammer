import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

import 'Curriculum.dart';
import 'CustomDrawer().dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textFieldController = TextEditingController();
  TextEditingController repeatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'تکرار کننده ای متن',
          style:TextStyle(
            color: Colors.white,
            fontFamily: 'Lalezar-Regular',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 1),
                  child: TextField(
                    controller: textFieldController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Lalezar-Regular',
                      ),
                      border: InputBorder.none,
                      hintText: "متن را وارد کنید",
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 1),
                  child: TextField(
                    controller: repeatController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Lalezar-Regular',
                      ),
                      border: InputBorder.none,
                      hintText: "تعداد تکرار را وارد کنید",
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      String textToShare = textFieldController.text;
                      String repeatCountString = repeatController.text;

                      if (textToShare.isNotEmpty &&
                          repeatCountString.isNotEmpty) {
                        int repeatCount = int.parse(repeatCountString);

                        if (repeatCount > 0) {
                          _shareTextWithRepeat(textToShare, repeatCount);
                        } else {
                          // Handle invalid repeat count
                          print('Invalid repeat count');
                        }
                      } else {
                        // Handle empty text or repeat count case
                        print('Text field or repeat count is empty');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 20.0,
                      ),
                    ),
                    child: Text(
                      'ارسال',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lalezar-Regular',
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      String textToCopy = textFieldController.text;

                      String repeatCountString = repeatController.text;

                      int repeatCount = int.tryParse(repeatCountString) ?? 0;

                      if (textToCopy.isNotEmpty && repeatCount > 0) {
                        String textToCopyRepeated =
                            List.generate(repeatCount, (index) => textToCopy)
                                .join('\n');

                        Clipboard.setData(
                            ClipboardData(text: textToCopyRepeated));

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.deepPurple,
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                            content: Text(
                              'متن تکرار شده کپی شد',
                              textAlign: TextAlign.center,
                              // این خط اضافه شده است
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Lalezar-Regular',
                                fontSize: 18,
                              ),
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.deepPurple,
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                            duration: Duration(seconds: 1),
                            content: Text(
                              'لطفا  متنی را وارد کنید',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Lalezar-Regular',
                                fontSize: 18,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 20.0,
                      ),
                    ),
                    child: Text(
                      'کپی',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lalezar-Regular',
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _shareTextWithRepeat(String text, int repeatCount) {
    String repeatedText =
        List.generate(repeatCount, (index) => text).join('\n');
    Share.share(repeatedText);
  }
}



