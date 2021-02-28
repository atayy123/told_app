import 'class.dart';

User tiffany = User(
    userPhoto: "assets/images/users/user0.png",
    username: "Tiffany",
    isFollowed: true,
    bio:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et ipsum volutpat, viverra ex id, consectetur lorem.",
    tolds: 9,
    retolds: 41,
    followers: 512,
    following: 202);

User matthew = User(
    userPhoto: "assets/images/users/user1.png",
    username: "Matthew",
    isFollowed: false,
    bio:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et ipsum volutpat, viverra ex id, consectetur lorem.",
    tolds: 4,
    retolds: 264,
    followers: 215,
    following: 438);

User currentUser = User(
    userPhoto: "assets/images/users/user1.png",
    username: "Matthew",
    bio:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et ipsum volutpat, viverra ex id, consectetur lorem.",
    tolds: 4,
    retolds: 264,
    followers: 215,
    following: 438);

User natalia = User(
    userPhoto: "assets/images/users/user2.png",
    username: "Natalia",
    isFollowed: false,
    bio:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et ipsum volutpat, viverra ex id, consectetur lorem.",
    tolds: 7,
    retolds: 35,
    followers: 1387,
    following: 403);

List<User> users = [
  matthew,
  tiffany,
  natalia,
  // matthew,
  // tiffany,
  // natalia,
  // matthew,
  // tiffany,
  // natalia,
  // matthew,
  // tiffany,
  // natalia,
  // matthew,
  // tiffany,
  // natalia,
  // matthew,
  // tiffany,
  // natalia,
];

List<Comment> comments = [
  Comment(user: natalia, comment: "Beautiful!", likes: 487),
  Comment(user: matthew, comment: "Cool bruh!", likes: 12),
  Comment(
      user: tiffany,
      comment:
          "Wow! Very cool photo, say hello to your mom for me.Wow! Very cool photo, say hello to your mom for me.Wow! Very cool photo, say hello to your mom for me.Wow! Very cool photo, say hello to your mom for me.",
      likes: 0)
];

