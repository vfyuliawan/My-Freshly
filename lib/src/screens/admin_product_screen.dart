part of 'screens.dart';

class AdminProductScreen extends StatelessWidget {
  const AdminProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Your Product".text.bold.color(kPrimaryColor).make(),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, color: kPrimaryColor).onTap(() {
          context.go(routeName.home);
        }),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 3),
            child: Container(
              // margin: EdgeInsets.only(bottom: 8),
              width: 200,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_box_outlined,
                      color: Colors.white,
                    ),
                  ),
                  "Add Product".text.bold.color(Colors.white).make(),
                ],
              ),
            ).centered().onTap(() {
              context.go(routeName.adminPath);
            }),
            height: 40,
            decoration: BoxDecoration(
              color: colorName.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      body: Container(
        child: BlocBuilder<ListProductBloc, ListProductState>(
          builder: (context, listProductState) {
            if (listProductState is ListProductIsLoading) {
              return CircularProgressIndicator().centered();
            }
            if (listProductState is ListProductIsSuccess) {
              final data = listProductState.products;
              return ListView.separated(
                separatorBuilder: (context, index) => 16.heightBox,
                itemCount: data.length,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                itemBuilder: (context, index) {
                  return ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: EdgeInsets.all(14),
                    minLeadingWidth: 20,
                    trailing: Column(
                      children: [
                        Icon(
                          Icons.edit_outlined,
                          color: kPrimaryColor,
                        ),
                        4.heightBox,
                        Icon(
                          Icons.delete_outline_rounded,
                          color: kPrimaryColor,
                        ),
                      ],
                    ),
                    // style: ListTileTheme(),
                    tileColor: Colors.white,
                    focusColor: Colors.blue,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        "${data[index].name}".text.bold.size(22).make(),
                        "IDR ${data[index].price}"
                            .text
                            .color(kPrimaryColor.withOpacity(0.9))
                            .bold
                            .size(18)
                            .make(),
                      ],
                    ),
                    subtitle: "${data[index].variant}".text.make(),
                    leading: Container(
                      width: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image(
                          image: NetworkImage('${data[index].pictures![0]}'),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Container(
              child: "Tidak Ada Product".text.make(),
            );
          },
        ),
      ).centered(),
    );
  }
}
