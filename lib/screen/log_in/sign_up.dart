import 'package:flutter/material.dart';
import 'package:medicine_warehouse/model/register_model.dart';
import 'package:medicine_warehouse/screen/Home/Home_Page.dart';
import 'package:medicine_warehouse/screen/Home/category_page.dart';
import 'package:medicine_warehouse/screen/Warehouse.dart';
import 'package:medicine_warehouse/screen/log_in/sign_in.dart';
import 'package:medicine_warehouse/service/post_register.dart';

class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_upState();
}
 final _formKey = GlobalKey<FormState>();
  // final _controller = TextEditingController();

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }

    if (value.length != 12 || !value.startsWith('9639')) {
      return 'Please enter a 12-digit number starting with 9639';
    }

    return null;
  }
class _sign_upState extends State<sign_up> {
  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController number = TextEditingController();
     TextEditingController shop_name = TextEditingController();
    return Scaffold(
      //  backgroundColor: Color.fromARGB(255, 245, 232, 209),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 60,
              child: Image.asset('assets/4.jpg'),
            ),
            Center(
              child: Text('Sign Up',
                  style: TextStyle(
                    color: Color.fromARGB(255, 108, 105, 105),
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 204, 10),
                child: Text('User Name',
                    style: TextStyle(
                      color: Color(0xffD78521),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ))),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 30, right: 30),
              child: SizedBox(
                child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(25)
                        ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffD78521),
                        ),
                        borderRadius: BorderRadius.circular(25)),
                    // contentPadding: EdgeInsets.symmetric(horizontal: ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffD78521),
                        ),
                        borderRadius: BorderRadius.circular(25)),
                    hintText: 'Enter your user name',
                  ),
                ),
              ),
            ),
               Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 204, 10),
                child: Text('Shop Name',
                    style: TextStyle(
                      color: Color(0xffD78521),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ))),
                        Padding(
              padding: const EdgeInsets.only(top: 0, left: 30, right: 30),
              child: SizedBox(
                child: TextField(
                  controller: shop_name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(25)
                        ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffD78521),
                        ),
                        borderRadius: BorderRadius.circular(25)),
                    // contentPadding: EdgeInsets.symmetric(horizontal: ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffD78521),
                        ),
                        borderRadius: BorderRadius.circular(25)),
                    hintText: 'Enter your shop name',
                  ),
                ),
              ),
            ),
            // Padding(
            //     padding: const EdgeInsets.fromLTRB(20, 15, 182, 10),
            //     child: Text('Phone Number',
            //         style: TextStyle(
            //           color: Color(0xffD78521),
            //           fontSize: 17,
            //           fontWeight: FontWeight.w500,
            //         ))),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 182, 10),
                child: Text('Phone Number',
                    style: TextStyle(
                      color: Color(0xffD78521),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ))),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 30, right: 30),
              child: SizedBox(
                child: Form(
                 key: _formKey,
                  child: TextFormField(
                    // keyboardType: TextInputType.number,
                    controller: number,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText:'Enter a 12-digit number starting with 9639' ,
                      // suffixIcon: InkWell(
                      //     onTap: () {},
                      //     child: Icon(
                      //       Icons.visibility,
                      //       color: Color(0xffD78521),
                      //     )),
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(25)
                          ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffD78521),
                          ),
                          borderRadius: BorderRadius.circular(25)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffD78521),
                          ),
                          borderRadius: BorderRadius.circular(25)),
                      // hintText: 'Enter your user number',
                    ),
                    validator: _validateInput,
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 225, 10),
                child: Text('Password',
                    style: TextStyle(
                      color: Color(0xffD78521),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ))),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 30, right: 30),
              child: SizedBox(
                child: TextFormField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  keyboardType: TextInputType.number,
                  controller: password,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.visibility,
                          color: Color(0xffD78521),
                        )),
                    border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(25)
                        ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffD78521),
                        ),
                        borderRadius: BorderRadius.circular(25)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffD78521),
                        ),
                        borderRadius: BorderRadius.circular(25)),
                    hintText: 'Enter your user password',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: InkWell(
                onTap: () async {
                  if(_formKey.currentState?.validate() == true){

                   bool isaccrpt = 
                  await register(registerModel(
                      username: username.text,
                      password: password.text,
                      mobile: int.parse(number.text),
                      shop_name:shop_name.text));
                    if (isaccrpt) {
                     Navigator.push(context, MaterialPageRoute(
                       builder: (context) {
                         return warehouse();
                       },
                     ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        
                        content: Text('Failed'),
                        backgroundColor: Colors.red,
                      ));
                    }
                  }
                },
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffD78521),
                  ),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have account? ',
                      style: TextStyle(
                          color: Color(0xffA7A6A5),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return sign_in();
                          },
                        ));
                      },
                      child: Text(
                        ' Sign In',
                        style: TextStyle(
                            color: Color(0xffD78521),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