List postsFollowing = [
  Retold(
    user: natalia,
    time: "8h",
    post: PhotoPost(
        user: matthew,
        photoUrl: "assets/images/posts/post0.jpg",
        time: "1h",
        descrip: "Maklubeli bir fasıl.",
        location: "Erzurum",
        retolds: 41,
        likes: 110,
        commentList: comments),
  ),
  Retold(
    user: matthew,
    time: "8h",
    post: VideoPost(
        user: tiffany,
        time: "10m",
        videoUrl: "assets/videos/atski.mp4",
        descrip: "Skiing with my friends!",
        location: "İzmir",
        likes: 95,
        retolds: 41,
        commentList: comments),
  ),
  Retold(
    user: tiffany,
    time: "8h",
    post: ArticlePost(
        user: natalia,
        title: "Animals are going to extinct.",
        time: "1w",
        explanation:
            "The animal that looks like a combination of a goat and a tiger is extincting. How can we stop it? What can we do?",
        article:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et ipsum volutpat, viverra ex id, consectetur lorem. Nam auctor tortor vitae viverra porta. Sed vulputate vel turpis id auctor. Donec ullamcorper laoreet tincidunt. Quisque consectetur, diam vel varius pharetra, dui sapien tincidunt quam, vitae aliquam mauris nisi vitae dui. Ut quis nisi ut metus condimentum laoreet eget id ligula. Aenean quis erat orci. Quisque vel laoreet urna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus vulputate pulvinar tortor eget rhoncus. Nulla porta, sem in molestie interdum, justo massa convallis sapien, sed tempus sapien odio a orci. Phasellus venenatis odio sed euismod consequat. Vivamus consequat consectetur augue a imperdiet. Quisque arcu justo, varius vitae finibus a, hendrerit sit amet nulla. Aenean quis commodo libero, volutpat pulvinar tortor. Quisque vitae faucibus est. Pellentesque tempus placerat porta. Quisque sollicitudin, lorem sed feugiat scelerisque, velit mauris vulputate erat, sit amet facilisis quam nulla porttitor mi. Fusce sagittis ullamcorper elit, quis vulputate ex. Etiam et augue vitae nisi interdum dignissim. Suspendisse ut tincidunt diam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla interdum ex nisl, quis volutpat nunc luctus vitae. Maecenas pharetra sit amet turpis aliquam eleifend. Fusce porttitor ligula orci, tristique auctor libero maximus interdum. Nullam ornare dui leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vitae sapien velit. In rhoncus, nibh et condimentum dignissim, nisl urna cursus dui, sed maximus lorem quam eget justo. Aliquam ultrices dictum dapibus. Ut metus justo, condimentum consequat hendrerit quis, commodo sed sem. Proin accumsan, nibh ac porttitor mattis, tortor sem varius lorem, sed pulvinar enim sapien at mauris. Vestibulum enim lectus, dictum at justo ut, varius gravida sem. Nulla in nisl quis metus ornare rhoncus ac vel felis. Proin finibus egestas neque, a fermentum risus hendrerit eget. Praesent vitae tellus a ex malesuada vulputate sed iaculis est. Integer non erat eu nibh scelerisque iaculis at ac lectus. Aliquam volutpat interdum nulla, id sagittis felis dictum id. Fusce eget semper magna. Nulla placerat cursus nibh ac ullamcorper. Vivamus sollicitudin sodales lectus quis vestibulum. Mauris accumsan turpis ut augue accumsan, eget tristique dui mattis. Morbi consectetur facilisis dui, sit amet posuere elit ultricies quis. Maecenas gravida non odio et ullamcorper. Vestibulum et dolor ornare, rhoncus erat eu, blandit metus. Fusce porta eget quam pellentesque convallis. Duis tristique ex a justo faucibus, in fringilla turpis convallis. Nulla facilisi. Mauris eros enim, tristique eget magna sed, sagittis mollis libero.",
        likes: 1031,
        retolds: 41,
        commentList: comments),
  ),
  PhotoPost(
      user: natalia,
      photoUrl: "assets/images/posts/post1.jpg",
      time: "5m",
      descrip: "OMG Ronny!",
      location: "Ankara",
      likes: 621,
      isLiked: true,
      retolds: 41,
      commentList: comments),
  ArticlePost(
      user: tiffany,
      title: "Is Covid-19 over?",
      time: "3d",
      explanation:
          "Throughout the world, case numbers are decreasing and people started to live normally. But is the pandemic over? Scientists say otherwise.",
      article:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et ipsum volutpat, viverra ex id, consectetur lorem. Nam auctor tortor vitae viverra porta. Sed vulputate vel turpis id auctor. Donec ullamcorper laoreet tincidunt. Quisque consectetur, diam vel varius pharetra, dui sapien tincidunt quam, vitae aliquam mauris nisi vitae dui. Ut quis nisi ut metus condimentum laoreet eget id ligula. Aenean quis erat orci. Quisque vel laoreet urna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus vulputate pulvinar tortor eget rhoncus. Nulla porta, sem in molestie interdum, justo massa convallis sapien, sed tempus sapien odio a orci. Phasellus venenatis odio sed euismod consequat. Vivamus consequat consectetur augue a imperdiet. Quisque arcu justo, varius vitae finibus a, hendrerit sit amet nulla. Aenean quis commodo libero, volutpat pulvinar tortor. Quisque vitae faucibus est. Pellentesque tempus placerat porta. Quisque sollicitudin, lorem sed feugiat scelerisque, velit mauris vulputate erat, sit amet facilisis quam nulla porttitor mi. Fusce sagittis ullamcorper elit, quis vulputate ex. Etiam et augue vitae nisi interdum dignissim. Suspendisse ut tincidunt diam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla interdum ex nisl, quis volutpat nunc luctus vitae. Maecenas pharetra sit amet turpis aliquam eleifend. Fusce porttitor ligula orci, tristique auctor libero maximus interdum. Nullam ornare dui leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vitae sapien velit. In rhoncus, nibh et condimentum dignissim, nisl urna cursus dui, sed maximus lorem quam eget justo. Aliquam ultrices dictum dapibus. Ut metus justo, condimentum consequat hendrerit quis, commodo sed sem. Proin accumsan, nibh ac porttitor mattis, tortor sem varius lorem, sed pulvinar enim sapien at mauris. Vestibulum enim lectus, dictum at justo ut, varius gravida sem. Nulla in nisl quis metus ornare rhoncus ac vel felis. Proin finibus egestas neque, a fermentum risus hendrerit eget. Praesent vitae tellus a ex malesuada vulputate sed iaculis est. Integer non erat eu nibh scelerisque iaculis at ac lectus. Aliquam volutpat interdum nulla, id sagittis felis dictum id. Fusce eget semper magna. Nulla placerat cursus nibh ac ullamcorper. Vivamus sollicitudin sodales lectus quis vestibulum. Mauris accumsan turpis ut augue accumsan, eget tristique dui mattis. Morbi consectetur facilisis dui, sit amet posuere elit ultricies quis. Maecenas gravida non odio et ullamcorper. Vestibulum et dolor ornare, rhoncus erat eu, blandit metus. Fusce porta eget quam pellentesque convallis. Duis tristique ex a justo faucibus, in fringilla turpis convallis. Nulla facilisi. Mauris eros enim, tristique eget magna sed, sagittis mollis libero.",
      likes: 225,
      retolds: 41,
      commentList: comments),
  PhotoPost(
      user: matthew,
      photoUrl: "assets/images/posts/post0.jpg",
      time: "1h",
      descrip: "Maklubeli bir fasıl.",
      location: "Erzurum",
      likes: 110,
      retolds: 41,
      commentList: comments),
];

