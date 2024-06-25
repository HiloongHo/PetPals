import 'package:flutter/material.dart';
import 'package:pet_pals/screens/home/video_page.dart';
import '../profile/profile_page.dart';

// 主页面
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 1 || _currentIndex == 4
          ? null
          : AppBar(
        title: Text(
          'Recommend',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add_box_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return PostFeed();
      case 1:
        return VideoPage();
      case 2:
        return ProfilePage();
      case 3:
        return Container(); // Placeholder for LikesPage
      case 4:
        return ProfilePage(); // Placeholder for ProfilePage
      default:
        return Container();
    }
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: const Color(0xFF5641EF),
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_call),
          label: 'Video',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_a_photo),
          label: 'Post',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Likes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      type: BottomNavigationBarType.fixed,
    );
  }
}

class PostItem extends StatelessWidget {
  final String username;
  final String location;
  final String avatarPath;
  final List<String> imagePaths;

  const PostItem({
    Key? key,
    required this.username,
    required this.location,
    required this.avatarPath,
    required this.imagePaths,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(avatarPath), // 用户头像
          ),
          title: Text(username), // 用户名
          subtitle: Text(location), // 位置
          trailing: const Icon(Icons.more_vert), // 更多选项图标
        ),
        SizedBox(
          height: 400, // 图片容器的高度
          width: double.infinity, // 图片容器占满整个宽度
          child: PageView.builder(
            itemCount: imagePaths.length, // 每个帖子包含的图片数量
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300], // 临时背景颜色
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AspectRatio(
                    aspectRatio: 2 / 3, // 2:3 的长宽比
                    child: Image.asset(
                      imagePaths[index], // 使用资源路径加载图片
                      fit: BoxFit.cover, // 使图片覆盖容器
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.comment),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.bookmark_border),
              onPressed: () {},
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Liked by user1 and others',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('View all comments'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('1 hour ago', style: TextStyle(color: Colors.grey)),
        ),
      ],
    );
  }
}




