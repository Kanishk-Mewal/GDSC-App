import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
void main() {
  runApp(const myApp());
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController myController =
      TextEditingController(); // Abstract data type constructor
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 20,
          toolbarHeight: MediaQuery.of(context).size.height * 0.13,
          backgroundColor: Color(0xFF00BFA5),
          title: const Center(
              child: Text(
            'LOGIN',
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 22),
          )),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage('images/gdsc_icon.png'),
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.height * 0.2,
                  )
                ],
              ), // For Logo/Image
              const SizedBox(
                height: 50,
              ), //gap between image and stuff
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Icon(
                        Icons.person_rounded,
                        size: 35,
                        color: Color(0xFF00BFA5),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.1,
                      ) // gap below icon
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.13,
                    width: MediaQuery.of(context).size.width * 0.73,
                    child: TextFormField(
                      controller: myController,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(fontSize: 20),
                        fillColor: Color(0xFF00BFA5),
                        border: OutlineInputBorder(),
                        labelText: " User-ID",
                      ),
                    ),
                  ), //Textbox
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ), // For User Details
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.vpn_key,
                            size: 35,
                            color: Color(0xFF00BFA5),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.13,
                        width: MediaQuery.of(context).size.width * 0.73,
                        child: TextFormField(
                          controller: passController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(fontSize: 20),
                            border: OutlineInputBorder(),
                            labelText: " Password",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.height * 0.1,
          child: FloatingActionButton.large(
            elevation: 10,
            backgroundColor: Color(0xFF00BFA5),
            onPressed: () {
              if (myController.text == "test@admin.com" &&
                  passController.text == "12345678") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Admin()));
              } else if ((myController.text == "Kanishk" ||
                      myController.text == "kanishk" ||
                      myController.text == "k") &&
                  passController.text == "123") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Admin()));
              } else {}
            },
            child: const Icon(Icons.navigate_next_rounded),
          ),
        ),
      ),
    );
  }
}

class Admin extends StatefulWidget {
  static List<String> items = <String>[]; //entries
  static List<String> prices = <String>[]; //colorcodes
  static List<String> dates = <String>[];

  static List<String> tasks = <String>[];
  static List<String> description = <String>[];
  static int currentIndex = 0;