List postsForYou = [
  PhotoPost(
      user: natalia,
      photoUrl: "assets/images/posts/post1.jpg",
      time: "5m",
      descrip: "OMG Ronny!",
      likes: 621,
      retolds: 41,
      commentList: comments),
  VideoPost(
      user: currentUser,
      time: "48m",
      location: "Ankara",
      videoUrl: "assets/videos/rockybeach.mp4",
      descrip: "stand by cuz im on vacay",
      likes: 95,
      retolds: 41,
      commentList: comments),
  ArticlePost(
      user: natalia,
      title: "Animals are going to extinct.",
      time: "1w",
      explanation:
          "The animal that looks like a combination of a goat and a tiger is extincting. How can we stop it? What can we do?",
      article:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et ipsum volutpat, viverra ex id, consectetur lorem. Nam auctor tortor vitae viverra porta. Sed vulputate vel turpis id auctor. Donec ullamcorper laoreet tincidunt. Quisque consectetur, diam vel varius pharetra, dui sapien tincidunt quam, vitae aliquam mauris nisi vitae dui. Ut quis nisi ut metus condimentum laoreet eget id ligula. Aenean quis erat orci. Quisque vel laoreet urna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus vulputate pulvinar tortor eget rhoncus. Nulla porta, sem in molestie interdum, justo massa convallis sapien, sed tempus sapien odio a orci. Phasellus venenatis odio sed euismod consequat. Vivamus consequat consectetur augue a imperdiet. Quisque arcu justo, varius vitae finibus a, hendrerit sit amet nulla. Aenean quis commodo libero, volutpat pulvinar tortor. Quisque vitae faucibus est. Pellentesque tempus placerat porta. Quisque sollicitudin, lorem sed feugiat scelerisque, velit mauris vulputate erat, sit amet facilisis quam nulla porttitor mi. Fusce sagittis ullamcorper elit, quis vulputate ex. Etiam et augue vitae nisi interdum dignissim. Suspendisse ut tincidunt diam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla interdum ex nisl, quis volutpat nunc luctus vitae. Maecenas pharetra sit amet turpis aliquam eleifend. Fusce porttitor ligula orci, tristique auctor libero maximus interdum. Nullam ornare dui leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vitae sapien velit. In rhoncus, nibh et condimentum dignissim, nisl urna cursus dui, sed maximus lorem quam eget justo. Aliquam ultrices dictum dapibus. Ut metus justo, condimentum consequat hendrerit quis, commodo sed sem. Proin accumsan, nibh ac porttitor mattis, tortor sem varius lorem, sed pulvinar enim sapien at mauris. Vestibulum enim lectus, dictum at justo ut, varius gravida sem. Nulla in nisl quis metus ornare rhoncus ac vel felis. Proin finibus egestas neque, a fermentum risus hendrerit eget. Praesent vitae tellus a ex malesuada vulputate sed iaculis est. Integer non erat eu nibh scelerisque iaculis at ac lectus. Aliquam volutpat interdum nulla, id sagittis felis dictum id. Fusce eget semper magna. Nulla placerat cursus nibh ac ullamcorper. Vivamus sollicitudin sodales lectus quis vestibulum. Mauris accumsan turpis ut augue accumsan, eget tristique dui mattis. Morbi consectetur facilisis dui, sit amet posuere elit ultricies quis. Maecenas gravida non odio et ullamcorper. Vestibulum et dolor ornare, rhoncus erat eu, blandit metus. Fusce porta eget quam pellentesque convallis. Duis tristique ex a justo faucibus, in fringilla turpis convallis. Nulla facilisi. Mauris eros enim, tristique eget magna sed, sagittis mollis libero.",
      likes: 1031,
      retolds: 41,
      commentList: comments),
  PhotoPost(
      user: matthew,
      photoUrl: "assets/images/posts/post3.jpg",
      time: "9h",
      descrip: "What does Malafatul Saksakiye mean?",
      location: "Ankara",
      likes: 437,
      retolds: 41,
      commentList: comments),
];

