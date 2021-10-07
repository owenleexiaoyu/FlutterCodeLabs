import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/desc_item.dart';

class FormDemoPage extends StatefulWidget {
  @override
  _FormDemoPageState createState() => _FormDemoPageState();
}

class _FormDemoPageState extends State<FormDemoPage> {

  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form demo"),
      ),
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DescItem("登陆页面 Form 校验示例"),
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  controller: _unameController,
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    icon: Icon(Icons.person),
                  ),
                  validator: (v) {
                    return v!.trim().length > 0 ? null : "用户名不能为空";
                  },
                ),
                TextFormField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登陆密码",
                    icon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (v) {
                    return v!.trim().length > 5 ? null : "密码不能少于6位";
                  },
                ),
                Padding(padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Expanded(child: ElevatedButton(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text("登陆"),
                      ),
                      onPressed: () {
                        if ((_formKey.currentState as FormState).validate()) {
                          // 提交数据
                          print("校验成功，提交数据");
                        } else {
                          print("校验失败，再输一次");
                        }
                      },
                    ))
                  ],
                ),)
              ],
            ),
          )
        ],
      ),),
    );
  }
}
