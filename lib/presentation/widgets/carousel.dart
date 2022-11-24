
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key, required this.images, required this.date, required this.title});
  final String images;
  final DateTime date;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ 
          
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  offset: Offset(1, 0),
                  spreadRadius: 0,
                  blurRadius: 4,
                  color: Colors.grey)
            ],
            image: DecorationImage(
              image:NetworkImage(
                images
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          
      
      ),
    Container(
       decoration: BoxDecoration(
           color: Colors.black.withOpacity(0.3),
            
            borderRadius: BorderRadius.circular(15),
          ),
        
          margin: const EdgeInsets.all(10),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(DateFormat.MMMMEEEEd()
                                        .format(date),style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white70)),
              Text(title,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)),
            ],
          ),
        ),
        ]
    );
  }
}
