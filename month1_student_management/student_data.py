students = []

def add_student():
    """
    TODO: Prompt the user to enter student name, age, and grade.
    Append the student as a dictionary to the students list.
    """
    name = input("Insert student name: ")
    age = int(input("Insert student age: "))
    grade = float(input("Insert student grade: "))
    
    student = {
        "name": name,
        "age": age,
        "grade": grade
    }
    students.append(student)
    print(f'student {name} registered successfully.')
    

def view_students():
    """
    TODO: Loop through the students list and print each student's info.
    """
    for student in students:
        print(f"Name: {student['name']}, Age: {student['age']}, Grade: {student['grade']}")

def get_average_grade():
    """
    TODO: Return the average grade of all students.
    """
    total = 0
    for student in students:
        total += student['grade']
    average = total / len(students) if students else 0
    print(f"The average grade is: {average}")
    return average
    
    