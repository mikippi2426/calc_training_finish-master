import 'package:calc_training/screens/test_screen.dart';
import "package:flutter/material.dart";


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DropdownMenuItem<int>> _menuItems = [];
  int _numberOfQuestions = 0;

  @override
  void initState() {
    super.initState();
    setMenuItems();

    _numberOfQuestions = _menuItems[0].value!;
  }

  void setMenuItems() {
    // _menuItems.add(DropdownMenuItem(value: 10,child: Text(10.toString()),));
    // _menuItems.add(DropdownMenuItem(value: 20,child: Text(20.toString()),));
    // _menuItems.add(DropdownMenuItem(value: 30,child: Text(30.toString()),));
    _menuItems..add(DropdownMenuItem(
      value: 10,
      child: Text(10.toString()),
    ))..add(DropdownMenuItem(
      value: 20,
      child: Text(20.toString()),
    ))..add(DropdownMenuItem(
      value: 30,
      child: Text(30.toString()),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    print("ヨコ幅の論理ピクセル:$screenWidth");
    print("タテ幅の論理ピクセル:$screenHeight");

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset("assets/images/image_title.png"),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "問題数を選択して「スタート」ボタンを押してください",
                  style: TextStyle(fontSize: 12.0),
                ),
                SizedBox(
                  height: 50.0,
                ),
                DropdownButton(
                  items: _menuItems,
                  value: _numberOfQuestions,
                  onChanged: (int? selectedValue) {
                    setState(() {
                      _numberOfQuestions = selectedValue!;
                    });
                  },
                ),
                //TODO プルボタン選択肢
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: ElevatedButton.icon(
                        icon: Icon(Icons.skip_next),
                        label: Text("スタート"),
                        onPressed: () => startTestScreen(context),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.brown,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  startTestScreen(BuildContext) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context)
    => TestScreen(numberOfQuestions:_numberOfQuestions)));
  }
}