List<Trend> trendlist = [
  Trend(header: "Explosion in Beirut", postnumber: 4857, posts: trendposts),
  Trend(header: "Corona Virus", postnumber: 7423, posts: trendposts),
  Trend(header: "Technology", postnumber: 1145, posts: trendposts),
  Trend(header: "Donald Trump", postnumber: 2999, posts: trendposts)
];

List trendposts = [
  PhotoPost(
      user: matthew,
      photoUrl: "assets/images/posts/post0.jpg",
      time: "1h",
      descrip: "Maklubeli bir fasıl.",
      location: "Ankara",
      likes: 110,
      retolds: 41,
      commentList: comments),
  VideoPost(
      user: tiffany,
      time: "10m",
      videoUrl: "assets/videos/atski.mp4",
      descrip: "Skiing with my friends!",
      location: "İzmir",
      likes: 95,
      retolds: 41,
      commentList: comments),
  PhotoPost(
      user: natalia,
      photoUrl: "assets/images/posts/post1.jpg",
      time: "5m",
      descrip: "OMG Ronny!",
      location: "Ankara",
      likes: 621,
      retolds: 41,
      commentList: comments),
  ArticlePost(
      user: tiffany,
      title: "Is Covid-19 over?",
      time: "3d",
      explanation:
          "Throughout the world, case numbers are decreasing and people started to live normally. But is the pandemic over? Scientists say otherwise.",
      article:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et ipsum volutpat, viverra ex id, consectetur lorem. Nam auctor tortor vitae viverra porta. Sed vulputate vel turpis id auctor. Donec ullamcorper laoreet tincidunt. Quisque consectetur, diam vel varius pharetra, dui sapien tincidunt quam, vitae aliquam mauris nisi vitae dui. Ut quis nisi ut metus condimentum laoreet eget id ligula. Aenean quis erat orci. Quisque vel laoreet urna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus vulputate pulvinar tortor eget rhoncus. Nulla porta, sem in molestie interdum, justo massa convallis sapien, sed tempus sapien odio a orci. Phasellus venenatis odio sed euismod consequat. Vivamus consequat consectetur augue a imperdiet. Quisque arcu justo, varius vitae finibus a, hendrerit sit amet nulla. Aenean quis commodo libero, volutpat pulvinar tortor. Quisque vitae faucibus est. Pellentesque tempus placerat porta. Quisque sollicitudin, lorem sed feugiat scelerisque, velit mauris vulputate erat, sit amet facilisis quam nulla porttitor mi. Fusce sagittis ullamcorper elit, quis vulputate ex. Etiam et augue vitae nisi interdum dignissim. Suspendisse ut tincidunt diam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla interdum ex nisl, quis volutpat nunc luctus vitae. Maecenas pharetra sit amet turpis aliquam eleifend. Fusce porttitor ligula orci, tristique auctor libero maximus interdum. Nullam ornare dui leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vitae sapien velit. In rhoncus, nibh et condimentum dignissim, nisl urna cursus dui, sed maximus lorem quam eget justo. Aliquam ultrices dictum dapibus. Ut metus justo, condimentum consequat hendrerit quis, commodo sed sem. Proin accumsan, nibh ac porttitor mattis, tortor sem varius lorem, sed pulvinar enim sapien at mauris. Vestibulum enim lectus, dictum at justo ut, varius gravida sem. Nulla in nisl quis metus ornare rhoncus ac vel felis. Proin finibus egestas neque, a fermentum risus hendrerit eget. Praesent vitae tellus a ex malesuada vulputate sed iaculis est. Integer non erat eu nibh scelerisque iaculis at ac lectus. Aliquam volutpat interdum nulla, id sagittis felis dictum id. Fusce eget semper magna. Nulla placerat cursus nibh ac ullamcorper. Vivamus sollicitudin sodales lectus quis vestibulum. Mauris accumsan turpis ut augue accumsan, eget tristique dui mattis. Morbi consectetur facilisis dui, sit amet posuere elit ultricies quis. Maecenas gravida non odio et ullamcorper. Vestibulum et dolor ornare, rhoncus erat eu, blandit metus. Fusce porta eget quam pellentesque convallis. Duis tristique ex a justo faucibus, in fringilla turpis convallis. Nulla facilisi. Mauris eros enim, tristique eget magna sed, sagittis mollis libero.",
      likes: 225,
      retolds: 41,
      commentList: comments),
  PhotoPost(
      user: matthew,
      photoUrl: "assets/images/posts/post3.jpg",
      time: "9h",
      descrip: "What does Malafatul Saksakiye mean?",
      location: "Ankara",
      likes: 437,
      retolds: 41,
      commentList: comments),
];

