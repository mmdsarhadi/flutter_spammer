import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';



class Curriculum extends StatefulWidget {
  const Curriculum({super.key});

  @override
  State<Curriculum> createState() => _CurriculumState();
}

class _CurriculumState extends State<Curriculum> {
  ThemeMode themeMode = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: MyAppThemeConfig.dark().getTheme(),
      home: MyHomePage(toggleTheMode: () {}),
    );
  }
}

class _themeMode {}

class MyAppThemeConfig {
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color backroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.grey,
        surfaceColor = Color(0xFF121212),
        backroundColor = Color(0xFF121212),
        appBarColor = Color(0xFF121212),
        brightness = Brightness.dark;

  MyAppThemeConfig.light(
      this.primaryTextColor,
      this.secondaryTextColor,
      this.surfaceColor,
      this.backroundColor,
      this.appBarColor,
      this.brightness) {}

  ThemeData getTheme() {
    return ThemeData(
        useMaterial3: true,
        brightness: brightness,
        dividerColor: surfaceColor,
        primarySwatch: Colors.pink,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.pink)),
        ),
        primaryColor: Colors.pink.shade400,
        dividerTheme: DividerThemeData(color: Colors.white30, thickness: 0.5),
        scaffoldBackgroundColor: backroundColor,
        appBarTheme: AppBarTheme(backgroundColor: appBarColor),
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: surfaceColor),
        textTheme: GoogleFonts.latoTextTheme(
          TextTheme(
              bodyText2: TextStyle(color: primaryTextColor, fontSize: 15),
              bodyText1: TextStyle(color: secondaryTextColor, fontSize: 13),
              headline6: TextStyle(fontWeight: FontWeight.bold),
              subtitle1: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: primaryTextColor)),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.toggleTheMode});

  final Function() toggleTheMode;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum _Skillstype {
  photoshop6,
  phptoshop1,
  photoshop2,
  photoshop3,
  photoshop4,
  photoshop5;
}

class _MyHomePageState extends State<MyHomePage> {
  _Skillstype _skills = _Skillstype.phptoshop1;

  void updateSelectedSkill(_Skillstype) {
    setState(() {
      this._skills = _Skillstype;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton( // This is the new back button
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
            // This line will handle the back navigation
          ),
          title: Text(
            "تهیه و توسعه دهنده",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: "Lalezar-Regular",
            ),
          ),
        ),

        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        "assets/images/mmd3.png",
                        width: 60,
                        height: 60,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mohammad sarhadi",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text("Django|Flutter"),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.location_solid,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                size: 14,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "kerman, iran",
                                style: Theme.of(context).textTheme.caption,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Icon(
                      CupertinoIcons.person,
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                child: Text(
                  'من یک توسعه‌دهنده  در زمینه برنامه‌نویسی فلاتر و پایتون هستم. من بسیار تمایل دارم نظرات و پیشنهادات شما را درباره بهبود برنامه بشنوم و در صورت نیاز کمک کنم. لطفاً اگر هر گونه نظر یا پیشنهادی دارید، با من به اشتراک بگذارید. من آماده‌ام تا با شما در ارتقای برنامه همکاری کنم و بهترین راهکارهای ممکن را برای شما ارائه دهم',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "Lalezar-Regular",
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "مهارت ها",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: "Lalezar-Regular",
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  direction: Axis.horizontal,
                  children: [
                    Skills(
                      title: 'Linux',
                      Imagepath: 'assets/images/li.png'
                          '',
                      shadowColor: Colors.blue,
                      isActive: _skills == _Skillstype.phptoshop1,
                      type: _Skillstype.phptoshop1,
                      onTab: () {
                        updateSelectedSkill(_Skillstype.phptoshop1);
                      },
                    ),
                    Skills(
                      title: 'Django',
                      Imagepath: 'assets/images/djj.png'
                          '',
                      shadowColor: Colors.blue,
                      isActive: _skills == _Skillstype.photoshop2,
                      type: _Skillstype.photoshop2,
                      onTab: () {
                        updateSelectedSkill(_Skillstype.photoshop2);
                      },
                    ),
                    Skills(
                      title: 'Flutter',
                      Imagepath: 'assets/images/flutter.png'
                          '',
                      shadowColor: Colors.blue,
                      isActive: _skills == _Skillstype.photoshop3,
                      type: _Skillstype.photoshop3,
                      onTab: () {
                        updateSelectedSkill(_Skillstype.photoshop3);
                      },
                    ),
                    Skills(
                      title: 'Python',
                      Imagepath: 'assets/images/py.png'
                          '',
                      shadowColor: Colors.blue,
                      isActive: _skills == _Skillstype.photoshop4,
                      type: _Skillstype.photoshop4,
                      onTab: () {
                        updateSelectedSkill(_Skillstype.photoshop4);
                      },
                    ),
                    Skills(
                      title: 'Dart',
                      Imagepath: 'assets/images/dart.png'
                          '',
                      shadowColor: Colors.blue,
                      isActive: _skills == _Skillstype.photoshop5,
                      type: _Skillstype.photoshop5,
                      onTab: () {
                        updateSelectedSkill(_Skillstype.photoshop5);
                      },
                    ),
                    Skills(
                      title: 'Java',
                      Imagepath: 'assets/images/jaa.png'
                          '',
                      shadowColor: Colors.blue,
                      isActive: _skills == _Skillstype.photoshop6,
                      type: _Skillstype.photoshop2,
                      onTab: () {
                        updateSelectedSkill(_Skillstype.photoshop6);
                      },
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text(
                    //   "راه های ارتباطی",
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 22,
                    //     fontFamily: "Lalezar-Regular",
                    //   ),
                    // ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      // child: ElevatedButton(
                      //   onPressed: () {
                      //     // باز کردن جیمیل و تایپ آدرس ایمیل مقصد
                      //     // توجه: این کد فقط برای پلتفرم اندروید کار می‌کند و نیاز به پکیج url_launcher دارد
                      //     launch('mailto:22msra@gmail.com');
                      //   },
                      //   child: Text("Email"),
                      // ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                    ),
                  ],
                ),
              )
            ],
          ),
        )




    );
  }
}

class Skills extends StatelessWidget {
  final _Skillstype type;
  final Function() onTab;
  final String title;
  final Color shadowColor;
  final bool isActive;
  final String Imagepath;

  const Skills(
      {super.key,
        required this.title,
        required this.shadowColor,
        required this.isActive,
        required this.Imagepath,
        required this.type,
        required this.onTab});

  @override
  Widget build(BuildContext context) {
    final BorderRadius defaultBorderRadius = BorderRadius.circular(12);

    return InkWell(
      borderRadius: defaultBorderRadius,
      onTap: onTab,
      child: Container(
        width: 110,
        height: 110,
        decoration: isActive
            ? BoxDecoration(
          color: Theme.of(context).dividerColor,
          borderRadius: BorderRadius.circular(12),
        )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(boxShadow: [
                BoxShadow(
                    color: shadowColor.withOpacity(0.4), blurRadius: 20)
              ])
                  : null,
              child: Image.asset(
                Imagepath,
                width: 40,
                height: 40,
              ),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
