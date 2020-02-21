import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'FM Radio',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: Drawer(

          ),
          appBar: AppBar(

            title: Text('FM Radio'),
            actions: <Widget>[
              Icon(Icons.power_settings_new),
              SizedBox(width: 30,)
            ],
            bottom: TabBar(
              indicatorColor: Colors.red,
              tabs: [
                Tab(icon: Icon(Icons.radio)),
                Tab(icon: Icon(Icons.format_list_bulleted)),
                InkWell(

                    child: Tab(icon: Icon(Icons.favorite))
                ),
              ],
            ),

          ),
          bottomNavigationBar: BottomAppBar(

            child:Row(

              children: <Widget>[
                Container(

                  padding: EdgeInsets.only(top: 20,bottom: 20,left: 70),
                  child: Row(
                    children: <Widget>[

                      Icon(Icons.headset),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.only(right: 70,top: 20,bottom: 20),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                            Colors.black12),
                          child: Icon(Icons.fiber_manual_record,color: Colors.red,)
                      ),
                      SizedBox(width: 10,),
                      Text('REC')
                    ],
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 40),
                            child: Icon(Icons.wifi_tethering)
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                  child: Icon(Icons.skip_previous,size: 40,)
                              ),
                              Spacer(),
                              Text('98.3', style: TextStyle(fontSize: 90,color: Colors.cyanAccent,)),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.only(right: 15),
                                  child: Icon(Icons.skip_next,size: 40,)
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 70),
                            child: Icon(Icons.favorite_border)
                        ),
                        Container(
                          height: 100,
                           child: Stack(
                                children: <Widget>[
                                  ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index){
                                      if(index % 10 ==0) {
                                        return RadioBars(isLong: true,);
                                      }else{
                                        return RadioBars(isLong: false,);
                                      }
                                    },
                                  ),
                                  Container(
                                    child: Center(
                                      child: Column(

                                        children: <Widget>[
                                          Container(
                                                  height: 100,
                                            width: 3,
                                            color: Colors.red,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                           ),
                        )
                      ],
                ),
              ),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}


class RadioBars extends StatefulWidget {
  final bool isLong;

  const RadioBars({Key key, this.isLong}) : super(key: key);
  @override
  _RadioBarsState createState() => _RadioBarsState();
}

class _RadioBarsState extends State<RadioBars> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 12,
      height: 100,
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Center(
        child: Container(
          color: Colors.grey,
          width: 2,
          height:  widget.isLong ? 100: 60,
        ),
      ),

    );
  }
}
