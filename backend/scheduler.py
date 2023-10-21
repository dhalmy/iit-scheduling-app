import random  # Import the random module
from pprint import pp
from database import getCourse

class Scheduler: # class to create class schedule variations
    def __init__(self) -> None:
        pass

    def _parse_time(self, time_str):
        """Parse a time period string into a tuple of integers."""
        start, end = time_str.split(' - ')
        return int(start), int(end)

    def _is_overlapping(self, course1, course2):
        """Check if two courses overlap in time and days."""
        days1 = set(course1['days'])
        days2 = set(course2['days'])

        if not days1.intersection(days2):
            return False

        start1, end1 = self._parse_time(course1['time'])
        start2, end2 = self._parse_time(course2['time'])

        return not (end1 <= start2 or start1 >= end2)

    def get_schedule(self, courses, desired_count=5):
        """Select a set number of non-overlapping courses."""
        courses.sort(key=lambda x: self._parse_time(x['time'])[0])
        random.shuffle(courses)  # Shuffle the list after sorting

        selected_courses = []
        added_courses = set()  # A set to keep track of added courses' names

        for course in courses:
            # Check for course name duplication
            if course['courseTitle'] in added_courses:
                continue

            if any(self._is_overlapping(course, selected_course) for selected_course in selected_courses):
                continue

            selected_courses.append(course)
            added_courses.add(course['courseTitle'])  # Add the course name to the set

            if len(selected_courses) == desired_count:
                break

        return selected_courses

course_list = [
    ('CS', '330'),
    ('CS', '425'),
    ('CS', '350'),
    ('CS', '351'),
    ('CS', '116'),
    ('CS', '430'),
    ('MATH', '251'),
    ('MATH', '152'),
    ('PHYS', '221'),
    ]

courses = []

for c in course_list:
    courses.extend(getCourse(c[0], c[1]))

pp(courses)

selected_courses = Scheduler().get_schedule(courses)
for course in selected_courses:
    print(f"Selected {course['courseTitle']} with {course['instructor']} at {course['time']} on days {course['days']}")
