import 'package:flutter/material.dart';

// The Main Screen Widget
class ComsScreen extends StatefulWidget {
  const ComsScreen({super.key});

  @override
  State<ComsScreen> createState() => _ComsScreenState();
}

class _ComsScreenState extends State<ComsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize the TabController with 3 tabs
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 2,
    ); // Start on الحي tab
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCustomAppBar(),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Content for each tab
          _buildPrivateChatList(), // الخاص
          _buildNeighborsChatList(), // الجيران
          _buildNeighborhoodFeed(), // الحي
        ],
      ),
    );
  }

  // --- Custom AppBar Builder (Unchanged) ---
  PreferredSizeWidget _buildCustomAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(180.0),
      child: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'مجتمع سدرة',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Icons.notifications_none,
                  size: 30,
                  color: Colors.white,
                ),
                Positioned(
                  top: 12,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '4',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: 'البحث',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.greenAccent,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white.withOpacity(0.7),

          tabs: const [
            Tab(text: 'الخاص'),
            Tab(text: 'الجيران'),
            Tab(text: 'الحي'),
          ],
        ),
      ),
    );
  }

  // --- List Builders for Each Tab ---

  /// Builds the list for the "الخاص" (Private) tab.
  Widget _buildPrivateChatList() {
    final List<Map<String, dynamic>> privateChatData = [
      {
        'name': 'ابو محمد',
        'message': 'بتحضر اجتماع فيصل الأسبوع الجاي؟',
        'time': '9:00 م',
        'unread': 1,
      },
      {
        'name': 'فيصل التميمي',
        'message': 'بالله بلغ العامل اذا حصلته',
        'time': '8:32 م',
        'unread': 5,
      },
      {
        'name': 'خالد الحربي',
        'message': 'كلمت الادراة بخصوص تهريب الموية...',
        'time': '6:24 م',
        'unread': 3,
      },
    ];
    return ListView.builder(
      itemCount: privateChatData.length,
      itemBuilder: (context, index) {
        final chat = privateChatData[index];
        return ChatMessageTile(
          name: chat['name'],
          message: chat['message'],
          time: chat['time'],
          unreadCount: chat['unread'],
        );
      },
    );
  }

  /// Builds the list for the "الجيران" (Neighbors) tab.
  Widget _buildNeighborsChatList() {
    final List<Map<String, dynamic>> groupChatData = [
      {
        'groupName': 'المسجد',
        'online': 8,
        'sender': 'ابو محمد',
        'message': 'فيه فرصة في إحسان للتبر...',
        'time': '9:00 م',
        'unread': 10,
      },
      {
        'groupName': 'العمارة',
        'online': 1,
        'sender': 'فيصل التميمي',
        'message': 'بالله احد يبلغ العامل...',
        'time': '8:32 م',
        'unread': 5,
      },
      {
        'groupName': 'الحديقة',
        'online': 5,
        'sender': 'خالد الحربي',
        'message': 'لازم نكلم الادراة بخصو...',
        'time': '6:24 م',
        'unread': 10,
      },
    ];
    return ListView.builder(
      itemCount: groupChatData.length,
      itemBuilder: (context, index) {
        final chat = groupChatData[index];
        return GroupChatTile(
          groupName: chat['groupName'],
          onlineCount: chat['online'],
          lastSender: chat['sender'],
          lastMessage: chat['message'],
          time: chat['time'],
          unreadCount: chat['unread'],
        );
      },
    );
  }

  /// Builds the list for the "الحي" (Neighborhood) tab.
  Widget _buildNeighborhoodFeed() {
    final List<Map<String, dynamic>> feedData = [
      {
        'name': 'محمد التميمي',
        'time': 'قبل 5 دقايق',
        'avatar': null,
        'postText':
            'فيه سيارة واقفة قدام البوابة وتسد الطريق، لو صاحبها يشيلها.',
        'postImage': 'assets/img/Frame 2147238305.png',
        'likes': 0,
        'comments': 4,
      },
      {
        'name': 'طلال الثبيتي',
        'time': 'قبل 10 دقايق',
        'avatar': 'assets/img/Frame 2147238288(2).png',
        'postText': 'فتح مطعم جديد عند مدخل المجمع 👌 جربوه ترا أكله لذيذ',
        'postImage': null,
        'likes': 10,
        'comments': 6,
        'isActive': true,
      },
      {
        'name': 'نورة الشهري',
        'time': 'قبل ساعة',
        'avatar': null,
        'postText': 'وصلت حاويات جديدة لإعادة التدوير عند المواقف الخلفية 🌿',
        'postImage': null,
        'likes': 0,
        'comments': 4,
      },
    ];
    return ListView.builder(
      itemCount: feedData.length,
      itemBuilder: (context, index) {
        final post = feedData[index];
        return NeighborhoodPostCard(
          name: post['name'],
          time: post['time'],
          avatarPath: post['avatar'],
          postText: post['postText'],
          postImagePath: post['postImage'],
          likes: post['likes'],
          comments: post['comments'],
          isActive: post['isActive'] ?? false,
        );
      },
    );
  }
}

// --- Reusable Custom Widgets for Each Tab ---

/// A tile for a private 1-on-1 chat message.
class ChatMessageTile extends StatelessWidget {
  final String name, message, time;
  final int unreadCount;
  const ChatMessageTile({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
  });
  @override
  Widget build(BuildContext context) {
    /* ... Same as previous code ... */
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green, width: 2),
                  ),
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person_outline,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Text(
                      unreadCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// A tile for a group chat in the "Neighbors" tab.
class GroupChatTile extends StatelessWidget {
  final String groupName, lastSender, lastMessage, time;
  final int onlineCount, unreadCount;
  const GroupChatTile({
    super.key,
    required this.groupName,
    required this.onlineCount,
    required this.lastSender,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      lastSender,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  lastMessage,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                groupName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '$onlineCount متصلين',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 60,
            height: 60,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green, width: 2),
                  ),
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.group_outlined,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Text(
                      unreadCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// A card for a post in the "Neighborhood" feed.
class NeighborhoodPostCard extends StatelessWidget {
  final String name, time, postText;
  final String? avatarPath, postImagePath;
  final int likes, comments;
  final bool isActive;
  const NeighborhoodPostCard({
    super.key,
    required this.name,
    required this.time,
    required this.postText,
    this.avatarPath,
    this.postImagePath,
    required this.likes,
    required this.comments,
    this.isActive = false,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz, color: Colors.grey),
                ),
                const Spacer(),
                if (isActive)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'متفاعل',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                CircleAvatar(
                  radius: 24,
                  backgroundImage: avatarPath != null
                      ? AssetImage(avatarPath!)
                      : null,
                  child: avatarPath == null
                      ? const Icon(Icons.person, color: Colors.grey)
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              postText,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 14),
            ),
            if (postImagePath != null)
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(postImagePath!),
                ),
              ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildAction(Icons.send_outlined, ''),
                _buildAction(Icons.chat_bubble_outline, comments.toString()),
                _buildAction(Icons.favorite_outline, likes.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAction(IconData icon, String text) {
    return Row(
      children: [
        Text(text, style: TextStyle(color: Colors.grey.shade700)),
        const SizedBox(width: 4),
        Icon(icon, color: Colors.grey.shade700, size: 20),
      ],
    );
  }
}
