import 'package:filitapp/views/myprofile.dart';
import 'package:flutter/material.dart';
import 'package:filitapp/views/bankdetails.dart';

class SideNav extends StatefulWidget {
  const SideNav({Key? key}) : super(key: key);

  @override
  State<SideNav> createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
          child: ListView(
            // padding: EdgeInsets.symmetric(horizontal: 20),
            children: [


              Container(
                // decoration: BoxDecoration(
                //   border: Border.all(
                //     color: Colors.black,
                //     width: 4
                //   )
                // ),
                padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
                child: Row(
                  children: [
                    CircleAvatar(radius: 30, backgroundColor: Colors.blueGrey,),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Fatima Iqbaal" , style: TextStyle(color: Colors.black , fontSize: 18, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text("fatimaiqbaal009@gmail.com", style: TextStyle(color: Colors.black , fontSize: 13),)
                      ],
                    )
                  ],
                ),

              ),

              SizedBox(height: 20,),

              Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Profile Setting" , style: TextStyle( color: Colors.black , fontSize: 20, fontWeight: FontWeight.w600),)) ,
              // Container(
              //   padding: EdgeInsets.only(left: 25),
              //   child: Text("Leaderboard - 230th Rank", style: TextStyle(color: Colors.white , fontSize: 19, fontWeight: FontWeight.bold),),
              // ) ,
              SizedBox(height: 12,),

           //myprofile
               ListTile(
                 leading: Icon(Icons.account_circle_outlined , color: Colors.black,size: 35,),
                 hoverColor: Colors.white60,
                 title: Text("My Profile", style: TextStyle(color: Colors.black ),),
                 onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfile())) ;
             },
           ),

              // listItem(
              //     label: "My Profile",
              //     icon : Icons.account_circle_outlined
              // ) ,

              //nominee details
              ListTile(
                leading: Icon(Icons.add_card_outlined , color: Colors.black,size: 35,),
                hoverColor: Colors.white60,
                title: Text("Nominee Details", style: TextStyle(color: Colors.black ),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfile())) ;
                },
              ),

              // listItem(
              //   label: "Nominee Details",
              //   icon : Icons.add_card_outlined,
              // ),

              //bank details
              ListTile(
                leading: Icon(Icons.account_balance_outlined , color: Colors.black,size: 35,),
                hoverColor: Colors.white60,
                title: Text("Bank Details", style: TextStyle(color: Colors.black ),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BankDetails())) ;
                },
              ),

              // listItem(
              //   label: "Bank Details",
              //   icon : Icons.account_balance_outlined,
              // ),

              //activated savings
              ListTile(
                leading: Icon(Icons.call_to_action_outlined  , color: Colors.black,size: 35,),
                hoverColor: Colors.white60,
                title: Text("Activated Savings", style: TextStyle(color: Colors.black ),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BankDetails())) ;
                },
              ),

              // listItem(
              //     label: "Activated Savings",
              //     icon : Icons.call_to_action_outlined              ) ,


              //withdraw savings
              ListTile(
                leading: Icon(Icons.account_balance_wallet_outlined  , color: Colors.black,size: 35,),
                hoverColor: Colors.white60,
                title: Text("Withdraw Savings", style: TextStyle(color: Colors.black ),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BankDetails())) ;
                },
              ),


              // listItem(
              //     label: "Withdraw Savings",
              //     icon : Icons.account_balance_wallet_outlined
              // ),



              //order history
              ListTile(
                leading: Icon(Icons.book_outlined  , color: Colors.black,size: 35,),
                hoverColor: Colors.white60,
                title: Text("Order History", style: TextStyle(color: Colors.black ),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BankDetails())) ;
                },
              ),
              // listItem(
              //     label: "Order History",
              //     icon : Icons.book_outlined
              // ),


              //security and permissions
              ListTile(
                leading: Icon(Icons.lock_outline_rounded  , color: Colors.black,size: 35,),
                hoverColor: Colors.white60,
                title: Text("Security & Permissions", style: TextStyle(color: Colors.black ),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BankDetails())) ;
                },
              ),

              // listItem(
              //     label: "Security & Permissions",
              //     icon : Icons.lock_outline_rounded
              // ) ,



              //faq
              ListTile(
                leading: Icon(Icons.question_answer_outlined  , color: Colors.black,size: 35,),
                hoverColor: Colors.white60,
                title: Text("FAQ", style: TextStyle(color: Colors.black ),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BankDetails())) ;
                },
              ),

              // listItem(
              //     label: "FAQ",
              //     icon : Icons.question_answer_outlined
              // ),

              //about filit
              ListTile(
                leading: Icon(Icons.info_outline  , color: Colors.black,size: 35,),
                hoverColor: Colors.white60,
                title: Text("About Filit", style: TextStyle(color: Colors.black ),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BankDetails())) ;
                },
              ),
              // listItem(
              //     label: "About Filit",
              //     icon : Icons.info_outline
              // )


            ],
          ),

      ),
    );
  }

  // Widget listItem({
  //   required String label,
  //   required IconData icon,
  //   required Function onpressed ,
  //
  // }){
  //   final color = Colors.black;
  //   final hovercolor = Colors.white60;
  //
  //   return ListTile(
  //     leading: Icon(icon , color: color,size: 35,),
  //     hoverColor: hovercolor,
  //     title: Text(label, style: TextStyle(color: color ),),
  //     onTap: (){
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfile())) ;
  //     },
  //   );
  // }


}