List userPosts = [
  PhotoPost(
      user: natalia,
      photoUrl: "assets/images/posts/post1.jpg",
      time: "5m",
      descrip: "OMG Ronny!",
      likes: 621,
      retolds: 41,
      commentList: comments),
  VideoPost(
      user: matthew,
      time: "48m",
      location: "Ankara",
      videoUrl: "assets/videos/rockybeach.mp4",
      descrip: "stand by cuz im on vacay",
      likes: 95,
      retolds: 41,
      commentList: comments),
  ArticlePost(
      user: natalia,
      title: "Animals are going to extinct.",
      time: "1w",
      explanation:
          "The animal that looks like a combination of a goat and a tiger is extincting. How can we stop it? What can we do?",
      article:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et ipsum volutpat, viverra ex id, consectetur lorem. Nam auctor tortor vitae viverra porta. Sed vulputate vel turpis id auctor. Donec ullamcorper laoreet tincidunt. Quisque consectetur, diam vel varius pharetra, dui sapien tincidunt quam, vitae aliquam mauris nisi vitae dui. Ut quis nisi ut metus condimentum laoreet eget id ligula. Aenean quis erat orci. Quisque vel laoreet urna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus vulputate pulvinar tortor eget rhoncus. Nulla porta, sem in molestie interdum, justo massa convallis sapien, sed tempus sapien odio a orci. Phasellus venenatis odio sed euismod consequat. Vivamus consequat consectetur augue a imperdiet. Quisque arcu justo, varius vitae finibus a, hendrerit sit amet nulla. Aenean quis commodo libero, volutpat pulvinar tortor. Quisque vitae faucibus est. Pellentesque tempus placerat porta. Quisque sollicitudin, lorem sed feugiat scelerisque, velit mauris vulputate erat, sit amet facilisis quam nulla porttitor mi. Fusce sagittis ullamcorper elit, quis vulputate ex. Etiam et augue vitae nisi interdum dignissim. Suspendisse ut tincidunt diam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla interdum ex nisl, quis volutpat nunc luctus vitae. Maecenas pharetra sit amet turpis aliquam eleifend. Fusce porttitor ligula orci, tristique auctor libero maximus interdum. Nullam ornare dui leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vitae sapien velit. In rhoncus, nibh et condimentum dignissim, nisl urna cursus dui, sed maximus lorem quam eget justo. Aliquam ultrices dictum dapibus. Ut metus justo, condimentum consequat hendrerit quis, commodo sed sem. Proin accumsan, nibh ac porttitor mattis, tortor sem varius lorem, sed pulvinar enim sapien at mauris. Vestibulum enim lectus, dictum at justo ut, varius gravida sem. Nulla in nisl quis metus ornare rhoncus ac vel felis. Proin finibus egestas neque, a fermentum risus hendrerit eget. Praesent vitae tellus a ex malesuada vulputate sed iaculis est. Integer non erat eu nibh scelerisque iaculis at ac lectus. Aliquam volutpat interdum nulla, id sagittis felis dictum id. Fusce eget semper magna. Nulla placerat cursus nibh ac ullamcorper. Vivamus sollicitudin sodales lectus quis vestibulum. Mauris accumsan turpis ut augue accumsan, eget tristique dui mattis. Morbi consectetur facilisis dui, sit amet posuere elit ultricies quis. Maecenas gravida non odio et ullamcorper. Vestibulum et dolor ornare, rhoncus erat eu, blandit metus. Fusce porta eget quam pellentesque convallis. Duis tristique ex a justo faucibus, in fringilla turpis convallis. Nulla facilisi. Mauris eros enim, tristique eget magna sed, sagittis mollis libero.",
      likes: 1031,
      retolds: 41,
      commentList: comments),
  PhotoPost(
      user: matthew,
      photoUrl: "assets/images/posts/post3.jpg",
      time: "9h",
      descrip: "What does Malafatul Saksakiye mean?",
      location: "Ankara",
      likes: 437,
      retolds: 41,
      commentList: comments),
  VideoPost(
      user: tiffany,
      time: "10m",
      videoUrl: "assets/videos/atski.mp4",
      descrip: "Skiing with my friends!",
      location: "İzmir",
      likes: 95,
      retolds: 41,
      commentList: comments),
  PhotoPost(
      user: natalia,
      photoUrl: "assets/images/posts/post1.jpg",
      time: "5m",
      descrip: "OMG Ronny!",
      location: "Ankara",
      likes: 621,
      retolds: 41,
      commentList: comments),
  ArticlePost(
      user: tiffany,
      title: "Is Covid-19 over?",
      time: "3d",
      explanation:
          "Throughout the world, case numbers are decreasing and people started to live normally. But is the pandemic over? Scientists say otherwise.",
      article:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et ipsum volutpat, viverra ex id, consectetur lorem. Nam auctor tortor vitae viverra porta. Sed vulputate vel turpis id auctor. Donec ullamcorper laoreet tincidunt. Quisque consectetur, diam vel varius pharetra, dui sapien tincidunt quam, vitae aliquam mauris nisi vitae dui. Ut quis nisi ut metus condimentum laoreet eget id ligula. Aenean quis erat orci. Quisque vel laoreet urna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus vulputate pulvinar tortor eget rhoncus. Nulla porta, sem in molestie interdum, justo massa convallis sapien, sed tempus sapien odio a orci. Phasellus venenatis odio sed euismod consequat. Vivamus consequat consectetur augue a imperdiet. Quisque arcu justo, varius vitae finibus a, hendrerit sit amet nulla. Aenean quis commodo libero, volutpat pulvinar tortor. Quisque vitae faucibus est. Pellentesque tempus placerat porta. Quisque sollicitudin, lorem sed feugiat scelerisque, velit mauris vulputate erat, sit amet facilisis quam nulla porttitor mi. Fusce sagittis ullamcorper elit, quis vulputate ex. Etiam et augue vitae nisi interdum dignissim. Suspendisse ut tincidunt diam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla interdum ex nisl, quis volutpat nunc luctus vitae. Maecenas pharetra sit amet turpis aliquam eleifend. Fusce porttitor ligula orci, tristique auctor libero maximus interdum. Nullam ornare dui leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vitae sapien velit. In rhoncus, nibh et condimentum dignissim, nisl urna cursus dui, sed maximus lorem quam eget justo. Aliquam ultrices dictum dapibus. Ut metus justo, condimentum consequat hendrerit quis, commodo sed sem. Proin accumsan, nibh ac porttitor mattis, tortor sem varius lorem, sed pulvinar enim sapien at mauris. Vestibulum enim lectus, dictum at justo ut, varius gravida sem. Nulla in nisl quis metus ornare rhoncus ac vel felis. Proin finibus egestas neque, a fermentum risus hendrerit eget. Praesent vitae tellus a ex malesuada vulputate sed iaculis est. Integer non erat eu nibh scelerisque iaculis at ac lectus. Aliquam volutpat interdum nulla, id sagittis felis dictum id. Fusce eget semper magna. Nulla placerat cursus nibh ac ullamcorper. Vivamus sollicitudin sodales lectus quis vestibulum. Mauris accumsan turpis ut augue accumsan, eget tristique dui mattis. Morbi consectetur facilisis dui, sit amet posuere elit ultricies quis. Maecenas gravida non odio et ullamcorper. Vestibulum et dolor ornare, rhoncus erat eu, blandit metus. Fusce porta eget quam pellentesque convallis. Duis tristique ex a justo faucibus, in fringilla turpis convallis. Nulla facilisi. Mauris eros enim, tristique eget magna sed, sagittis mollis libero.",
      likes: 225,
      retolds: 41,
      commentList: comments),
  Retold(
    user: tiffany,
    time: "8h",
    post: ArticlePost(
        user: natalia,
        title: "Animals are going to extinct.",
        time: "1w",
        explanation:
            "The animal that looks like a combination of a goat and a tiger is extincting. How can we stop it? What can we do?",
        article:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et ipsum volutpat, viverra ex id, consectetur lorem. Nam auctor tortor vitae viverra porta. Sed vulputate vel turpis id auctor. Donec ullamcorper laoreet tincidunt. Quisque consectetur, diam vel varius pharetra, dui sapien tincidunt quam, vitae aliquam mauris nisi vitae dui. Ut quis nisi ut metus condimentum laoreet eget id ligula. Aenean quis erat orci. Quisque vel laoreet urna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus vulputate pulvinar tortor eget rhoncus. Nulla porta, sem in molestie interdum, justo massa convallis sapien, sed tempus sapien odio a orci. Phasellus venenatis odio sed euismod consequat. Vivamus consequat consectetur augue a imperdiet. Quisque arcu justo, varius vitae finibus a, hendrerit sit amet nulla. Aenean quis commodo libero, volutpat pulvinar tortor. Quisque vitae faucibus est. Pellentesque tempus placerat porta. Quisque sollicitudin, lorem sed feugiat scelerisque, velit mauris vulputate erat, sit amet facilisis quam nulla porttitor mi. Fusce sagittis ullamcorper elit, quis vulputate ex. Etiam et augue vitae nisi interdum dignissim. Suspendisse ut tincidunt diam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla interdum ex nisl, quis volutpat nunc luctus vitae. Maecenas pharetra sit amet turpis aliquam eleifend. Fusce porttitor ligula orci, tristique auctor libero maximus interdum. Nullam ornare dui leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vitae sapien velit. In rhoncus, nibh et condimentum dignissim, nisl urna cursus dui, sed maximus lorem quam eget justo. Aliquam ultrices dictum dapibus. Ut metus justo, condimentum consequat hendrerit quis, commodo sed sem. Proin accumsan, nibh ac porttitor mattis, tortor sem varius lorem, sed pulvinar enim sapien at mauris. Vestibulum enim lectus, dictum at justo ut, varius gravida sem. Nulla in nisl quis metus ornare rhoncus ac vel felis. Proin finibus egestas neque, a fermentum risus hendrerit eget. Praesent vitae tellus a ex malesuada vulputate sed iaculis est. Integer non erat eu nibh scelerisque iaculis at ac lectus. Aliquam volutpat interdum nulla, id sagittis felis dictum id. Fusce eget semper magna. Nulla placerat cursus nibh ac ullamcorper. Vivamus sollicitudin sodales lectus quis vestibulum. Mauris accumsan turpis ut augue accumsan, eget tristique dui mattis. Morbi consectetur facilisis dui, sit amet posuere elit ultricies quis. Maecenas gravida non odio et ullamcorper. Vestibulum et dolor ornare, rhoncus erat eu, blandit metus. Fusce porta eget quam pellentesque convallis. Duis tristique ex a justo faucibus, in fringilla turpis convallis. Nulla facilisi. Mauris eros enim, tristique eget magna sed, sagittis mollis libero.",
        likes: 1031,
        retolds: 41,
        commentList: comments),
  ),
  PhotoPost(
      user: matthew,
      photoUrl: "assets/images/posts/post3.jpg",
      time: "9h",
      descrip: "What does Malafatul Saksakiye mean?",
      location: "Ankara",
      likes: 437,
      retolds: 41,
      commentList: comments),
];

