class StudentModel {
  final StudentInfo? studentInfo;
  final UnitsInfo? unitsInfo;
  final List<Course>? courses;
  final FinancialStatus? financialStatus;

  StudentModel({
    this.studentInfo,
    this.unitsInfo,
    this.courses,
    this.financialStatus,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        studentInfo: json["student_info"] == null ? null : StudentInfo.fromJson(json["student_info"]),
        unitsInfo: json["units_info"] == null ? null : UnitsInfo.fromJson(json["units_info"]),
        courses: json["courses"] == null ? [] : List<Course>.from(json["courses"]!.map((x) => Course.fromJson(x))),
        financialStatus: json["financial_status"] == null ? null : FinancialStatus.fromJson(json["financial_status"]),
      );

  Map<String, dynamic> toJson() => {
        "student_info": studentInfo?.toJson(),
        "units_info": unitsInfo?.toJson(),
        "courses": courses == null ? [] : List<dynamic>.from(courses!.map((x) => x.toJson())),
        "financial_status": financialStatus?.toJson(),
      };

  @override
  String toString() {
    return 'StudentModel(studentInfo: $studentInfo, unitsInfo: $unitsInfo, courses: $courses, financialStatus: $financialStatus)';
  }
}

class Course {
  final String? courseName;
  final String? courseCode;
  final String? classCode;
  final int? credits;
  final String? instructor;
  final String? time;
  final String? location;
  final String? tuition;

  Course({
    this.courseName,
    this.courseCode,
    this.classCode,
    this.credits,
    this.instructor,
    this.time,
    this.location,
    this.tuition,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        courseName: json["course_name"],
        courseCode: json["course_code"],
        classCode: json["class_code"],
        credits: json["credits"],
        instructor: json["instructor"],
        time: json["time"],
        location: json["location"],
        tuition: json["tuition"],
      );

  Map<String, dynamic> toJson() => {
        "course_name": courseName,
        "course_code": courseCode,
        "class_code": classCode,
        "credits": credits,
        "instructor": instructor,
        "time": time,
        "location": location,
        "tuition": tuition,
      };

  @override
  String toString() {
    return 'Course(courseName: $courseName, courseCode: $courseCode, classCode: $classCode, credits: $credits, instructor: $instructor, time: $time, location: $location, tuition: $tuition)';
  }
}

class FinancialStatus {
  final String? debt;
  final String? credit;
  final String? finalBalance;

  FinancialStatus({
    this.debt,
    this.credit,
    this.finalBalance,
  });

  factory FinancialStatus.fromJson(Map<String, dynamic> json) => FinancialStatus(
        debt: json["debt"],
        credit: json["credit"],
        finalBalance: json["final_balance"],
      );

  Map<String, dynamic> toJson() => {
        "debt": debt,
        "credit": credit,
        "final_balance": finalBalance,
      };
}

class StudentInfo {
  final String? name;
  final String? studentNumber;
  final String? faculty;
  final String? major;
  final String? entryYear;

  StudentInfo({
    this.name,
    this.studentNumber,
    this.faculty,
    this.major,
    this.entryYear,
  });

  factory StudentInfo.fromJson(Map<String, dynamic> json) => StudentInfo(
        name: json["name"],
        studentNumber: json["student_number"],
        faculty: json["faculty"],
        major: json["major"],
        entryYear: json["entry_year"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "student_number": studentNumber,
        "faculty": faculty,
        "major": major,
        "entry_year": entryYear,
      };
}

class UnitsInfo {
  final int? totalUnits;
  final String? fixedTuition;
  final String? variableTuition;
  final String? totalTuition;

  UnitsInfo({
    this.totalUnits,
    this.fixedTuition,
    this.variableTuition,
    this.totalTuition,
  });

  factory UnitsInfo.fromJson(Map<String, dynamic> json) => UnitsInfo(
        totalUnits: json["total_units"],
        fixedTuition: json["fixed_tuition"],
        variableTuition: json["variable_tuition"],
        totalTuition: json["total_tuition"],
      );

  Map<String, dynamic> toJson() => {
        "total_units": totalUnits,
        "fixed_tuition": fixedTuition,
        "variable_tuition": variableTuition,
        "total_tuition": totalTuition,
      };
}
