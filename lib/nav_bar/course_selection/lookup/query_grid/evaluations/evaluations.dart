import 'package:flutter/material.dart';

import '../../../../../hover_builder.dart';
import 'rate_my_professor.dart';

class Evaluations extends StatelessWidget {
  final RateMyProfessor rateMyProfessor;

  const Evaluations({Key? key, required this.rateMyProfessor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(builder: (isHovering) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Text(
            'Evaluations >',
            style: TextStyle(
              fontWeight: isHovering ? FontWeight.w500 : FontWeight.w400,
              fontSize: isHovering ? 16 : 14,
            ),
          ),
          Positioned(
            bottom: -30,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isHovering ? 48 : 0,
              width: isHovering ? 64 : 0,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: ClipRect(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Rate My Professor\n',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    decoration: TextDecoration.underline,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                      '${rateMyProfessor.rating} / 5.0 \n${rateMyProfessor.numReviews} reviews',
                                      style: const TextStyle(
                                        fontSize: 10,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}