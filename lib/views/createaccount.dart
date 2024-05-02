import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController() ;
  TextEditingController genderController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded
            ,color: Colors.black,),
        ),
      ) ,
      body: SingleChildScrollView(
        child: Column(

          children: [
            Container(
              child: Text(
                  "Create an account" ,
                  style: TextStyle(color: Colors.black , fontWeight: FontWeight.w500 , fontSize: 24
                  ),
                ),

            ),
            SizedBox(height: 20,) ,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                children: [
                  // TextFieldWidget('Full Name', nameController) ,
                  // const SizedBox(height :20) ,
                  // DobFieldWidget('DOB', dobController),
                  // const SizedBox(height: 20,) ,
                  // TextFieldWidget('Email', emailController) ,
                  // const SizedBox(height: 20,) ,
                  // TextFieldWidget('Gender' , genderController),
                  // const SizedBox(height: 20,) ,
                  PinFieldWidget('Mobile Number', mobileController),
                  const SizedBox(height: 80,),
                  saveButton('Sign Up', (){}) ,
                  const SizedBox(height: 10,),
                  // cancelButton('Cancel', (){})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFieldWidget(
      String title ,
      // IconData iconData ,
      TextEditingController controller
      ){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w600 , color: Colors.grey),) ,
        const SizedBox(height: 10,) ,
        Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(
              //   color: Colors.grey,
              //   width: 1,
              // ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 1
                )
              ],
              borderRadius: BorderRadius.circular(4)

          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(

                  border: InputBorder.none
              ),
            ),
          ),
        )
      ],
    );
  }

  DobFieldWidget(
      String title ,
      // IconData iconData ,
      TextEditingController controller
      ){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w600 , color: Colors.grey),) ,
        const SizedBox(height: 10,) ,
        Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(
              //   color: Colors.grey,
              //   width: 1,
              // ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 1
                )
              ],
              borderRadius: BorderRadius.circular(4)

          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                // hintText: 'Enter your DOB',
                  border: InputBorder.none
              ),
            ),
          ),
        )
      ],
    );
  }

  PinFieldWidget(
      String title ,
      // IconData iconData ,
      TextEditingController controller
      ){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w600 , color: Colors.grey),) ,
        const SizedBox(height: 10,) ,
        Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(
              //   color: Colors.grey,
              //   width: 1,
              // ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 1
                )
              ],
              borderRadius: BorderRadius.circular(4)

          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                // hintText: 'Enter your DOB',
                  border: InputBorder.none
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget saveButton(String title , Function onPressed){
    return MaterialButton(
      minWidth: double.infinity,
      height: 45,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: HexColor("0000FF"),
      onPressed: () => onPressed,
      child: Text(
        title,
        style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500 ,
            color: Colors.white),
      ),
    );
  }

  // Widget cancelButton(String title , Function onPressed){
  //   return MaterialButton(
  //     minWidth: double.infinity,
  //     height: 45,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  //     color: Colors.white,
  //     onPressed: () => onPressed,
  //     child: Text(
  //       title,
  //       style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500 ,
  //           color: Colors.grey),
  //     ),
  //   );
  // }

  Widget cancelButton(String title , Function onPressed){
    return TextButton(onPressed: ()=> onPressed,
        child: Text( 'Cancel',
          style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500 ,
              color: Colors.grey),
        )) ;
  }

}
