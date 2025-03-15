class CardRepository {
  // Instance unique du repository (singleton)
  static final CardRepository _instance = CardRepository._internal();
  factory CardRepository() => _instance;
  CardRepository._internal();

  // Liste initiale des cartes
  List<Map<String, String>> cards = [
    {
      'cardNumber': "4562 1122 4595 7852",
      'cardHolder': "AR Jonson",
      'expiry': "24/2000",
      'cvv': "6986",
      'logoAsset': "../assets/mastercard_logo.png",
      'backgroundImage': "../assets/background.png",
    },
    {
      'cardNumber': "1820 5678 9012 3456",
      'cardHolder': "Smith Jonson",
      'expiry': "24/2000",
      'cvv': "294",
      'logoAsset': "../assets/visa.png",
      'backgroundImage': "../assets/background.png",
    },
  ];

  // Carte sélectionnée (si aucune n'est sélectionnée, vous pouvez définir une valeur par défaut)
  Map<String, String>? selectedCard;
  
  // Méthode pour mettre à jour la carte sélectionnée
  void selectCard(Map<String, String> card) {
    selectedCard = card;
  }
}
