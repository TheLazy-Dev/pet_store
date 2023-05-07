import 'package:pet_store/data/models/pet.dart';
import 'dart:convert';

class APIServices {
  final String _jsonAdoptedString = '''
   {
    "pets":[
  {
    "id": 1,
    "name": "Luna",
    "age": 2,
    "details": "Loves to cuddle and play with balls, enjoys going for walks",
    "breed": "Corgi",
    "adoptedDate": "2022-02-20",
    "gender": "Female",
    "price": 400,
    "imageUrl": "https://images.dog.ceo/breeds/terrier-silky/n02097658_349.jpg"
  }

    ]
}
  ''';

  final String _jsonAvailablePets = '''
{"pets":[
  {
    "id": 10,
    "name": "Milo",
    "age": 3,
    "details": "Loves to play and cuddle, great with kids",
    "breed": "French Bulldog",
    "gender": "Male",
    "price": 650,
    "imageUrl": "https://images.dog.ceo/breeds/hound-plott/hhh_plott002.jpg"
  },
  {
    "id": 11,
    "name": "Sadie",
    "age": 2,
    "details": "Affectionate and loyal, loves to be around people",
    "breed": "Golden Retriever",
    "gender": "Female",
    "price": 550,
    "imageUrl": "https://images.dog.ceo/breeds/springer-english/n02102040_7484.jpg"
  },
  {
    "id": 12,
    "name": "Bentley",
    "age": 4,
    "details": "Friendly and playful, loves to go for walks",
    "breed": "Siberian Husky",
    "gender": "Male",
    "price": 700,
    "imageUrl": "https://images.dog.ceo/breeds/terrier-westhighland/n02098286_1639.jpg"
  },
  {
    "id": 13,
    "name": "Chloe",
    "age": 2,
    "details": "Sweet and gentle, loves to be petted and cuddled",
    "breed": "Yorkshire Terrier",
    "gender": "Female",
    "price": 450,
    "imageUrl": "https://images.dog.ceo/breeds/appenzeller/n02107908_2534.jpg"
  },
  {
    "id": 14,
    "name": "Zeus",
    "age": 5,
    "details": "Strong and athletic, loves to run and play outdoors",
    "breed": "Great Dane",
    "gender": "Male",
    "price": 800,
    "imageUrl": "https://images.dog.ceo/breeds/terrier-sealyham/n02095889_1886.jpg"
  },
  {
    "id": 15,
    "name": "Mia",
    "age": 1,
    "details": "Adorable and playful, loves to be around people",
    "breed": "Shih Tzu",
    "gender": "Female",
    "price": 400,
    "imageUrl": "https://images.dog.ceo/breeds/germanshepherd/n02106662_21094.jpg"
  },
  {
    "id": 16,
    "name": "Rocko",
    "age": 3,
    "details": "Energetic and playful, loves to chase and fetch balls",
    "breed": "Boston Terrier",
    "gender": "Male",
    "price": 500,
    "imageUrl": "https://images.dog.ceo/breeds/groenendael/n02105056_4601.jpg"
  },
  {
    "id": 17,
    "name": "Buffy",
    "age": 2,
    "details": "Sweet and affectionate, loves to be cuddled and pampered",
    "breed": "Pomeranian",
    "gender": "Female",
    "price": 350,
    "imageUrl": "https://images.dog.ceo/breeds/retriever-flatcoated/n02099267_1095.jpg"
  },
  {
    "id": 18,
    "name": "Cooper",
    "age": 4,
    "details": "Friendly and obedient, loves to go for long walks",
    "breed": "Labradoodle",
    "gender": "Male",
    "price": 600,
    "imageUrl":"https://images.dog.ceo/breeds/affenpinscher/n02110627_12676.jpg"
}
]}
''';
  List<Pet> getAdoptedPets() {
    final jsonData = jsonDecode(_jsonAdoptedString);
    final pets = jsonData['pets'] as List;
    return pets.map((pet) => Pet.fromJson(pet)).toList();
  }

  List<Pet> getAvailablePets() {
    final jsonData = jsonDecode(_jsonAvailablePets);
    final pets = jsonData['pets'] as List;
    return pets.map((pet) => Pet.fromJson(pet)).toList();
  }
}
