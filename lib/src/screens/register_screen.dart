part of 'screens.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterIsFailed) {
              Commons().showSnackBar(context, state.message);
            } else if (state is RegisterIsSuccess) {
              context.go(routeName.home);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/register_image.png',
                  height: 200,
                  width: 200,
                ).pOnly(top: 20),
                const Text(
                  'Create your profile to start your Journey with us...!',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                20.heightBox,
                Container(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          label: Text(
                            'User Name',
                            style: TextStyle(fontSize: 13),
                          ),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person_outline_rounded,
                              color: kPrimaryColor),
                        ),
                      ),
                      10.heightBox,
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          label: Text(
                            'Email',
                            style: TextStyle(fontSize: 13),
                          ),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.email_rounded,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      10.heightBox,
                      TextFormField(
                        obscureText: true,
                        controller: passController,
                        decoration: const InputDecoration(
                          label: Text(
                            'Password',
                            style: TextStyle(fontSize: 13),
                          ),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock_clock_rounded,
                              color: kPrimaryColor),
                        ),
                      ),
                      16.heightBox,
                      BlocBuilder<RegisterBloc, RegisterState>(
                        builder: (context, state) {
                          return ButtonWidget(
                            color: kPrimaryColor,
                            onPressed: () {
                              BlocProvider.of<RegisterBloc>(context).add(
                                RegisterUser(
                                    username: usernameController.text,
                                    email: emailController.text,
                                    password: passController.text),
                              );
                            },
                            isLoading:
                                (state is RegisterIsLoading) ? true : false,
                            text: 'Register',
                          ).wFull(context);
                        },
                      ),
                      16.heightBox,
                      Column(
                        children: [
                          const Text('OR'),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Image(
                                image: NetworkImage(
                                    'https://e7.pngegg.com/pngimages/337/722/png-clipart-google-search-google-account-google-s-google-play-google-company-text.png'),
                                width: 25,
                              ),
                              label: const Text('Login With Google'),
                            ),
                          )
                        ],
                      ),
                      16.heightBox,
                      "Already Have Account"
                          .richText
                          .size(12)
                          .withTextSpanChildren(
                            [
                              " Login Here"
                                  .textSpan
                                  .size(14)
                                  .bold
                                  .green500
                                  .make()
                            ],
                          )
                          .makeCentered()
                          .onTap(
                            () {
                              context.go(routeName.login);
                            },
                          )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
