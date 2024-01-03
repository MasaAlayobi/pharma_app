import 'package:flutter/material.dart';

import 'package:medicine_warehouse/screen/log_in/sign_in.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Color.fromARGB(255, 245, 232, 209),
        //  backgroundColor: Color(0xffF2D398),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                child: Image(image: AssetImage('assets/1.jpg',),
                  height: 370,
                colorBlendMode:BlendMode.hardLight ,
                  //  coloFilter:ColorFilter.mode(Colors.white, BlendMode.lighten)
                  )
                  ),
            Text(
              'Welcome to the\n   warehouse !',
              style: TextStyle(
                  color: Color(0xff22333B),
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context) {
                        return sign_in() ;
                      },));
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
                      'Get started',
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
