import 'dart:io';
import 'package:task_1/task_1.dart' as task_1;

void main() {
  int id, age;
  String name, faculty;
  String temp;

  // List member = [
  //   [8, "Yusuf", 20, "fcai"],
  //   [2, "ahmed", 10, "aaaaa"],
  //   [5, "kkkk", 60, "bbbb"]
  // ];

  List<Map<String, Object>> member2 = [
    {'id': 8, 'name': "yusuf", 'age': 20, 'Faculty': "Fcai"},
    {'id': 7, 'name': "ali", 'age': 10, 'Faculty': "papa"},
    {'id': 6, 'name': "omar", 'age': 30, 'Faculty': "lala"}
  ];
  // List sortedList = member2;
  print(member2);
  print("****************************************************");
  do {
    try {
      print("1-Add new member  ");
      print("2-Delete member");
      print("3-Search by id");
      print("4-Search by Name");
      print("5-Display all members Sorted by Name");
      print("6-Display all members unsorted");
      print("--------------------------------------");
      print("Please put Number and press Enter  : ");
      int choise = int.parse(stdin.readLineSync()!);

      switch (choise) {
        case 1:
          print("Enter id : ");
          id = int.parse(stdin.readLineSync()!);
          print("Enter Name : ");
          name = stdin.readLineSync()!; // i for null safetey
          name.toLowerCase();
          print("Enter Age : ");
          age = int.parse(stdin.readLineSync()!);
          print("Enter Faculty : ");
          faculty = stdin.readLineSync()!;
          member2.add(addMember(id, name, age, faculty));

          break;
        case 2:
          print("Enter id : ");
          id = int.parse(stdin.readLineSync()!);
          deleteMember(id, member2);

          break;

        case 3:
          print("Enter id : ");
          id = int.parse(stdin.readLineSync()!);
          searchId(id, member2);
          break;
        case 4:
          print("Enter Name : ");
          name = stdin.readLineSync()!;
          name.toLowerCase();
          searchName(name, member2);
          break;
        case 5:
          sortByName(member2);
          break;
        case 6:
          unSort(member2);
          break;
      }
    } catch (e) {
      print(e);
    }

    print("wants to perform any additional operation? y/n");

    temp = stdin.readLineSync()!;

    if (temp == 'n') {
      exit(0);
    }
  } while (temp == 'y');

  //print(member2);
}

Map<String, Object> addMember(int id, String name, int age, String faculty) {
  var newMember = {'id': id, 'name': name, 'age': age, 'Faculty': faculty};

  return newMember;
}
/*
add_Member(int id, String name, int age, String faculty, List list) {
  List newMember = [id, name, age, faculty];
  list.add(newMember);
}*/

void deleteMember(int keyId, List list) {
  for (int i = 0; i < list.length; i++) {
    if (keyId == list[i]['id']) {
      //id = member2[i]['id'];
      list.removeAt(i);
      break;
    } else {
      print("Not found to delete");
    }
  }
}

void searchId(int keyId, List list) {
  for (var i = 0; i < list.length; i++) {
    if (keyId == list[i]['id']) {
      print(list[i]);
      break;
    } else {
      print("Not found");
    }
  }
}

void searchName(String name, List list) {
  for (var i = 0; i < list.length; i++) {
    if (name == list[i]['name']) {
      print(list[i]);
      break;
    } else {
      print("Not found");
    }
  }
}

void sortByName(List list) {
  list.sort((m1, m2) {
    return m1["name"]!.compareTo(m2["name"]!);
  });
  print(list);
}

void unSort(List list) {
  print(list);
}

int binarySearch(List list, int id, int low, int high) {
  if (high <= low) {
    return (id > list[low]['id']) ? (low + 1) : low;
  }

  int mid = ((low + high) / 2) as int;

  if (id == list[mid]['id']) {
    return mid + 1;
  }

  if (id > list[mid]['id']) {
    return binarySearch(list, id, mid + 1, high);
  } else {
    return binarySearch(list, id, low, mid - 1);
  }
}

void binarySort(List list) {
  for (int i = 1; i < list.length; ++i) {
    int j = i - 1;
    int key = list[i]['id'];
    int pos = binarySearch(list, key, 0, j);
    while (j >= pos) {
      list[j + 1]['id'] = list[j]['id'];
      j--;
    }
    list[j + 1]['id'] = key;
  }
}
