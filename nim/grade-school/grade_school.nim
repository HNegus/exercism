import std/algorithm

type
  Student* = object
    name*: string
    grade*: int

  School* = object
    students*: seq[Student]

proc studentCmp(x, y: Student): int =
  if y.grade > x.grade:
    return -1
  if y.grade == x.grade:
    if y.name > x.name:
      return -1
    elif y.name == x.name:
      return 0
    return 1
  return 1


proc roster*(school: School): seq[string] =
  ## Returns the names of every student in the `school`, sorted by grade then name.
  var students = school.students
  sort(students, studentCmp)
  for student in students:
    result.add(student.name)

proc addStudent*(school: var School, name: string, grade: int) =
  ## Adds a student with `name` and `grade` to the `school`.
  ##
  ## Raises a `ValueError` if `school` already contains a student named `name`.
  for student in school.students:
    if student.name == name:
      raise newException(ValueError, "Name already exists")
  school.students.add(Student(name: name, grade: grade))
  

proc grade*(school: School, grade: int): seq[string] =
  ## Returns the names of the students in the given `school` and `grade`, in
  ## alphabetical order.
  var students: School
  for student in school.students:
    if student.grade == grade:
      students.students.add(student)
    
  result = roster(students)
