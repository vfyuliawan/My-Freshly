part of '../../screens.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: colorName.juneBud,
          ),
          onPressed: () {
            context.go(routeName.home);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: colorName.juneBud),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserIsSuccess) {
              return VStack(
                [
                  ZStack(
                    [
                      VxCircle(
                        radius: 85,
                        backgroundImage: (state.data.photoProfile!.isNotEmpty)
                            ? DecorationImage(
                                image: NetworkImage(state.data.photoProfile!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      IconButton(
                        onPressed: () {},
                        color: colorName.white,
                        icon: const Icon(
                          Icons.edit,
                          color: colorName.juneBud,
                        ).onTap(
                          () {
                            BlocProvider.of<UserBloc>(context)
                                .add(ChangePhoto());
                          },
                        ),
                      )
                    ],
                    alignment: Alignment.bottomRight,
                  ),
                  5.heightBox,
                  VStack(
                    [
                      state.data.username!.text.size(16).bold.make(),
                    ],
                    crossAlignment: CrossAxisAlignment.center,
                  ),
                  50.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        icon: Icon(Icons.book),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.email),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        icon: Icon(Icons.lock),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Phone',
                        hintText: '',
                        hintStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: colorName.juneBud),
                        icon: Icon(Icons.phone),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Addres',
                        hintText: '',
                        hintStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: colorName.juneBud),
                        icon: Icon(Icons.location_city),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  ),
                  20.heightBox,
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<UserBloc>(context).add(LogOutUser());
                      context.go(routeName.login);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: colorName.juneBud),
                    child: const Text('LOG OUT'),
                  ),
                  ButtonWidget(
                    onPressed: () {
                      context.go(routeName.adminPath);
                    },
                    text: 'Add Product',
                    color: colorName.accentBlue,
                  )
                ],
                crossAlignment: CrossAxisAlignment.center,
              ).wFull(context);
            }
            return 0.heightBox;
          },
        ),
      ),
    );
  }
}
