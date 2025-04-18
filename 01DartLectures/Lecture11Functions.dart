void main(List<String> args) {
  add();
  addvalue(10, 20);
  addvalue(100, 27780);
  addvalue(190, 20);
  addvalue(1989, 2870);
  addvalue(1220, 2880);

  print(addvalues(120, 200));
  print(myname("Abdul Qadeer"));
}

void add() {
  print(10 + 11);
}

void addvalue(var a, var b) {
  print(a + b);
}

String myname(var name) {
  return name;
}


int addvalues(var a, var b) {
  return a + b;
}