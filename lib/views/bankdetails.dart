import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BankDetails extends StatefulWidget {
  const BankDetails({Key? key}) : super(key: key);

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  //all the controllers here
  TextEditingController nameController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController accountnumberController = TextEditingController();
  TextEditingController bankController = TextEditingController();




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
              child: Center(
                child: Text(
                  "Bank Details" ,
                  style: TextStyle(color: Colors.black , fontWeight: FontWeight.w500 , fontSize: 24
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,) ,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                children: [
                  TextFieldWidget('Account Holder Name', nameController) ,
                  const SizedBox(height :20) ,
                  TextFieldWidget('IFSC Code', ifscController),
                  const SizedBox(height: 20,) ,
                  AccountNumberFieldWidget('Ac Number', accountnumberController),
                  const SizedBox(height: 20,),
                  TextFieldWidget('Bank Name', bankController) ,
                  const SizedBox(height: 150,),
                  saveButton('Save', (){}) ,
                  const SizedBox(height: 10,),
                  cancelButton('Cancel', (){})
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

  AccountNumberFieldWidget(
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

  Widget cancelButton(String title , Function onPressed){
    return TextButton(onPressed: ()=> onPressed,
        child: Text( 'Cancel',
          style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500 ,
              color: Colors.grey),
        )) ;
  }


}
