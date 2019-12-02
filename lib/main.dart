import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(InstaClone());

int _selectedIndex = 0;
const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

class InstaClone extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaClone',
      debugShowCheckedModeBanner: false,
      theme: _instaCloneTheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _getHistory() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (var i = 0; i < 10; i++) HistoryWidget("@user$i")
        ],
      ),
    );
  }

  Widget _getSearchBody() {
    return new Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: Center(
          child: new StaggeredGridView.count(
            crossAxisCount: 3,
            staggeredTiles: _staggeredTiles,
            children: _tiles,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            padding: const EdgeInsets.all(0.0),
          ),
        ));
  }

  Widget _getHomeBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getHistory(),
          Divider(),
          for (var i = 0; i < 10; i++) PostWidget("@user$i")
        ],
      ),
    );
  }

  Widget _getActivityBody() {
    Random random = Random();

    double heightSeparator = 20.0;
    var entries = <Widget>[];
    entries.add(ListTile(
      leading: ConstrainedBox(
        constraints: BoxConstraints.tight(Size(70.0, 70.0)),
        child: Container(
          decoration:
              BoxDecoration(color: Colors.blueAccent, shape: BoxShape.circle),
        ),
      ),
      title: Text("Follow Requests"),
      subtitle: Text("Aprove or ignore requests"),
    ));

    entries.add(SizedBox(
      height: heightSeparator,
    ));

    entries.add(Text(
      "Yesterday",
      style: TextStyle(fontWeight: FontWeight.bold),
    ));

    for (var i = 0; i < 3; i++) {
      entries.add(SizedBox(
        height: heightSeparator,
      ));

      entries.add(ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints.tight(Size(70.0, 70.0)),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, random.nextInt(256),
                    random.nextInt(256), random.nextInt(256)),
                shape: BoxShape.circle),
          ),
        ),
        title: Text("You liked 3 post tagged this week"),
        trailing: FlatButton(
          color: Colors.blueAccent,
          child: Text(
            "Follow",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0),
          ),
          onPressed: () {
            print("Follow");
          },
        ),
      ));
    }

    entries.add(SizedBox(
      height: heightSeparator,
    ));

    entries.add(Text(
      "This Month",
      style: TextStyle(fontWeight: FontWeight.bold),
    ));

    entries.add(SizedBox(
      height: heightSeparator,
    ));

    for (var i = 0; i < 10; i++) {
      entries.add(SizedBox(
        height: heightSeparator,
      ));

      entries.add(ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints.tight(Size(70.0, 70.0)),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, random.nextInt(256),
                    random.nextInt(256), random.nextInt(256)),
                shape: BoxShape.circle),
          ),
        ),
        title: Text("You liked 3 post tagged this week"),
        trailing: FlatButton(
          color: Colors.blueAccent,
          child: Text(
            "Follow",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0),
          ),
          onPressed: () {
            print("Follow");
          },
        ),
      ));
    }

    entries.add(SizedBox(
      height: heightSeparator,
    ));

    entries.add(Text(
      "Early",
      style: TextStyle(fontWeight: FontWeight.bold),
    ));

    for (var i = 0; i < 15; i++) {
      entries.add(SizedBox(
        height: heightSeparator,
      ));

      entries.add(ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints.tight(Size(70.0, 70.0)),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, random.nextInt(256),
                    random.nextInt(256), random.nextInt(256)),
                shape: BoxShape.circle),
          ),
        ),
        title: Text("You liked 3 post tagged this week"),
        trailing: FlatButton(
          color: Colors.blueAccent,
          child: Text(
            "Follow",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0),
          ),
          onPressed: () {
            print("Follow");
          },
        ),
      ));
    }

    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return entries[index];
        });
  }

  Widget _getProfileBody() {
    double boxSize = 100.0;


    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(boxSize, boxSize)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.greenAccent, shape: BoxShape.circle),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("21",
                            style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("Post")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("340",
                            style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("Followers")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("713",
                            style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("Folowing")
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text("Harold Campuzano"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("www.github.com"),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: OutlineButton(
                  onPressed: (){print("Edit profile");},
                  child: SizedBox.fromSize(size: Size(double.infinity,null),
                    child: Center(child: Text('Raised Button')),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SliverAppBar(
          elevation: 0.0,
          pinned: true,
          //TODO cambiar el flexibleSpaceBar to ROW with buttons
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Demo',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('Grid Item $index'),
              );
            },
            childCount: 20,
          ),
        ),

      ],
    );
  }

  Widget listItem(Color color, String title) => Container(
        height: 100.0,
        color: color,
        child: Center(
          child: Text(
            "$title",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  Widget _getHomeAppBar() {
    return AppBar(
      title: Text("InstaClone"),
      leading: IconButton(
        icon: const Icon(Icons.photo_camera),
        onPressed: () {
          print("Camera pressed");
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.visibility),
          tooltip: 'Show Snackbar',
          onPressed: () {
            print("InstaTV pressed");
          },
        ),
        IconButton(
          icon: const Icon(Icons.send),
          tooltip: 'Next page',
          onPressed: () {
            print("Messages pressed");
          },
        ),
      ],
    );
  }

  Widget _getSearchAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          print("Search button");
        },
      ),
      title: Text(
        "Search",
        style: TextStyle(color: Colors.black87),
      ),
    );
  }

  Widget _getActivityAppBar() {
    return AppBar(
      title: Text("Activity"),
    );
  }

  Widget _getProfileAppBar() {
    return AppBar(
      title: FlatButton.icon(
          onPressed: () {
            print("Account");
          },
          icon: Icon(Icons.keyboard_arrow_down),
          label: Text("user.insta")),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.cached),
          onPressed: () {
            print("Chached Histories");
          },
        ),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            print("Menu pressed");
          },
        ),
      ],
    );
  }

  void _onButtonBarItemPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar;
    Widget content;

    switch (_selectedIndex) {
      case 0:
        appBar = _getHomeAppBar();
        content = _getHomeBody();
        break;
      case 1:
        appBar = _getSearchAppBar();
        content = _getSearchBody();
        break;

      case 3:
        appBar = _getActivityAppBar();
        content = _getActivityBody();
        break;

      case 4:
        appBar = _getProfileAppBar();
        content = _getProfileBody();
        break;
    }

    return Scaffold(
      appBar: appBar,
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("")),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), title: Text("")),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border), title: Text("")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), title: Text("")),
        ],
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black45,
        onTap: _onButtonBarItemPressed,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class HistoryWidget extends StatefulWidget {
  HistoryWidget(this.text);
  final String text;

  @override
  _HistoryWidgetState createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  final double boxSize = 80.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints.tight(Size(boxSize, boxSize)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.greenAccent, shape: BoxShape.circle),
            ),
          ),
        ),
        Text(
          widget.text,
          style: TextStyle(fontSize: 12.0, color: Colors.black87),
        )
      ],
    );
  }
}

