import 'package:flutter/material.dart';
import 'package:medicine_warehouse/model/login_model.dart';
import 'package:medicine_warehouse/screen/Home/Home_Page.dart';
import 'package:medicine_warehouse/screen/Home/category_page.dart';
import 'package:medicine_warehouse/screen/Warehouse.dart';
import 'package:medicine_warehouse/screen/log_in/sign_up.dart';
import 'package:medicine_warehouse/service/post_login.dart';

class sign_in extends StatefulWidget {
  const sign_in({super.key});

  @override
  State<sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
  @override
  Widget build(BuildContext context) {
    TextEditingController mobile = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      //  backgroundColor: Color.fromARGB(255, 245, 232, 209),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 60,
              child: Image.asset('assets/4.jpg',
              //   colorBlendMode:BlendMode.hardLight ,
              //  color: Colors.white60,
              ),

            ),
            Center(
              child: Text('Sign In',
                  style: TextStyle(
                    color: Color.fromARGB(255, 108, 105, 105),
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 204, 10),
                child: Text('Number',
                    style: TextStyle(
                      color: Color(0xffD78521),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ))),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 30, right: 30),
              child: SizedBox(
                child: TextField(
                  controller: mobile,
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
                padding: const EdgeInsets.fromLTRB(20, 15, 210, 10),
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
              padding: const EdgeInsets.only(top: 230),
              child: InkWell(
                onTap: () async {
                  // bool isAccept =
                  await login(
                      loginModel(mobile: int.parse(mobile.text), password: password.text));
                    // if (isAccept) {
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) {
                           return warehouse();
                         },
                       ),
                     );
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                    //     content: Text('Failed'),
                    //     backgroundColor: Colors.red,
                    //   ));
                    // }
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
                      'Sign In',
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
                      'Don’t have an account?',
                      style: TextStyle(
                          color: Color(0xffA7A6A5),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return sign_up();
                          },
                        ));
                      },
                      child: Text(
                        ' Sign Up',
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
