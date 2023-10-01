import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeBasic extends StatefulWidget {
  const HomeBasic({super.key});

  @override
  State<HomeBasic> createState() => _HomeBasicState();
}

class _HomeBasicState extends State<HomeBasic>
    with SingleTickerProviderStateMixin {
  // Ticker é uma classe que permite que você receba notificações de cada frame.

  final List<EmailCard> emails = [
    EmailCard(
      author: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 3.13 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      author: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 3.13 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      author: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 3.13 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      author: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 3.13 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      author: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 3.13 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      author: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 3.13 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      author: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 3.13 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      author: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 3.13 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      author: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 3.13 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      author: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 3.13 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      author: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 3.13 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      author: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 3.13 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      author: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 3.13 is now available! This release includes the following new features and improvements",
    ),
    EmailCard(
      author: 'John Doe',
      subject: "New Flutter release",
      body: ""
          "Flutter 3.13 is now available! This release includes the following new features and improvements",
    ),
  ];

  late ScrollController _scrollController;
  late AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    )..forward(); // Ja definir o valor inicial do controller

    _animation = CurvedAnimation(
      // Tipo do algoritmo de animação que será utilizado
      parent: _animationController,
      curve: Curves.fastEaseInToSlowEaseOut,
    );

    _scrollController = ScrollController();
    _scrollController.addListener(updateAnimationState);
    // Quando um evento de scroll é disparado, o listener é chamado
  }

  void updateAnimationState() {
    // Verifica o estado do scroll e atualiza o estado da animação

    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      _animationController.reverse();
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      _animationController.forward();
    }
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
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
            elevation: 0,
            toolbarHeight: 80,
            flexibleSpace: const SearchMail(),
          ),
          body: EmailList(
            scrollController: _scrollController,
            emails: emails,
          ),
          floatingActionButton: const WriteMailButton(),
          bottomNavigationBar: NavigationBar(
            animation: _animation,
            emails: emails,
          ),
        ),
      ),
    );
  }
}

class WriteMailButton extends StatelessWidget {
  const WriteMailButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
      child: const SizedBox(
        width: 100,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10.0,
            bottom: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.edit),
              Text("Escrever"),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailList extends StatelessWidget {
  const EmailList({
    super.key,
    required ScrollController scrollController,
    required this.emails,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final List<EmailCard> emails;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(250, 250, 250, 1),
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          controller: _scrollController,
          child: Column(
            children: emails,
          )),
    );
  }
}

class SearchMail extends StatelessWidget {
  const SearchMail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        children: [
          Flexible(
            child: SearchBar(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              hintText: 'Search in mail',
              hintStyle: MaterialStateProperty.all(
                const TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.only(left: 10),
              ),
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
              trailing: const [
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: CircleAvatar(
                    child: Icon(Icons.person_outline_rounded),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    super.key,
    required Animation<double> animation,
    required this.emails,
  }) : _animation = animation;

  final Animation<double> _animation;
  final List<EmailCard> emails;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class EmailCard extends StatelessWidget {
  EmailCard({
    Key? key,
    required String author,
    required String subject,
    required String body,
  })  : _author = author,
        _subject = subject,
        _body = body,
        super(key: key);

  final CircleAvatar _avatar = const CircleAvatar(
    child: Icon(Icons.person),
  );

  final String _author;
  final String _subject;
  final String _body;
  final DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 4.0,
              right: 12.0,
            ),
            child: _avatar,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 4.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    _author,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 4.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    _subject,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 4.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    _body,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${_date.hour}:${_date.minute}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const Icon(
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