class PostFeed extends StatelessWidget {
  const PostFeed({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> posts = [
      {
        'username': 'Nathan',
        'location': 'Sichuan',
        'avatar': 'assets/images/avatars/avatar1.png',
        'images': [
          'assets/images/pets/photo1.jpg',
          'assets/images/pets/photo2.jpg',
          'assets/images/pets/photo3.jpg',
          'assets/images/pets/photo4.jpg',
          'assets/images/pets/photo5.jpg',
          'assets/images/pets/photo6.jpg',
          'assets/images/pets/photo7.jpg',
          'assets/images/pets/photo8.jpg',
          'assets/images/pets/photo9.jpg',
        ]
      },
      {
        'username': 'Xiaoming',
        'location': 'Hunan',
        'avatar': 'assets/images/avatars/avatar2.png',
        'images': [
          'assets/images/pets/photo1.jpg',
          'assets/images/pets/photo2.jpg',
          'assets/images/pets/photo3.jpg',
          'assets/images/pets/photo4.jpg',
          'assets/images/pets/photo5.jpg',
          'assets/images/pets/photo6.jpg',
          'assets/images/pets/photo7.jpg',
          'assets/images/pets/photo8.jpg',
          'assets/images/pets/photo9.jpg',
        ]
      },
      // 添加更多帖子
      {
        'username': 'Tom',
        'location': 'Beijing',
        'avatar': 'assets/images/avatars/avatar3.png',
        'images': [
          'assets/images/pets/photo1.jpg',
          'assets/images/pets/photo2.jpg',
          'assets/images/pets/photo3.jpg',
          'assets/images/pets/photo4.jpg',
          'assets/images/pets/photo5.jpg',
          'assets/images/pets/photo6.jpg',
          'assets/images/pets/photo7.jpg',
          'assets/images/pets/photo8.jpg',
          'assets/images/pets/photo9.jpg',
        ]
      },
      {
        'username': '张伟',
        'location': 'Location4',
        'avatar': 'assets/images/avatars/avatar4.png',
        'images': [
          'assets/images/pets/photo1.jpg',
          'assets/images/pets/photo2.jpg',
          'assets/images/pets/photo3.jpg',
          'assets/images/pets/photo4.jpg',
          'assets/images/pets/photo5.jpg',
          'assets/images/pets/photo6.jpg',
          'assets/images/pets/photo7.jpg',
          'assets/images/pets/photo8.jpg',
          'assets/images/pets/photo9.jpg',
        ]
      },
      {
        'username': 'User5',
        'location': 'Location5',
        'avatar': 'assets/images/avatars/avatar5.png',
        'images': [
          'assets/images/pets/photo1.jpg',
          'assets/images/pets/photo2.jpg',
          'assets/images/pets/photo3.jpg',
          'assets/images/pets/photo4.jpg',
          'assets/images/pets/photo5.jpg',
          'assets/images/pets/photo6.jpg',
          'assets/images/pets/photo7.jpg',
          'assets/images/pets/photo8.jpg',
          'assets/images/pets/photo9.jpg',
        ]
      },
      {
        'username': 'User6',
        'location': 'Location6',
        'avatar': 'assets/images/avatars/avatar6.png',
        'images': [
          'assets/images/photo46.jpg',
          'assets/images/photo47.jpg',
          'assets/images/photo48.jpg',
          'assets/images/photo49.jpg',
          'assets/images/photo50.jpg',
          'assets/images/photo51.jpg',
          'assets/images/photo52.jpg',
          'assets/images/photo53.jpg',
          'assets/images/photo54.jpg',
        ]
      },
      {
        'username': 'User7',
        'location': 'Location7',
        'avatar': 'assets/images/avatars/avatar7.png',
        'images': [
          'assets/images/photo55.jpg',
          'assets/images/photo56.jpg',
          'assets/images/photo57.jpg',
          'assets/images/photo58.jpg',
          'assets/images/photo59.jpg',
          'assets/images/photo60.jpg',
          'assets/images/photo61.jpg',
          'assets/images/photo62.jpg',
          'assets/images/photo63.jpg',
        ]
      },
      {
        'username': 'User8',
        'location': 'Location8',
        'avatar': 'assets/images/avatars/avatar8.png',
        'images': [
          'assets/images/photo64.jpg',
          'assets/images/photo65.jpg',
          'assets/images/photo66.jpg',
          'assets/images/photo67.jpg',
          'assets/images/photo68.jpg',
          'assets/images/photo69.jpg',
          'assets/images/photo70.jpg',
          'assets/images/photo71.jpg',
          'assets/images/photo72.jpg',
        ]
      },
      {
        'username': 'User9',
        'location': 'Location9',
        'avatar': 'assets/images/avatars/avatar9.png',
        'images': [
          'assets/images/photo73.jpg',
          'assets/images/photo74.jpg',
          'assets/images/photo75.jpg',
          'assets/images/photo76.jpg',
          'assets/images/photo77.jpg',
          'assets/images/photo78.jpg',
          'assets/images/photo79.jpg',
          'assets/images/photo80.jpg',
          'assets/images/photo81.jpg',
        ]
      },
      {
        'username': 'User10',
        'location': 'Location10',
        'avatar': 'assets/images/avatars/avatar10.png',
        'images': [
          'assets/images/photo82.jpg',
          'assets/images/photo83.jpg',
          'assets/images/photo84.jpg',
          'assets/images/photo85.jpg',
          'assets/images/photo86.jpg',
          'assets/images/photo87.jpg',
          'assets/images/photo88.jpg',
          'assets/images/photo89.jpg',
          'assets/images/photo90.jpg',
        ]
      },
    ];

    return ListView.builder(
      itemCount: posts.length, // 帖子的数量
      itemBuilder: (context, index) {
        final post = posts[index];
        return PostItem(
          username: post['username'],
          location: post['location'],
          avatarPath: post['avatar'],
          imagePaths: List<String>.from(post['images']),
        );
      },
    );
  }
}