List<DM> dms = [
  DM(user: matthew, messages: messagesMatthew, unread: true),
  DM(user: natalia, messages: messagesNatalia, unread: false),
//  DM(user: natalia, messages: messagesNatalia, unread: true),
  // DM(user: tiffany, messages: messagesTiffany, unread: false),
  // DM(user: matthew, messages: messagesMatthew, unread: false),
  // DM(user: matthew, messages: messagesMatthew, unread: false),
  // DM(user: natalia, messages: messagesNatalia, unread: false),
  // DM(user: natalia, messages: messagesNatalia, unread: false),
  // DM(user: natalia, messages: messagesNatalia, unread: false),
  // DM(user: natalia, messages: messagesNatalia, unread: false),
  // DM(user: natalia, messages: messagesNatalia, unread: false),
  // DM(user: natalia, messages: messagesNatalia, unread: false),
];

List messagesMatthew = [
  Message(user: currentUser, time: "13:20", msg: "u fucking piece of shite"),
  Message(
      user: matthew,
      time: "13:14",
      msg: "doing fine bruh I was just fckin ur mom yesterday"),
  Message(user: currentUser, time: "13:12", msg: "hey bruh whatsup!"),
  Message(user: matthew, time: "13:11", msg: "hey!"),
];
List messagesNatalia = [
  PostMessage(
      post: PhotoPost(
          user: natalia,
          photoUrl: "assets/images/posts/post1.jpg",
          time: "5m",
          descrip: "OMG Ronny!",
          location: "Ankara",
          likes: 621,
          commentList: comments),
      user: currentUser,
      time: "6:50"),
  PostMessage(
      post: VideoPost(
          user: tiffany,
          time: "10m",
          videoUrl: "assets/videos/atski.mp4",
          descrip: "Skiing with my friends!",
          location: "İzmir",
          likes: 95,
          commentList: comments),
      user: natalia,
      time: "5:45"),
  Message(
    user: natalia,
    time: '5:30',
    msg: 'Hey, how\'s it going? What did you do today?',
  ),
  Message(
    user: currentUser,
    time: '4:30',
    msg: 'Just walked my doge. She was super duper cute. The best pupper!!',
  ),
  Message(
    user: natalia,
    time: '3:45',
    msg: 'How\'s the doggo?',
  ),
  Message(
    user: natalia,
    time: '2:00',
    msg: 'I ate so much food today.',
  ),
  Message(
    user: currentUser,
    time: '2:30',
    msg: 'Nice! What kind of food did you eat?',
  ),
  Message(
    user: natalia,
    time: '3:15',
    msg: 'All the food',
  )
];

