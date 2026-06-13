class Reward {
  final String image;
  final String title;
  final int requiredStars;

  Reward({
    required this.image,
    required this.title,
    required this.requiredStars,
  });
}

final rewards = [
  Reward(
    image: 'assets/stickers/lion.png',
    title: 'Lion',
    requiredStars: 5,
  ),
  Reward(
    image: 'assets/stickers/rocket.png',
    title: 'Rocket',
    requiredStars: 10,
  ),
  Reward(
    image: 'assets/stickers/rainbow.png',
    title: 'Rainbow',
    requiredStars: 15,
  ),
  Reward(
    image: 'assets/stickers/unicorn.png',
    title: 'Unicorn',
    requiredStars: 20,
  ),
];