class PostWidget extends StatefulWidget {
  PostWidget(this.user);
  final String user;

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  final double size = 50.0;
  bool _wrap = true;

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints.tight(Size(size, size)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent, shape: BoxShape.circle),
                  ),
                ),
              ),
              Expanded(child: Text(widget.user)),
              IconButton(
                  onPressed: () {
                    print("More");
                  },
                  icon: const Icon(Icons.more_vert)),
            ],
          ),

          //Esto es para la foto
          ConstrainedBox(
            constraints: BoxConstraints.tight(Size(
                viewportConstraints.maxWidth, viewportConstraints.maxWidth)),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                color: Color.fromARGB(255, random.nextInt(256),
                    random.nextInt(256), random.nextInt(256)),
              ),
            ),
          ),

          // Esta es la barra del like
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    print("Like");
                  },
                  icon: const Icon(Icons.star_border)),
              IconButton(
                  onPressed: () {
                    print("Comment");
                  },
                  icon: const Icon(Icons.add_comment)),
              IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    print("Send");
                  }),
              Spacer(),
              IconButton(
                  onPressed: () {
                    print("More");
                  },
                  icon: const Icon(Icons.bookmark_border)),
            ],
          ),

          // Aca va el post Info
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "21 likes",
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _wrap = !_wrap;
                    });
                  },
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam finibus ex ac sapien consectetur ultricies. Mauris iaculis iaculis enim et fermentum. Donec magna nibh, feugiat a porta non, ultrices sed quam. Fusce quis mauris ac orci fermentum ullamcorper. Mauris at nunc ornare, porttitor dolor sed, varius purus. Quisque eu ex non velit interdum euismod ut a metus. Integer eu eros imperdiet, pellentesque ipsum malesuada, feugiat tortor. Maecenas in est imperdiet, ultricies purus sit amet, vulputate felis. Maecenas vel ante finibus, auctor massa non, suscipit tortor. Morbi vestibulum neque eget ex tincidunt, ac condimentum nisl molestie. Ut ultrices diam at dolor luctus, nec tempus nunc finibus. Integer luctus massa et dui facilisis scelerisque.\n\n" +
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam finibus ex ac sapien consectetur ultricies. Mauris iaculis iaculis enim et fermentum. Donec magna nibh, feugiat a porta non, ultrices sed quam. Fusce quis mauris ac orci fermentum ullamcorper. Mauris at nunc ornare, porttitor dolor sed, varius purus. Quisque eu ex non velit interdum euismod ut a metus. Integer eu eros imperdiet, pellentesque ipsum malesuada, feugiat tortor. Maecenas in est imperdiet, ultricies purus sit amet, vulputate felis. Maecenas vel ante finibus, auctor massa non, suscipit tortor. Morbi vestibulum neque eget ex tincidunt, ac condimentum nisl molestie. Ut ultrices diam at dolor luctus, nec tempus nunc finibus. Integer luctus massa et dui facilisis scelerisque.",
                    textAlign: TextAlign.start,
                    overflow: _wrap ? TextOverflow.ellipsis : null,
                    maxLines: _wrap ? 2 : null,
                  ),
                ),

                //COMMENT WIDGET

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "4 hours ago",
                    style: TextStyle(fontSize: 12, color: Colors.black38),
                  ),
                )
              ],
            ),
          )
        ],
      );
    });
  }
}

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(2, 1),
];

