void main() {
  
var names=["faiza", "hafsa", "quratullain", "maaz", "mufti sahab"];
print(names);
print(names[4]);

print(names.length);
names.add("abdulahad");
print(names);


names.addAll(["kainat","fahad", "sami", "sharil"]);
print(names);

names.insert(1, "fatimah");
print(names);

names.insertAll(4, ["affan", "umar", "hiba", "jawwad"]);
print(names);

names[0]="faiza abdul sattar";
print(names);

names.replaceRange(1, 4, ["zaid", "bakar", "hussain", "haasaan"]);
print(names);


names.remove("zaid");
print(names);

names.removeAt(1);
print(names);


names.removeLast();
print(names);

names.removeRange(1,4);
print(names);



print(names.length);
print(names.reversed);
print(names.first);
print(names.last);
print(names.isEmpty);
print(names.isNotEmpty);

}