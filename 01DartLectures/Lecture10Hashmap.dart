void main() {
Map studentDetail = {
    "name": "zaid",
    "age": 27,
    "hobbies": ["reading", "reciting"],
    "education":{"BS":2020, "MS":2022, "Mphil":2023, "phd":2025}
  };

  print(studentDetail);
  print(studentDetail["name"]);
  print(studentDetail["age"]);
  print(studentDetail["hobbies"]);
  print(studentDetail["education"]["phd"]);


  print(studentDetail.isEmpty);
  print(studentDetail.isNotEmpty);
  print(studentDetail.length);
  print(studentDetail.remove("age"));


  print(studentDetail.containsKey("age"));
  print(studentDetail.containsValue("zaid"));
}
