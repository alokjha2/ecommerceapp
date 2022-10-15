import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:uicommerce/theme/colors.dart';

class ProductDetailPage extends StatefulWidget {


  final String name;
  final String img;
  final String price;
  final String rate;
  final List colors;
  ProductDetailPage({Key? key, required this.name, required this.img, required this.price, required this.rate, required this.colors}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {


  List sizes = [
    5,
    6,
    7,
    7.5,
    8,
    8.5,
    9,
    9.5,
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      bottomNavigationBar: getFooter(),
      body: getBody(),
      appBar: PreferredSize(child: getAppBar(),preferredSize: Size.fromHeight(60),),


    );
  }
  Widget getAppBar(){

    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: primary,
      title: Text(
        "Product Detail",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: secondary
        ),
      ),
      leading:
       IconButton(onPressed: (){
        Navigator.pop(context);
      },icon: Icon(Icons.arrow_back_ios,color: secondary,size: 22,),
      
      ),
    );
  }


  Widget getFooter(){
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: secondary,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
        ),
        child: Padding(padding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [
              Text("More",style: TextStyle(fontSize: 18,color: white,fontWeight: FontWeight.w500),),
              Row(
                children: [
                  Container(
                    width: 120,
                    height: 35,
                    decoration: BoxDecoration(
                      color: primary.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: white),
                      ),
                      child: Padding(padding: EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(4)
                            ),
                            child: Center(child: Icon(Icons.remove,)),
                        ),
                        Text("1", style: TextStyle(fontSize: 16,color: white,fontWeight: FontWeight.w600),),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(4)
                            ),
                            child: Center(child: Icon(Icons.add,)),
                        )

                      ]),),
                  ),
                  SizedBox(width: 15,),

                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(color: white,shape: BoxShape.circle,boxShadow: [
                      BoxShadow(
                        color: secondary.withOpacity(0.15),
                        blurRadius: 5,
                        offset: Offset(0,5)
                      ),
                      
                    ]),
                    child: Center(child: Icon(LineIcons.shoppingBag)),
                  )

                ],
              )
        ],),),
    );
  }

  Widget getBody(){
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Text(widget.name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
          SizedBox(height: 15,),
          Row(
            children: [
              Icon(LineIcons.star,size: 20,),
              SizedBox(width: 5,),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: Text(
                  "${widget.rate} Reviews",
                style: TextStyle(
                  fontWeight: FontWeight.w500
                  ),),)


            ],
          ),
          SizedBox(height: 15,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text("\$", style: TextStyle(fontSize: 16,color: red,fontWeight: FontWeight.w500),),
                ),
                Text(widget.price, style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),


              ],
            ),
            
                Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(color: white,shape: BoxShape.circle,boxShadow: [
                      BoxShadow(
                        color: secondary.withOpacity(0.15),
                        blurRadius: 5,
                        offset: Offset(0,5)
                      ),
                      
                    ]),
                    child: Center(child: Icon(LineIcons.heart)),
                  )
          ],),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width*0.25,
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: List.generate(
                      widget.colors.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Container(
                            width: 70,
                            height: 70,
                            child: Stack(children: [
                              Positioned(
                                top: 10,
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: secondary.withOpacity(0.1)
                                      )
                                      ),
                                )),
                                 Container(
                                  width: 60,
                                  height: 60,
                                  child: Image.asset(widget.colors[index],fit: BoxFit.cover,),
                                ),
                              ]
                            ),         
                          ),
                        );
                      }
                    )
                  ),
                ),
              )
              
              ,SizedBox(width: 10,),

              Flexible(
                child: Container(
                  height: 340,
                  child: Stack(children: [
                    Padding(padding: EdgeInsets.only(top: 40),
                     child: Container(
                      height: 300,
                      decoration: BoxDecoration(color: secondary.withOpacity(0.12),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(120),
                        topLeft: Radius.circular(120),
                        topRight: Radius.circular(40),
                      )
                      ),
                     ),
                    ),

                    Container(
                      height: 270,
                      child: Image.asset(widget.img,fit: BoxFit.cover,),

                    )
                  ],),
                ),
              )
            
            ],
          ),
          SizedBox(height: 20,),

          Row(
            children: [
              Container(
                width: size.width*0.15,
                child: Text("Sizes",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),

              ),

              Flexible(
                child: Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: List.generate(sizes.length, (index) {
                      return Padding(

                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                            color: secondary.withOpacity(0.2)
                          )),
                          child: Center(
                            child: Text(
                              sizes[index].toString(),
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),
                              )),
                          
                        ),
                      );
                    })),
                  ),
              
                ),
              )
            ],
          )
          // Text("alok")
        ],
      ),

    );
  }
}
