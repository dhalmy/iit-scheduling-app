import 'package:flutter_svg/flutter_svg.dart';

import '../query_logic/course_prerequisites.dart';

class GridSvgIconLogic {
  SvgPicture getSectionsIcon(int courseEnrolled, int courseMax) {
    String iconName = '';

    if(courseEnrolled == 0) {
      iconName = 'error_circle_outline';
    } else if(courseEnrolled > 0 && courseEnrolled < courseMax / 5) {
      iconName = 'caution_rounded_triangle_outline';
    } else if(courseEnrolled > courseMax / 5 && courseEnrolled < courseMax) {
      iconName = 'checkmark_circle_outline';
    }

    return SvgPicture.asset(
      'svgs/$iconName.svg',
      height: 13,
      width: 13,
    );
  }

  SvgPicture getCoursePrerequisitesIcon(CoursePrerequisites coursePrerequisites) {
    String iconName = '';

    if(false) {
      iconName = 'checkmark_circle_outline';
    } else {
      iconName = 'error_circle_outline';
    }

    return SvgPicture.asset(
      'svgs/$iconName.svg',
      height: 13,
      width: 13,
    );
  }
}