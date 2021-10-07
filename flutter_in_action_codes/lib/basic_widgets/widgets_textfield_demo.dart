import 'package:flutter/material.dart';
import 'package:flutter_app/basic_widgets/widgets_form_demo.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';
import 'package:flutter_app/custom_widgets/home_item.dart';

class TextFieldDemoPage extends StatefulWidget {
  @override
  _TextFieldDemoPageState createState() => _TextFieldDemoPageState();
}

class _TextFieldDemoPageState extends State<TextFieldDemoPage> {

  TextEditingController _usernameController = TextEditingController();

  // TextEditingController 设置默认值和选中文本
  TextEditingController _selectionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      print(_usernameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {

    _selectionController.text = "hello world";
    _selectionController.selection = TextSelection(
      baseOffset: 2,
      extentOffset: _selectionController.text.length,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("TextField demo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DescItem("一个登陆页面的小示例"),
              Column(
                children: [
                  TextField(
                    autofocus: true,
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    obscuringCharacter: "\$",
                  ),
                ],
              ),
              DescItem("TextEditingController 设置默认值和选择文本"),
              TextField(
                controller: _selectionController,
              ),
              DescItem("TextField 焦点控制示例"),
              HomeItem(title: "TextField 焦点控制", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TextFieldFocusNodeDemoPage();
                }));
              }),
              DescItem("自定义 TextField 样式：搜索框"),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.grey,),
                    border: InputBorder.none,
                    hintText: "Search everything",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16
                    )
                  ),
                  style: TextStyle(
                    color: Colors.amber
                  ),
                  cursorColor: Colors.amber,
                  cursorWidth: 3,
                  cursorRadius: Radius.circular(3),
                ),
              ),
              DescItem("Form 组件使用示例"),
              HomeItem(title: "Form", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FormDemoPage();
                }));
              }),
            ],
          ),
        ),
      ),
    );
  }
}


class TextFieldFocusNodeDemoPage extends StatefulWidget {
  @override
  _TextFieldFocusNodeDemoPageState createState() => _TextFieldFocusNodeDemoPageState();
}

class _TextFieldFocusNodeDemoPageState extends State<TextFieldFocusNodeDemoPage> {

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode? focusScopeNode;

  @override
  void initState() {
    super.initState();
    focusNode1.addListener(() {
      print("input1 获得焦点：${focusNode1.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField 焦点控制"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              focusNode: focusNode1,
              decoration: InputDecoration(
                labelText: "input1"
              ),
            ),
            TextField(
              focusNode: focusNode2,
              decoration: InputDecoration(
                  labelText: "input2"
              ),
            ),
            ElevatedButton(onPressed: () {
              //将焦点移到第二个TextField
              if (null == focusScopeNode) {
                focusScopeNode = FocusScope.of(context);
              }
              focusScopeNode?.requestFocus(focusNode2);
            }, child: Text("移动焦点到input2")),
            ElevatedButton(onPressed: () {
              // 当所有编辑框都失去焦点时键盘就会收起
              focusNode1.unfocus();
              focusNode2.unfocus();
            }, child: Text("隐藏键盘")),
          ],
        ),
      ),
    );
  }
}

