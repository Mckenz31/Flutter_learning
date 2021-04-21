import 'location.dart';
import 'networking.dart';

class WeatherModel {

  double latitude;
  double longitude;
  String apiKey = '49fa3fb3d11904993d329d3a94bda813';

  Future<dynamic> getCityLocation(cityName) async {
    Networking networkApi = Networking(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric'
    );
    var data = await networkApi.getWeatherData();
    return data;
  }

  Future<dynamic> getGeoLocation() async{
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitiude;
    longitude = location.longitude;

    Networking networkApi = Networking(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric'
    );
    var data = await networkApi.getWeatherData();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
