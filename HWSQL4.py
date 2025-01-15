import sqlitelib

db_name: str = "HWSQL4.db"
conn, cursor = sqlitelib.connect_db(db_name)

# Exercise 4
result_select_courses = sqlitelib.read_query(cursor, "SELECT * FROM courses")
for item in result_select_courses:
    print(item)

# Exercise 5
course_topic = input("Enter the name of the new course: ")
course_hours = int(input("Enter the number of hours for the new course: "))

sqlitelib.update_query(
    cursor, conn,
    "INSERT INTO courses (topic, hours) VALUES (?,?)",
    (course_topic, course_hours))

result_select_courses = sqlitelib.read_query(cursor, "SELECT * FROM courses")
for item in result_select_courses:
    print(item)

conn.close()