  const Admin({Key? key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);

    tabController.addListener(_handleTabSelection);
  }
  void _handleTabSelection() {
    if (tabController.indexIsChanging) {
      switch (tabController.index) {
        case 0:
          Admin.currentIndex = 0;
          break;
        case 1:
          Admin.currentIndex = 1;
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            bottom: TabBar(
              controller: tabController,
              tabs: const [
                Tab(
                  text: "Items",
                  icon: Icon(Icons.fastfood),
                ),
                Tab(
                  text: "Tasks",
                  icon: Icon(Icons.check),
                ),
              ],
            ),
            elevation: 20,
            automaticallyImplyLeading: false,
            // toolbarHeight: MediaQuery.of(context).size.height * 0.1,
            backgroundColor: const Color(0xFF00BFA5),
            title: const Center(
              child: Text(
                'YOUR LISTS',
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 20),
              ),
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 40, 20, 20),
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      itemCount: Admin.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Material(
                          elevation: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Container(
                                // height: MediaQuery.of(context).size.height * 0.1,
                                decoration: const BoxDecoration(
                                  //   border: Border.all(color: Colors.black12),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                // color: Colors.white70,
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${index + 1}.    ",
                                          style: const TextStyle(
                                              fontFamily: "Montserrat",
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            Admin.items[index],
                                            style: const TextStyle(
                                                fontFamily: "Montserrat",
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(Admin.dates[index],
                                              style: const TextStyle(
                                                  fontFamily: "Montserrat",
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ), // for item name and date
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Text("Price",
                                              style: TextStyle(
                                                  fontFamily: "Montserrat",
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500)),
                                          Text(Admin.prices[index],
                                              style: const TextStyle(
                                                  fontFamily: "Montserrat",
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ), // for prices
                                  ],
                                )),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  )
                ],
              ), //1st Page
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      itemCount: Admin.tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Material(
                          elevation: 20,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            child: Container(
                              // height: MediaQuery.of(context).size.height * 0.1,
                              decoration: const BoxDecoration(
                                //   border: Border.all(color: Colors.black12),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              // color: Colors.white70,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${index + 1}.    ",
                                            style: const TextStyle(
                                                fontFamily: "Montserrat",
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ), // for Serial Number
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              Admin.tasks[index],
                                              style: const TextStyle(
                                                  fontFamily: "Montserrat",
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ), // for task name
                                    ],
                                  ),
                                  Row(
                                    children: [ // for Serial Number
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              Admin.description[index],
                                              style: const TextStyle(
                                                  fontFamily: "Montserrat",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ), // for task name
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  )
                ],
              ), //2nd Page
            ],
          ),
          floatingActionButton: SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.height * 0.1,
            child: FloatingActionButton.large(
              elevation: 10,
              backgroundColor: const Color(0xFF00BFA5),
              onPressed: () {
                if (tabController.index == 0) // index = 0 tab
                {
                  Admin.currentIndex = 0;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Details()));
                } else // index = 1 tab
                {
                  Admin.currentIndex = 1;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const TaskAdder()));
                }
              },
              child: const Icon(Icons.add_rounded),
            ),
          ),
        ),
      ),
    );
  }
}

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 20,
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          backgroundColor: Color(0xFF00BFA5),
          title: const Text(
            '\tDetails',
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 22),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(fontSize: 20),
                      fillColor: Color(0xFF00BFA5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText: "Item Name",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(fontSize: 20),
                      fillColor: Color(0xFF00BFA5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText: "Item Price",
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // THESE 2 ARE BUTTONS
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ElevatedButton(
                      // style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF00BFA5)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Cancel",
                        style:
                            TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ElevatedButton(
                      // style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF00BFA5)),
                      ),
                      onPressed: () {
                        if (nameController.text != "" &&
                            priceController.text != "") {
                          DateTime now = DateTime.now();
                          String formattedDate =
                              DateFormat('\nhh:mm a, d MMM').format(now);
                          setState(() {
                            Admin.items.add(nameController.text);
                            Admin.prices.add("₹" + priceController.text);
                            Admin.dates.add(formattedDate);
                            // HEREEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Admin()));
                          });
                        } else {
                          null;
                        }
                      },
                      child: const Text("Add Item",
                          style: TextStyle(
                              fontSize: 16, fontFamily: 'Montserrat')),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TaskAdder extends StatefulWidget {
  const TaskAdder({Key? key}) : super(key: key);

  @override
  _TaskAdderState createState() => _TaskAdderState();
}

class _TaskAdderState extends State<TaskAdder> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 20,
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          backgroundColor: const Color(0xFF00BFA5),
          title: const Text(
            '\tAdd a Task',
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 22),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(fontSize: 20),
                      fillColor: Color(0xFF00BFA5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText: "Task Title",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.34,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    minLines: 10,
                    maxLines: 11,
                    keyboardType: TextInputType.multiline,
                    controller: descController,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(fontSize: 20),
                      fillColor: Color(0xFF00BFA5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText: "Task Description",
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // THESE 2 ARE BUTTONS
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ElevatedButton(
                      // style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF00BFA5)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Cancel",
                        style:
                            TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ElevatedButton(
                      // style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF00BFA5)),
                      ),
                      onPressed: () {
                        if (nameController.text != "") {
                          setState(() {
                            Admin.tasks.add(nameController.text);
                            Admin.description.add("\n"+descController.text);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Admin()));

                          });
                          // print(Admin.tasks);
                          // print(Admin.description);
                        } else {
                          null;
                        }
                      },
                      child: const Text("Add Task",
                          style: TextStyle(
                              fontSize: 16, fontFamily: 'Montserrat')),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
