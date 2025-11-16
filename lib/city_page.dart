import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourguide/homeGetx.dart';



class CityData extends StatefulWidget {
  const CityData({super.key, required this.lon, required this.lat});

  final double lon, lat;

  @override
  State<CityData> createState() => _CityDataState();
}

class _CityDataState extends State<CityData> {
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    // مثال: تحميل بيانات المدينة عند البداية
    homeController.getPlaceData(
      categoryType: 'tourism',
      lon: widget.lon,
      lat: widget.lat,
      radius: 5000,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (homeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (homeController.placeData.isEmpty) {
          return const Center(child: Text('No Places Found'));
        }

        return ListView.builder(
          itemCount: homeController.placeData.length,
          itemBuilder: (context, index) {
            final place = homeController.placeData[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: place.imageUrl != null
                    ? Image.network(place.imageUrl!, width: 50, fit: BoxFit.cover)
                    : const Icon(Icons.place),
                title: Text(place.name),
                subtitle: Text(place.formattedAddress),
              ),
            );
          },
        );
      },
    );
  }
}
