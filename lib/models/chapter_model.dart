class Store {
  String itemName;
  String itemImage, photo;
  Store.items({
    required this.itemImage,
    required this.itemName,
    required this.photo,
  });
}

List<Store> storeItems = [
  Store.items(
    itemName: "Circulatory system",
    itemImage: 'images/heart.png',
    photo: 'images/Picture4.png',
  ),
  Store.items(
    itemName: "Respiratory system",
    itemImage: 'images/lung.png',
    photo: 'images/Picture1.png',
  ),
  Store.items(
    itemName: "Digestive system",
    itemImage: 'images/digestive-system(1).png',
    photo: 'images/Picture2.png',
  ),
  Store.items(
    itemName: "Urinary system",
    itemImage: 'images/urinary.png',
    photo: 'images/Picture5.png',
  ),
  Store.items(
    itemName: "Muscular system",
    itemImage: 'images/muscular.png',
    photo: 'images/Picture3.png',
  ),
];

// List<Store> chapItems = [
//   Store.items(
//     itemName: "Lessons",
//     itemImage: 'images/icons8-storytelling-100.png',
//   ),
//   Store.items(
//     itemName: "AR",
//     itemImage: 'images/icons8-ar-100.png',
//   ),
// ];
