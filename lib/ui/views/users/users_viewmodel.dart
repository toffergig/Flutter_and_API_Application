import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/models/user.dart';
import 'package:stacked_app/services/users_service.dart';
import 'package:stacked_services/stacked_services.dart';

class UsersViewModel extends BaseViewModel {
  UsersViewModel(){
     getUsersFromService();
  }

  final _navigationServce = locator<NavigationService>();
  String get userTop => 'Toffer';
  final _usersService = locator<UsersService>();

  List<User> _users = [];

  List<User> get users => _users;

 bool _showList = false; // Boolean variable to track if the list should be shown

  bool get showList => _showList;

  navigateToHomeView() {
    _navigationServce.back();
  }

void getUsersAndUpdateList() async {
    try {
      getUsersFromService();
      _showList = true; // Update the boolean variable to show the list
      notifyListeners();
    } catch (e) {
      throw Exception();
    }
  }
  
 void getUsersFromService() async {
    try {
      _users = await _usersService.getUsers();
      notifyListeners();
    } catch (e) {
      throw Exception();
    }
  }

  formatRowOne(User user){
    return '${user.id}. ${user.name}';
  }

  formatRowTwo(User user){
     return '${user.address.suite}, ${user.address.street}, ${user.address.city}, ${user.address.zipcode}';
  }

  fromatRowThree (User user){
    return user.email;
  }
  fromatRowThreeCorner (User user){
    return user.phone;
  }
}
