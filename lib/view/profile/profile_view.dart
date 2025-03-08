import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    _nameController = TextEditingController(text: "Sabin Poudel");
    _emailController = TextEditingController(text: "sabin@gmail.com");
    _descriptionController =
        TextEditingController(text: "This is the static data ");

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
            ),
          )
        ],
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 2,
                ),
                TextFormField(
                  enabled: false,
                  controller: _nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_outline,
                    ),
                  ),
                ),
                TextFormField(
                  enabled: false,
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                    ),
                  ),
                ),
                TextFormField(
                  enabled: false,
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.description,
                    ),
                  ),
                ),
                Spacer()
              ],
            ),
          ),
          Container(
            height: size.height * 0.25,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.camera,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.3,
            top: size.height * 0.15,
            child: CircleAvatar(
              radius: size.width * 0.2,
              backgroundImage: NetworkImage(
                "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
              ),
            ),
          )
        ],
      ),
    );
  }
}
