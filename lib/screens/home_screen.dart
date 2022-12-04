import 'package:flutter/material.dart';
import 'package:my_own_frashcards/parts/button_with_icon.dart';
import 'package:my_own_frashcards/screens/test_screen.dart';
import 'package:my_own_frashcards/screens/word_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isIncludedMemoriezedWords = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Image.asset("assets/images/image_title.png")),
            _titleText(),
            Divider(
              color: Colors.white,
              indent: 8.0,
              endIndent: 8.0,
              thickness: 1.0,
              height: 30.0,
            ),
            ButtonWithIcon(
              onPressed: () => _startTestScreen(context),
              icon: Icon(Icons.play_arrow),
              label: "テスト開始",
              color: Colors.brown,
            ),
            SizedBox(height: 10.0),
            //ラジオボタン
            _radioButtons(),
            SizedBox(height: 30.0),
            ButtonWithIcon(
              onPressed: () => _startWordListScreen(context),
              icon: Icon(Icons.list),
              label: "単語一覧",
              color: Colors.grey,
            ),
            SizedBox(height: 60.0),
            Text(
              "powered by Telulu LLC 2019",
              style: TextStyle(fontFamily: "Mont"),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _titleText() {
    return Column(
      children: [
        Text(
          "私だけの単語帳",
          style: TextStyle(fontSize: 40.0),
        ),
        Text(
          "My Own Frashcard",
          style: TextStyle(fontSize: 24.0, fontFamily: "Mont"),
        ),
      ],
    );
  }

  Widget _radioButtons() {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: Column(
        children: [
          RadioListTile(
            value: false,
            groupValue: isIncludedMemoriezedWords,
            onChanged: (bool? value) => _onRadioSelected(value!),
            title: Text(
              "暗記済みを除外",
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          RadioListTile(
            value: true,
            groupValue: isIncludedMemoriezedWords,
            onChanged: (bool? value) => _onRadioSelected(value!),
            title: Text(
              "暗記済みを含む",
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }

  _onRadioSelected(value) {
    setState(() {
      isIncludedMemoriezedWords = value;
      print("$valueが選ばれたで〜");
    });
  }

  _startWordListScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WordListScreen()));
  }

  _startTestScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TestScreen(
                isIncludedMemoriezedWords: isIncludedMemoriezedWords)));
  }
}
