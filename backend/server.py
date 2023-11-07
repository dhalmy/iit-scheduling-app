from flask import Flask, request, jsonify
from scheduler import Scheduler 
from database import getCourse

app = Flask(__name__)

@app.route('/generate_schedule', methods=['POST'])
def generate_schedule():
    course_list = request.json['courseList']
    courses = [group for group in (getCourse(c[0], c[1]) for c in course_list) if group is not None]
    
    scheduler = Scheduler()
    selected_courses = scheduler.get_schedule(courses)
    
    # Convert the selected courses into a JSON-serializable format
    selected_courses_json = [{k: v for k, v in course.items()} for course in selected_courses]
    
    return jsonify(selected_courses_json)

if __name__ == '__main__':
    app.run(debug=True)
