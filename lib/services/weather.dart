import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/screens/loading_screen.dart';

const apiKey = '019ef4c8d1bb9322f859b3f967da5e00';
Location locationObj = Location();

class WeatherModel {
  Future<dynamic> getCityWeatherOfInputCity(String cityName) async {
    NetworkHelper networkHelperObj = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelperObj.getApiData();
    return weatherData;
  }

  Future<dynamic> getLocationWether() async {
    await locationObj.getLocation();
    // log(locationObj.latitude.toString());
    // log(locationObj.longitude.toString());

    NetworkHelper networkHelperObj = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${locationObj.latitude}&lon=${locationObj.longitude}&appid=$apiKey&units=metric'); // the lat and lon variables in the url has the scope of this func only, hence instiantiated the object in this func to access those variables in the url

    var weatherData = await networkHelperObj.getApiData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
