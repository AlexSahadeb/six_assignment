import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<String> images = [
    "https://cdn.pixabay.com/photo/2017/02/15/12/12/cat-2068462_1280.jpg",
    "https://cdn.pixabay.com/photo/2016/09/05/21/37/cat-1647775_1280.jpg",
    "https://cdn.pixabay.com/photo/2018/10/01/09/21/pets-3715733_1280.jpg",
    "https://cdn.pixabay.com/photo/2017/12/11/15/34/lion-3012515_1280.jpg",
    "https://cdn.pixabay.com/photo/2017/07/24/19/57/tiger-2535888_1280.jpg",
    "https://cdn.pixabay.com/photo/2017/11/14/13/06/kitty-2948404_1280.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Photo Gellary",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Welcome to our Photo Gallery!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Search photos...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 250,
                child: GridView.builder(
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Image ${index + 1} clicked!'),
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                images[index],
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Photo $index '),
                              ),
                            ],
                          ),
                        )),
              ),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2017/02/15/12/12/cat-2068462_1280.jpg"),
                ),
                title: Text('Photo 1'),
                subtitle: Text('Description Photo 1'),
              ),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2016/09/05/21/37/cat-1647775_1280.jpg"),
                ),
                title: Text('Photo 2'),
                subtitle: Text('Description Photo 2'),
              ),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2018/10/01/09/21/pets-3715733_1280.jpg"),
                ),
                title: Text('Photo 3'),
                subtitle: Text('Description Photo 3'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  shape: const CircleBorder(),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Photos Uploaded Successfully!'),
                    ),
                  );
                },
                child: const Icon(Icons.home),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
