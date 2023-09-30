import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeBasic extends StatefulWidget {
  const HomeBasic({super.key});

  @override
  State<HomeBasic> createState() => _HomeBasicState();
}

class _HomeBasicState extends State<HomeBasic> with TickerProviderStateMixin {
  final List<EmailCard> emails = [
    EmailCard(
      sentFrom: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 2.5 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      sentFrom: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 2.5 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      sentFrom: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 2.5 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      sentFrom: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 2.5 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      sentFrom: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 2.5 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      sentFrom: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 2.5 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      sentFrom: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 2.5 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      sentFrom: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 2.5 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      sentFrom: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 2.5 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      sentFrom: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 2.5 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      sentFrom: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 2.5 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      sentFrom: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 2.5 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      sentFrom: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 2.5 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      sentFrom: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 2.5 is now available! This release includes the following new features and improvements",
    ),
  ];

  late ScrollController _scrollController;
  late AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastEaseInToSlowEaseOut,
    );

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        _animationController.reverse();
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: SizeTransition(
              sizeFactor: _animation,
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                items: [
                  BottomNavigationBarItem(
                    icon: Badge(
                      backgroundColor: Colors.red,
                      label: Text(emails.length.toString()),
                      child: const Icon(Icons.mail),
                    ),
                    label: "",
                  ),
                  const BottomNavigationBarItem(
                    label: "",
                    icon: Icon(Icons.videocam_outlined),
                  )
                ],
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(250, 250, 250, 1),
            elevation: 0,
            toolbarHeight: 80,
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Flexible(
                      child: SearchBar(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4))),
                    hintText: 'Search in mail',
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.only(left: 10)),
                    leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                    ),
                    trailing: const [
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
          body: Container(
            color: const Color.fromRGBO(250, 250, 250, 1),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,
                child: Column(
                  children: emails,
                )),
          ),
          // floatingActionButtonLocation: FloatingActionButtonLocation,
          floatingActionButton: ElevatedButton(
              onPressed: () {},
              // rounded button
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
              child: const SizedBox(
                width: 100,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Icon(Icons.edit), Text("Escrever")],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

class EmailCard extends StatelessWidget {
  EmailCard({
    Key? key,
    required String sentFrom,
    required String subject,
    required String body,
  })  : _sentFrom = sentFrom,
        _subject = subject,
        _body = body,
        super(key: key);

  final CircleAvatar _avatar = const CircleAvatar(
    child: Icon(Icons.person),
  );

  final String _sentFrom;
  final String _subject;
  final String _body;
  final DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    /// Avatar, followed by the author, subject and cliped body, followed by the hour if sent today, and day of week if older and favorite icon

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 12.0),
            child: _avatar,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                  child: Text(
                    _sentFrom,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                  child: Text(
                    _subject,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                  child: Text(_body,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 14,
                      )),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${_date.hour}:${_date.minute}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              SizedBox(
                height: 35,
              ),
              Icon(
                Icons.star_border,
                color: Colors.grey,
              )
            ],
          )
        ],
      ),
    );
  }
}
