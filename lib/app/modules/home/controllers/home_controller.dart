import 'package:get/get.dart';
import 'package:get_base_code/app/data/base_url.dart';
import 'package:get_base_code/app/data/models/state_model.dart';
import 'package:get_base_code/app/data/services/custom_service.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  @override
  void onInit() {
    super.onInit();
    getState();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  RxBool isLoading = false.obs;
  List<StateModel> stateList = [];
  Future<void> getState() async {
    if (isLoading.value) return;

    try {
      isLoading(true);
      var result = await CustomService().request(
        title: 'get my state',
        url: baseUrl,
        method: Method.GET,
        withToken: false,
      );
      var dataRes = StateModelResponse.fromJson(result);
      stateList = dataRes.data!;
      isLoading(false);
    } catch (e) {
      isLoading(false);
    }
  }

  var jsonMaps = [
    {"slug": "alabama", "map": "https://www.google.com/maps/place/alabama"},
    {"slug": "alaska", "map": "https://www.google.com/maps/place/alaska"},
    {"slug": "arizona", "map": "https://www.google.com/maps/place/arizona"},
    {"slug": "arkansas", "map": "https://www.google.com/maps/place/arkansas"},
    {
      "slug": "california",
      "map": "https://www.google.com/maps/place/california"
    },
    {"slug": "colorado", "map": "https://www.google.com/maps/place/colorado"},
    {
      "slug": "connecticut",
      "map": "https://www.google.com/maps/place/connecticut"
    },
    {"slug": "delaware", "map": "https://www.google.com/maps/place/delaware"},
    {
      "slug": "district-of-columbia",
      "map": "https://www.google.com/maps/place/district-of-columbia"
    },
    {"slug": "florida", "map": "https://www.google.com/maps/place/florida"},
    {"slug": "georgia", "map": "https://www.google.com/maps/place/georgia"},
    {"slug": "hawaii", "map": "https://www.google.com/maps/place/hawaii"},
    {"slug": "idaho", "map": "https://www.google.com/maps/place/idaho"},
    {"slug": "illinois", "map": "https://www.google.com/maps/place/illinois"},
    {"slug": "indiana", "map": "https://www.google.com/maps/place/indiana"},
    {"slug": "iowa", "map": "https://www.google.com/maps/place/iowa"},
    {"slug": "kansas", "map": "https://www.google.com/maps/place/kansas"},
    {"slug": "kentucky", "map": "https://www.google.com/maps/place/kentucky"},
    {"slug": "louisiana", "map": "https://www.google.com/maps/place/louisiana"},
    {"slug": "maine", "map": "https://www.google.com/maps/place/maine"},
    {"slug": "maryland", "map": "https://www.google.com/maps/place/maryland"},
    {
      "slug": "massachusetts",
      "map": "https://www.google.com/maps/place/massachusetts"
    },
    {"slug": "michigan", "map": "https://www.google.com/maps/place/michigan"},
    {"slug": "minnesota", "map": "https://www.google.com/maps/place/minnesota"},
    {
      "slug": "mississippi",
      "map": "https://www.google.com/maps/place/mississippi"
    },
    {"slug": "missouri", "map": "https://www.google.com/maps/place/missouri"},
    {"slug": "montana", "map": "https://www.google.com/maps/place/montana"},
    {"slug": "nebraska", "map": "https://www.google.com/maps/place/nebraska"},
    {"slug": "nevada", "map": "https://www.google.com/maps/place/nevada"},
    {
      "slug": "new-hampshire",
      "map": "https://www.google.com/maps/place/new-hampshire"
    },
    {
      "slug": "new-jersey",
      "map": "https://www.google.com/maps/place/new-jersey"
    },
    {
      "slug": "new-mexico",
      "map": "https://www.google.com/maps/place/new-mexico"
    },
    {"slug": "new-york", "map": "https://www.google.com/maps/place/new-york"},
    {
      "slug": "north-carolina",
      "map": "https://www.google.com/maps/place/north-carolina"
    },
    {
      "slug": "north-dakota",
      "map": "https://www.google.com/maps/place/north-dakota"
    },
    {"slug": "ohio", "map": "https://www.google.com/maps/place/ohio"},
    {"slug": "oklahoma", "map": "https://www.google.com/maps/place/oklahoma"},
    {"slug": "oregon", "map": "https://www.google.com/maps/place/oregon"},
    {
      "slug": "pennsylvania",
      "map": "https://www.google.com/maps/place/pennsylvania"
    },
    {
      "slug": "rhode-island",
      "map": "https://www.google.com/maps/place/rhode-island"
    },
    {
      "slug": "south-carolina",
      "map": "https://www.google.com/maps/place/south-carolina"
    },
    {
      "slug": "south-dakota",
      "map": "https://www.google.com/maps/place/south-dakota"
    },
    {"slug": "tennessee", "map": "https://www.google.com/maps/place/tennessee"},
    {"slug": "texas", "map": "https://www.google.com/maps/place/texas"},
    {"slug": "utah", "map": "https://www.google.com/maps/place/utah"},
    {"slug": "vermont", "map": "https://www.google.com/maps/place/vermont"},
    {"slug": "virginia", "map": "https://www.google.com/maps/place/virginia"},
    {
      "slug": "washington",
      "map": "https://www.google.com/maps/place/washington"
    },
    {
      "slug": "west-virginia",
      "map": "https://www.google.com/maps/place/west-virginia"
    },
    {"slug": "wisconsin", "map": "https://www.google.com/maps/place/wisconsin"},
    {"slug": "wyoming", "map": "https://www.google.com/maps/place/wyoming"},
    {
      "slug": "puerto-rico",
      "map": "https://www.google.com/maps/place/puerto-rico"
    }
  ];
}
