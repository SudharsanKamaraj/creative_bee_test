import 'package:creative_bee_task/util/image_const.dart';

List<Item> itemList = [
  Item(
    id: 1,
    name: 'Maruti Suzuki',
    img: AppImages.MARUTI_SUZUKI,
    description:
        ' Maruti Suzuki is founded on the 24 February 1981. Maruti Suzuki is formerly known as the Maruti Udyog Limited.',
  ),
  Item(
    id: 2,
    name: 'Hyundai',
    img: AppImages.HYUNDAI,
    description:
        'Chung Ju-Yung (1915–2001) founded the Hyundai Engineering and Construction Company in 1947.',
  ),
  Item(
    id: 3,
    name: 'Tata Motors',
    img: AppImages.TATA_MOTORS,
    description:
        'The company was established in 2002 as "Daewoo Commercial Vehicle Co. Ltd", after it was spun off from parent Daewoo Motors.',
  ),
  Item(
    id: 4,
    name: 'Mahindra & Mahindra',
    img: AppImages.MAHINDRA,
    description:
        'Mahindra & Mahindra was founded as a steel trading company on 2 October 1945 in Ludhiana as Mahindra & Mohammed by brothers Kailash Chandra Mahindra and Jagdish Chandra Mahindra along with Malik Ghulam Muhammad.',
  ),
  Item(
    id: 5,
    name: 'Kia',
    img: AppImages.KIA,
    description:
        'Kia was founded on June 9, 1944, as Kyungsung Precision Industry, a manufacturer of steel tubing and bicycle parts, eventually producing Korea first domestic bicycle, the Samchully, in 1951',
  ),
  Item(
    id: 6,
    name: 'Toyota',
    img: AppImages.TOYOTA,
    description:
        'In 1924, Sakichi Toyoda invented the Toyoda Model G Automatic Loom.',
  ),
];

class Item {
  final int id;
  final String name;
  final String img;
  final String description;

  Item({
    required this.id,
    required this.name,
    required this.img,
    required this.description,
  });
}
