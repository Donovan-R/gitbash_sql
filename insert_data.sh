#!/bin/bash
# Script pour insérer les données de courses.csv et students.csv dans la base de données students
echo 'hello.'
export PGPASSWORD=Admin22
PSQL="psql -X --username=postgres --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, major_courses")
cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z "$MAJOR_ID" ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inséré dans majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z "$COURSE_ID" ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")

      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo Inséré dans courses, $COURSE
      fi
      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi

    # insert into major_courses
    INSERT_MAJOR_COURSES_RESULT=$($PSQL "INSERT INTO major_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJOR_COURSES_RESULT == "INSERT 0 1" ]]
    then
        echo inséré dans major_courses, $MAJOR $COURSE
    fi
  fi
done

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA; do
if [[ $FIRST != "first_name" ]]; then
#get major-id
MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
#if not found
if [[ -z "$MAJOR_ID" ]]; then 
# set to null
MAJOR_ID=null
fi
INSERT_STUDENT_RESULT=$($PSQL "INSERT INTO  students(first_name, last_name, major_id, gpa) VALUES('$FIRST', '$LAST', $MAJOR_ID, $GPA)")

#insert student
if [[ $INSERT_STUDENT_RESULT == "INSERT 0 1" ]]; then
  echo Inséré dans students, $FIRST $LAST
fi
fi
done
