class Store {
  String itemName;
  String itemImage;
  Store.items({
    required this.itemImage,
    required this.itemName,
  });
}

List<Store> storeItems = [
  Store.items(
    itemName: "Circulatory system",
    itemImage: 'images/Picture4.png',
  ),
  Store.items(
    itemName: "Respiratory system",
    itemImage: 'images/Picture1.png',
  ),
  Store.items(
    itemName: "Digestive system",
    itemImage: 'images/Picture2.png',
  ),
  Store.items(
    itemName: "Urinary system",
    itemImage: 'images/Picture5.png',
  ),
  Store.items(
    itemName: "Muscular system",
    itemImage: 'images/Picture3.png',
  ),
];

List<Store> chapItems = [
  Store.items(
    itemName: "Lessons",
    itemImage: 'images/icons8-storytelling-100.png',
  ),
  Store.items(
    itemName: "AR",
    itemImage: 'images/icons8-ar-100.png',
  ),
];
