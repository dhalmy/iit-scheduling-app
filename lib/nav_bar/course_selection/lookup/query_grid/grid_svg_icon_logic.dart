import 'package:flutter_svg/flutter_svg.dart';

import '../query_logic/course_prerequisites.dart';


// Merge to one method. Explicitly pass total and current. Pass through the bool
// iswidgetsmall to determine icon size since we already adjusted the text size for it
class GridSvgIconLogic {
  SvgPicture getSectionsIcon(int courseEnrolled, int courseMax) {
    String iconName = '';

    if(courseEnrolled > 0 && courseEnrolled < courseMax / 5) {
      iconName = 'checkmark_circle_outline';
    } else if(courseEnrolled > courseMax / 5 && courseEnrolled < courseMax) {
      iconName = 'caution_rounded_triangle_outline';
    } else {
      iconName = 'error_circle_outline';
    }
    // } if(courseEnrolled == courseMax) {
    //   iconName = 'error_circle_outline';
    // }

    return SvgPicture.asset(
      'svgs/$iconName.svg',
      height: 12,
      width: 12,
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
      height: 12,
      width: 12,
    );
  }
}