List messagesTiffany = [
  ImageMessage(
      url: "assets/images/posts/post2.jpg", user: currentUser, time: "6:00"),
  Message(
    user: tiffany,
    time: '5:30',
    msg: 'Hey, how\'s it going? What did you do today?',
  ),
  Message(
    user: currentUser,
    time: '4:30',
    msg: 'Just walked my doge. She was super duper cute. The best pupper!!',
  ),
  Message(
    user: tiffany,
    time: '3:45',
    msg: 'How\'s the doggo?',
  ),
  Message(
    user: tiffany,
    time: '3:15',
    msg: 'All the food',
  ),
  Message(
    user: currentUser,
    time: '2:30',
    msg: 'Nice! What kind of food did you eat?',
  ),
  Message(
    user: tiffany,
    time: '2:00',
    msg:
        'Ananla karşılıklı oturup ay çekirdeği yerim senin. gözüne kurşunkalem soktuğumun malı seni.Ananla karşılıklı oturup ay çekirdeği yerim senin. gözüne kurşunkalem soktuğumun malı seni.Ananla karşılıklı oturup ay çekirdeği yerim senin. gözüne kurşunkalem soktuğumun malı seni.Ananla karşılıklı oturup ay çekirdeği yerim senin. gözüne kurşunkalem soktuğumun malı seni.Ananla karşılıklı oturup ay çekirdeği yerim senin. gözüne kurşunkalem soktuğumun malı seni',
  ),
];

