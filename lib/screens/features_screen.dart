import 'dart:io';
import 'package:flutter_application_2/screens/Tickets_Screen.dart';
import 'package:flutter_application_2/screens/isupply.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/dashboard.dart';

class RealHome extends StatefulWidget {
  final String name;
  final String email;
  
  const RealHome({super.key, required this.name, required this.email});
  @override
  State<RealHome> createState() => _RealHomeState();
}
class _RealHomeState extends State<RealHome> {
  final List<Map<String, dynamic>> _businesses = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildDrawer(), // 👈 SIDE POPOUT
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // 👈 opens from LEFT
              },
            ),
          ),
          title: const Text(
            'Welcome',
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          backgroundColor: const Color(0xFFF8EED2),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              Tab(text: 'Tickets'),
              Tab(text: 'ISupply'),
            ],
          ),
        ),
        backgroundColor: const Color(0xFFF8EED2),
        body: TabBarView(
          children: [
          const  Tickets(),
          const EmptyListView(),
            _buildBuyiestView(),
          ],
        ),
      ),
    );
  }
  Drawer _buildDrawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Profile Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                    child: Text(
                      widget.name.isNotEmpty ? widget.name[0].toUpperCase() : 'U',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name.isNotEmpty ? widget.name : 'User',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.email,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),

            const Divider(),
            _drawerItem(
              icon: Icons.person_outline,
              title: 'DashBoard',
              onTap: () { Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Dashboard(
                            name: widget.name,
                            email: widget.email,
                          )),
                    );},
            ),
            _drawerItem(
              icon: Icons.person_outline,
              title: 'Update Profile',
              onTap: () {},
            ),
            _drawerItem(
              icon: Icons.confirmation_number_outlined,
              title: 'Organize Event',
              onTap: () {Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrganizerApplicationForm()),
                    );},
            ),
            /*      
            _drawerItem(
              icon:Icons.storefront_outlined,
              title: 'Create A business',
              onTap: () async {
                Navigator.pop(context);
                final result = await Navigator.push<Map<String, dynamic>>(
                  context,
                  MaterialPageRoute(builder: (context) => const Business()),
                );
                if (result != null) {
                  setState(() {
                    _businesses.insert(0, result);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Business added to Buyiest')));
                }
              },
            ),*/
            _drawerItem(
              icon: Icons.help_outline,
              title: 'Help',
              onTap: () {},
            ),
            const Divider(),

            _drawerItem(
              icon: Icons.logout,
              title: 'Logout',
              textColor: Colors.red,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color textColor = Colors.black,
  }) {
    return ListTile(
      leading: Icon(icon, color: textColor),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      onTap: onTap,
    );
  }

  Widget _buildBuyiestView() {
    if (_businesses.isEmpty) {
      return const Center(child: Text('No businesses yet', style: TextStyle(fontSize: 18)));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: _businesses.length,
      itemBuilder: (context, index) {
        final biz = _businesses[index];
        final String? imagePath = biz['image'] as String?;
        final String title = (biz['name'] ?? 'Unknown').toString();
        final String price = (biz['price'] ?? '').toString();

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: SizedBox(
            height: 70,
            child: ListTile(
              leading: imagePath != null
                  ? CircleAvatar(radius: 28, backgroundImage: FileImage(File(imagePath)))
                  : const CircleAvatar(radius: 28, child: Icon(Icons.storefront)),
              title: Text(title),
              subtitle: Text('R $price'),
              trailing: TextButton(
                child: const Text('View'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BusinessViewer(
                        imagePath: imagePath,
                        videoPath: biz['video'] as String?,
                        title: title,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

}

class BusinessViewer extends StatefulWidget {
  final String? imagePath;
  final String? videoPath;
  final String title;

  const BusinessViewer({Key? key, this.imagePath, this.videoPath, required this.title}) : super(key: key);

  @override
  State<BusinessViewer> createState() => _BusinessViewerState();
}

class _BusinessViewerState extends State<BusinessViewer> {
  VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();
    if (widget.videoPath != null) {
      _videoController = VideoPlayerController.file(File(widget.videoPath!))
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.imagePath != null)
              Image.file(File(widget.imagePath!), height: 250, fit: BoxFit.cover),
            const SizedBox(height: 12),
            if (_videoController != null && _videoController!.value.isInitialized)
              AspectRatio(
                aspectRatio: _videoController!.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    VideoPlayer(_videoController!),
                    VideoProgressIndicator(_videoController!, allowScrubbing: true),
                    Positioned(
                      right: 12,
                      bottom: 12,
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            _videoController!.value.isPlaying ? _videoController!.pause() : _videoController!.play();
                          });
                        },
                        child: Icon(_videoController!.value.isPlaying ? Icons.pause : Icons.play_arrow),
                      ),
                    ),
                  ],
                ),
              )
            else if (widget.videoPath != null)
              const Text('Video selected but not ready yet.'),
          ],
        ),
      ),
    );
  }
}