class Session {
  final String id;
  final String title;
  final String description;
  final String category;
  final String duration;
  final String imageUrl;
  final String difficulty;

  const Session({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.duration,
    required this.imageUrl,
    required this.difficulty,
  });
}

// Sample data
final List<Session> sampleSessions = [
  Session(
    id: '1',
    title: 'Morning Meditation',
    description: 'Start your day with mindfulness and clarity.',
    category: 'Meditation',
    duration: '10 min',
    imageUrl:
        'https://images.unsplash.com/photo-1545389336-cf090694435e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
    difficulty: 'Beginner',
  ),
  Session(
    id: '2',
    title: 'Sun Salutation',
    description: 'Energizing yoga flow sequence.',
    category: 'Yoga',
    duration: '20 min',
    imageUrl:
        'https://images.unsplash.com/photo-1506126613408-eca07ce68773?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
    difficulty: 'Intermediate',
  ),
  Session(
    id: '3',
    title: 'Deep Breathing',
    description: 'Calming breath work for stress relief.',
    category: 'Breathing',
    duration: '15 min',
    imageUrl:
        'https://images.unsplash.com/photo-1518609878373-06d740f60d8b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
    difficulty: 'Beginner',
  ),
  // Add more sample sessions as needed
];
