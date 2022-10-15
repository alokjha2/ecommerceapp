



import 'package:flutter/material.dart';
import 'package:uicommerce/dummy/ads_json.dart';
import 'package:uicommerce/pages/product_detail_page.dart';
import 'package:uicommerce/pages/side_menu.dart';
import 'package:uicommerce/theme/colors.dart';
import 'package:uicommerce/widgets/custom_slider.dart';

import '../dummy/home_json.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;

  var scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      backgroundColor: primary,
      drawer: SideMenuPage(),
      appBar: PreferredSize(child: getAppBar(),preferredSize: Size.fromHeight(60),),
      body: getBody(),
      // appBar: AppBar(),
    );
  }

 Widget getAppBar(){
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: primary,
      leading: IconButton(
        onPressed: (){

          scaffoldkey.currentState?.openDrawer();
        },
        icon: Icon(
          Icons.menu_sharp,
          color: secondary.withOpacity(.8),size: 30,
          ),
          
        ),
        actions: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/shoes.png",
                  ),fit: BoxFit.cover),
              border: Border.all(
                color: secondary.withOpacity(0.5))),

          ),
          SizedBox(width: 20,)
        ],
    );
  }

Widget getBody(){
  return SingleChildScrollView(
    padding: EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),

        Text("Hello Alok,", style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
        Text("Let's get something", style: TextStyle(fontSize: 15,),),

        SizedBox(height: 20,),
        getSlider(),
        SizedBox(height: 20,),
        getCategorySection(),
        SizedBox(height: 20,),

        getItemList()
      ],
    ),
  );
}


Widget getSlider(){
  return CustomSlider(items: adsJson);
}



Widget getCategorySection(){

  var size = MediaQuery.of(context).size;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Category", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
      SizedBox(height: 15,),

      Row(
        children: [
          Container(
            width: (size.width-30)  *0.7,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: 
              List.generate(
                categoryItems.length,
                 (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      height: 30,
                      decoration: 
                      pageIndex == index ?
                      BoxDecoration(
                        border: Border(bottom: BorderSide(color: secondary,width: 1.5))
                      ) : BoxDecoration()  ,
                      child: Text(
                        categoryItems[index]["title"],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                          ),
                        ),
                  
                    ),
                  );
                 })
              ),
            ),

          ),
          SizedBox(
            width: 10,
          ),
          Flexible(child: 
          Container(
            height: 35,
            decoration: BoxDecoration(
              color: secondary.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(4)
              ),
              
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Icon(Icons.search),
                SizedBox(width: 5,),
                Text("Search...", style: TextStyle(fontSize: 13, ),)
              ]),

          )      
          )
       
        ],
      )
    ],
  );


  }

Widget getItemList(){
  var size = MediaQuery.of(context).size;
  return Wrap(
    spacing: 20,
    runSpacing: 20,
    children: List.generate(
    homeJson.length, (index) {
      return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> ProductDetailPage(
              name: homeJson[index]["name"],
              img: homeJson[index]["image"], 
              price: homeJson[index]["price"], 
              rate: homeJson[index]["rate"],
              colors: homeJson[index]["colors"]
              )));

          },
          child: Container(
            width: (size.width-50)/2,
            height: 220,
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  child: Container(
                    width: (size.width-50)/2,
                    height: 200,
                    decoration: BoxDecoration(
                      color: secondary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                          bottom: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                            Row(
                              children: [
                                Icon(Icons.star_border_outlined, size: 24,color: secondary,),
                                // SizedBox(
                                //   width: 3,
                                // ),
                                Padding(padding: EdgeInsets.only(top: 3),
                                child: Text(homeJson[index]["rate"], style: TextStyle(fontWeight: FontWeight.w500),),
                                )
        
                              ],
                            ),
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: secondary.withOpacity(0.15),
                                    blurRadius: 5,
                                    offset: Offset(0,5) 
                                  )
                                ]
                                ),
                                child: Center(child: Icon(Icons.shopping_bag_outlined, size: 18,)),
                            )
        
                          ],),
                          ),
                  ),
                ),
                Positioned(
                  top: 2,
                  child: Container(
                    width: (size.width-50)/2,
                    height: 160,
                    child: Image.asset(
                      homeJson[index]["image"]
                      ),
        
        
                        ),
                      ),
                    ],
                  ),
                ),
        ),

              SizedBox(height: 5,),

              Column(
                children: [
                  Container(
                    width: (size.width - 60)/2,
                    child: Text(
                      homeJson[index]["name"], 
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                        ),
                      )
                      ),

                      Container(
                        width: (size.width - 60)/2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                      "\$", 
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: red
                        ),
                      ),


                      SizedBox(
                        width: 1,
                      ),

                      Text(
                      homeJson[index]["price"], 
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: secondary.withOpacity(0.8)
                        ),
                      ),      
                          
                        ]),
                      )
                ],
              )
            ],
          );
        }
      ),
    );
  }
}