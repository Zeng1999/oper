import 'package:flutter/material.dart';
import 'package:oper/tools/dio.dart';

class UserTab extends StatefulWidget {
    @override
    UserState createState() => UserState();
}

class UserState extends State<UserTab> {
    String name = "", pass = "";
    String text = "";
    bool obscurePassword = true;
    Icon passShufIcon = Icon(Icons.visibility_off);

    @override
    Widget build(BuildContext context) {
        return Center(
            child: Container(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                            TextField(
                                decoration: InputDecoration(
                                    icon: Icon(Icons.person),
                                    hintText: "用户名*",
                                ),
                                onChanged: userNameOnChanged,
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.red,
                            ),
                            TextField(
                                decoration: InputDecoration(
                                    icon: Icon(Icons.lock),
                                    hintText: "密码*",
                                    suffixIcon: IconButton(
                                        icon: passShufIcon,
                                        onPressed: () {
                                            setState(() {
                                                obscurePassword = !obscurePassword;
                                                passShufIcon = obscurePassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility);
                                            });
                                        },
                                    )
                                ),
                                onChanged: passwordOnChanged,
                                obscureText: obscurePassword,
                                keyboardType: TextInputType.text,
                            ),
                            Text(""),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                    FlatButton(
                                        child: Text("Sign Up !"),
                                        onPressed: signup,
                                    ),
                                    FlatButton(
                                        child: Text("Sign In !"),
                                        onPressed: signin,
                                    )
                                ],
                            ),
                            Text(text)
                        ],
                    ),
                ),
            )
        );
    }

    void userNameOnChanged(String str) {
        setState(() {
            name = str;
        });
    }

    void passwordOnChanged(String str) {
        setState(() {
            pass = str;
        });
    }

    void signup() async {
        var res = await dioPost("http://192.168.0.104:8080/gettext", { "aid": int.parse(name) });
        if(res["status"] != 200) {
            setState(() {
                text = "Some Error !";
            });
            return;
        }
        if(res["data"].length == 0) {
            setState(() {
                text = "No Article !";
            });
            return;
        }
        setState(() {
            text = res["data"][0]["text"];
        });
    }

    void signin() {
        print("login");
        print(name);
        print(pass);
    }
}