List<LocationPost> mapPosts = [
  LocationPost(
    id: "4562",
    latitude: 38.4213524,
    longitude: 27.1306005,
    post: PhotoPost(
        user: natalia,
        photoUrl: "assets/images/posts/post1.jpg",
        time: "5m",
        descrip: "OMG Ronny!",
        location: "Ankara",
        likes: 621,
        commentList: comments),
  ),
  LocationPost(
    id: "1111",
    latitude: 38.383815,
    longitude: 27.149509,
    post: PhotoPost(
        user: matthew,
        photoUrl: "assets/images/posts/post3.jpg",
        time: "9h",
        descrip: "What does Malafatul Saksakiye mean?",
        location: "Ankara",
        likes: 437,
        retolds: 41,
        commentList: comments),
  ),
  LocationPost(
    id: "7777",
    latitude: 38.3914,
    longitude: 27.095020,
    post: VideoPost(
        user: currentUser,
        time: "48m",
        location: "Ankara",
        videoUrl: "assets/videos/rockybeach.mp4",
        descrip: "stand by cuz im on vacay",
        likes: 95,
        retolds: 41,
        commentList: comments),
  ),
  LocationPost(
    id: "5684",
    latitude: 38.427463,
    longitude: 27.144272,
    post: PhotoPost(
        user: matthew,
        photoUrl: "assets/images/posts/post0.jpg",
        time: "1h",
        descrip: "Maklubeli bir fasıl.",
        location: "Ankara",
        likes: 110,
        retolds: 41,
        commentList: comments),
  ),
  LocationPost(
    id: "2123",
    latitude: 38.477648,
    longitude: 27.075816,
    post: VideoPost(
        user: tiffany,
        time: "10m",
        videoUrl: "assets/videos/atski.mp4",
        descrip: "Skiing with my friends!",
        location: "İzmir",
        likes: 95,
        retolds: 41,
        commentList: comments),
  )
];
