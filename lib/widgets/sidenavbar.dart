import 'package:flutter/material.dart';

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
              listItem(
                  label: "My Profile",
                  icon : Icons.account_circle_outlined
              ) ,

              listItem(
                label: "Nominee Details",
                icon : Icons.add_card_outlined,
              ),

              listItem(
                label: "Bank Details",
                icon : Icons.account_balance_outlined,
              ),

              listItem(
                  label: "Activated Savings",
                  icon : Icons.call_to_action_outlined              ) ,
              listItem(
                  label: "Withdraw Savings",
                  icon : Icons.account_balance_wallet_outlined
              ),
              listItem(
                  label: "Order History",
                  icon : Icons.book_outlined
              ),

              listItem(
                  label: "Security & Permissions",
                  icon : Icons.lock_outline_rounded
              ) ,
              listItem(
                  label: "FAQ",
                  icon : Icons.question_answer_outlined
              ),
              listItem(
                  label: "About Filit",
                  icon : Icons.info_outline
              )
            ],
          ),

      ),
    );
  }

  Widget listItem({
    required String label,
    required IconData icon
  }){
    final color = Colors.black;
    final hovercolor = Colors.white60;

    return ListTile(
      leading: Icon(icon , color: color,size: 35,),
      hoverColor: hovercolor,
      title: Text(label, style: TextStyle(color: color ),),
      onTap: (){

      },
    );
  }
}