from flask import Flask, request, jsonify
from flask_cors import CORS
from scheduler import Scheduler 
from database import getCourse

app = Flask(__name__)
CORS(app)

@app.route('/generate_schedule', methods=['POST'])
def generate_schedule():
    print("hi")
    course_list = request.json['courseList']
    courses = [group for group in (getCourse(c[0], c[1]) for c in course_list) if group is not None]
    
    scheduler = Scheduler()
    selected_courses = scheduler.get_schedule(courses)
    
    # Convert the selected courses into a JSON-serializable format
    selected_courses_json = [{k: v for k, v in course.items()} for course in selected_courses]
    
    print(selected_courses)
    return jsonify(selected_courses_json)

from flask import jsonify

@app.route('/get_course_details', methods=['POST'])
def get_course_details():
    course_list = request.json['courseList']
    courses = [group for group in (getCourse(c[0], c[1]) for c in course_list) if group is not None]

    keys_to_keep = ['campus', 'courseNumber', 'days', 'time', 'courseSubject', 'courseTitle', 'courseType']
    filtered_courses = []
    filtered_courses = [[{key: course[key] for key in keys_to_keep if key in course} for course in sublist] for sublist in courses]

    # print(courses)
    print(filtered_courses)
    return jsonify(filtered_courses)


if __name__ == '__main__':
    app.run(debug=True)
