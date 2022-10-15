


import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:uicommerce/dummy/side_menu_json.dart';
import 'package:uicommerce/theme/colors.dart';

class SideMenuPage extends StatefulWidget {
  SideMenuPage({Key? key}) : super(key: key);

  @override
  State<SideMenuPage> createState() => _SideMenuPageState();
}

class _SideMenuPageState extends State<SideMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [getHeader(),getBodyItems(),getFooter()]),

    );
  }

  Widget getHeader(){
    return SizedBox(
      height: 160,
      child: DrawerHeader(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // SizedBox(height: 15,),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage("assets/images/shoes.png"))
              ),
            ),
            SizedBox(height: 7,),
            Text("Hey, Alok", style: TextStyle(fontSize: 20),),
          ],
          
          )),

    );
  }

  Widget getBody(){
    return Column(
      children: List.generate(sideMenuItems.length, (index) {
        if(sideMenuItems[index]["selected"]){
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,vertical: 15
              ),
              child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: white,
                  border: Border.all(color: secondary.withOpacity(0.05)),

                  boxShadow: [
                    BoxShadow(
                      color: secondary.withOpacity(0.03),
                      blurRadius: 2.5,
                      offset: Offset(0,5)
                    )
                  ]
                  ),
                  child: ListTile(
                    minLeadingWidth: 10,
                    leading: Icon(sideMenuItems[index]["icon"],color: secondary,),
                    // title: ,
                    ),
                ),
              );
        }
        return Container(
);
      })
    );
  }
  Widget getBodyItems() {
    return Column(
      children: List.generate(sideMenuItems.length, (index) {
        if (sideMenuItems[index]['selected']) {
          return 
          
           Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 15, top: 15),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: white,
                    border: Border.all(color: secondary.withOpacity(0.05)),
                    boxShadow: [
                      BoxShadow(
                          color: secondary.withOpacity(0.03),
                          blurRadius: 2.5,
                          offset: Offset(0, 5))
                    ]),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => sideMenuItems[index]['page']));
                  },
                  minLeadingWidth: 10,
                  leading: Icon(
                    sideMenuItems[index]['icon'],
                    color: secondary,
                  ),
                  title: Text(
                    sideMenuItems[index]['label'],
                    style: TextStyle(fontSize: 16, color: secondary),
                  ),
                ),
              ),
            
          );
        }
        return Container(
            margin: EdgeInsets.only(left: 0, right: 20, top: 0, bottom: 0),
            child: ListTile(
              onTap: () {
                Navigator.pop(context);

                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => sideMenuItems[index]['page']));
              },
              minLeadingWidth: 20,
              leading: Icon(
                sideMenuItems[index]['icon'],
                color: secondary.withOpacity(0.8),
                size: 26,
              ),
              title: Text(
                sideMenuItems[index]['label'],
                style:
                    TextStyle(fontSize: 16, color: secondary.withOpacity(0.8)),
              ),
            ),
          
        );
      }),
    );
  }

  Widget getFooter() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Divider(),Container(
            margin: EdgeInsets.only(left: 0, right: 20, top: 0, bottom: 10),
            child: ListTile(
              onTap: () {},
              minLeadingWidth: 20,
              leading: Icon(
                LineIcons.alternateSignOut,
                color: secondary.withOpacity(0.8),
                size: 28,
              ),
              title: Text(
                "Logout",
                style:
                    TextStyle(fontSize: 16, color: secondary.withOpacity(0.8)),
              ),
            ),
          ),
        
      ],
    );
  }
}


