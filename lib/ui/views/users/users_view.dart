import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/models/user.dart';
import 'users_viewmodel.dart';

class UsersView extends StackedView<UsersViewModel> {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UsersViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 70),
            MaterialButton(
              onPressed: () => viewModel.navigateToHomeView(),
              color: Colors.black,
              textColor: Colors.white,
              child: const Text('Back to Home'),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () => viewModel.getUsersAndUpdateList(),
              color: Colors.black,
              textColor: Colors.white,
              child: const Text('Get Users'),
            ),
            if (viewModel.showList)
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.users.length,
                  itemBuilder: (context, index) {
                    User user = viewModel.users[index];

                    return ListTile(
                      title: Text(viewModel.formatRowOne(user)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(viewModel.formatRowTwo(user)),
                          Row(
                            children: [
                              Expanded(
                                child: Text(viewModel.fromatRowThree(user)),
                              ),
                              Text(viewModel.fromatRowThreeCorner(user)),
                            ],
                          ),
                          const Divider(
                            thickness: 1.5,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  UsersViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UsersViewModel();
}
