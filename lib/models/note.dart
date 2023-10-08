class Note {
  int id;
  String title;
  String content;
  DateTime modifiedTime;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.modifiedTime,
  });
}

List<Note> sampleNotes = [
  Note(
    id: 0,
    title: 'Managing Anxiety📑',
    content:
        'Today, I felt anxious in the morning. Tried deep breathing exercises and it helped me calm down. Need to practice mindfulness more.',
    modifiedTime: DateTime(2024, 1, 1, 10, 15),
  ),
  Note(
    id: 1,
    title: 'Gratitude List 🙇‍♂️✨',
    content:
        '1. I am grateful for my supportive friends and family.\n2. Grateful for the beautiful sunrise this morning.\n3. Thankful for the delicious meal I had for lunch.',
    modifiedTime: DateTime(2024, 1, 2, 14, 30),
  ),
  Note(
    id: 2,
    title: 'Coping Strategies',
    content:
        "I've been learning new coping strategies:\n1. Mindful breathing\n2. Journaling my thoughts\n3. Going for walks in nature\n4. Listening to calming music",
    modifiedTime: DateTime(2024, 3, 2, 9, 45),
  ),
  Note(
    id: 3,
    title: 'Self-Care Reminder',
    content:
        'Remember to prioritize self-care:\n1. Take breaks when needed\n2. Practice self-compassion\n3. Reach out to a therapist for support.',
    modifiedTime: DateTime(2024, 1, 4, 16, 53),
  ),
  Note(
    id: 4,
    title: 'Daily Affirmations',
    content:
        'Affirmations for today:\n1. I am resilient and can face any challenges.\n2. I deserve love and happiness.\n3. My mental health matters, and I am taking steps to care for it.',
    modifiedTime: DateTime(2024, 5, 5, 18, 20),
  ),
  Note(
    id: 5,
    title: 'Cravings and Learnings🥗',
    content:
        'I tried some new recipes today:\n1. Chicken Alfredo\n2. Vegan chili\n3. Spaghetti carbonara\n4. Chocolate lava cake',
    modifiedTime: DateTime(2024, 1, 6, 13, 9),
  ),
  Note(
    id: 6,
    title: 'Workout',
    content:
        'My workout plan for the week:\nMonday:\n- Ran 5 miles\n- Attended Yoga class\nTuesday:\n- Completed HIIT circuit training\n- Swam laps\nWednesday:\n- Rest day\nThursday:\n- Weightlifting session\n- Joined a Spin class\nFriday:\n- Ran 3 miles\n- Pilates class\nSaturday:\n- Went hiking\n- Tried rock climbing',
    modifiedTime: DateTime(2024, 3, 7, 11, 12),
  ),
  Note(
    id: 7,
    title: 'Meetings',
    content:
        'Meeting Notes:\nMeeting Attendees: John, Mary, David\nAgenda:\n- Budget review\n- Project updates\n- Upcoming events',
    modifiedTime: DateTime(2024, 2, 1, 15, 14),
  ),
  Note(
    id: 8,
    title: 'Journal Entry 9',
    content:
        'Vacation Plans:\n1. Visit the Grand Canyon\n2. Go on a hot air balloon ride\n3. Try local cuisine\n4. Attend a concert',
    modifiedTime: DateTime(2022, 2, 1, 12, 34),
  ),
];
