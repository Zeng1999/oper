import 'package:flutter/material.dart';
import 'package:oper/tabs/user.dart';
import 'package:oper/tabs/chat.dart';
import 'package:oper/tabs/settings.dart';

void main() => runApp(
    MaterialApp(
        home: MyApp(),
        theme: ThemeData(
        ),
    )
);

class MyApp extends StatefulWidget {
    @override
    MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {

    TabController controller;

    @override
    void initState() {
        super.initState();

        controller = TabController(
            length: 3,
            vsync: this,
        );
    }

    @override
    void dispose() {
        controller.dispose();
        super.dispose();
    }

    TabBar getTabBar() {
        return TabBar(
            tabs: <Widget>[
                Tab(
                    icon: Icon(Icons.account_box),
                ),
                Tab(
                    icon: Icon(Icons.adb),
                ),
                Tab(
                    icon: Icon(Icons.add_alarm),
                )
            ],
            controller: controller,
        );
    }

    TabBarView getTabBarView(var tabs) {
        return TabBarView(
            children: tabs,
            controller: controller,
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Tabs"),
                backgroundColor: Colors.teal,
                bottom: getTabBar(),
            ),
            body: getTabBarView(<StatefulWidget>[
                UserTab(),
                ChatTab(),
                SettingsTab(),
            ]),
        );
    }
}