List<Widget> _tiles = const <Widget>[
  const _Example01Tile(Colors.lightBlue, Icons.wifi),
  const _Example01Tile(Colors.amber, Icons.panorama_wide_angle),
  const _Example01Tile(Colors.brown, Icons.map),
  const _Example01Tile(Colors.deepOrange, Icons.send),
  const _Example01Tile(Colors.green, Icons.widgets),
  const _Example01Tile(Colors.indigo, Icons.airline_seat_flat),
  const _Example01Tile(Colors.red, Icons.bluetooth),
  const _Example01Tile(Colors.purple, Icons.desktop_windows),
  const _Example01Tile(Colors.pink, Icons.battery_alert),
  const _Example01Tile(Colors.blue, Icons.radio),
];

class _Example01Tile extends StatelessWidget {
  const _Example01Tile(this.backgroundColor, this.iconData);

  final Color backgroundColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return new Card(
      margin: EdgeInsets.all(0.0),
      color: backgroundColor,
      child: new InkWell(
        onTap: () {},
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(2.0),
            child: new Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

final ThemeData _instaCloneTheme = _buildSafecarTheme();

ThemeData _buildSafecarTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(appBarTheme: _appBarTheme());
}

AppBarTheme _appBarTheme() {
  final ThemeData base = ThemeData.light();
  return AppBarTheme(
    elevation: 4.0,
    color: Colors.white,
    textTheme: base.primaryTextTheme.copyWith(
        title: base.primaryTextTheme.title.copyWith(color: Colors.black)),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  );
}
