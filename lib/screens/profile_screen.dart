import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/providers/state_provider.dart';
import 'package:tobeto_app/widgets/index.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedOption = "Option 1";
  GlobalKey iconKey = GlobalKey();
  bool isShared = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Consumer(
                builder: (context, ref, child) {
                  return InkWell(
                    onTap: () {
                      ref.read(pageIndexProvider.notifier).state = 5;
                    },
                    child: Image.asset(
                      edit2ImagePath,
                      height: 50,
                      width: 50,
                    ),
                  );
                },
              ),
              InkWell(
                key: iconKey,
                onTap: () {
                  final RenderBox buttonBox =
                      iconKey.currentContext!.findRenderObject() as RenderBox;
                  final buttonPosition = buttonBox.localToGlobal(Offset.zero);
                  showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(
                      buttonPosition.dx, // x pozisyonu
                      buttonPosition.dy, // y pozisyonu
                      MediaQuery.of(context).size.width -
                          buttonPosition.dx, // genişlik
                      MediaQuery.of(context).size.height -
                          buttonPosition.dy, // yükseklik
                    ),
                    items: [
                      PopupMenuItem<String>(
                        value: 'Option 1',
                        child: ListTile(
                          title: Text(
                            "Profilimi paylaş",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 16),
                          ),
                          trailing: Switch(
                            value: isShared,
                            onChanged: (value) {
                              setState(() {
                                isShared = value;
                              });
                            },
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                          value: 'Option 2',
                          child: ListTile(
                            title: Text(
                              "Profil Linki Kopyala",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 16),
                            ),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.copy_rounded,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 35,
                                )),
                          )),
                    ],
                  ).then((value) {
                    setState(() {
                      if (value != null) {
                        selectedOption = value; // Seçilen seçeneği güncelle
                      }
                    });
                  });
                },
                child: Image.asset(
                  shareImagePath,
                  height: 50,
                  width: 50,
                ),
              )
            ],
          ),
          //******************************INFORMATION CARD***************************** */
          Card(
            shadowColor: Theme.of(context).colorScheme.background,
            elevation: 5,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6A70DE),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(),
                  ),
                ),
                const InformationCard(
                    title: "Ad Soyad",
                    subTitle: "Name Surname",
                    imgPath: cvNameImagePath),
                const InformationCard(
                    title: "Doğum Tarihi",
                    subTitle: "01.01.2000",
                    imgPath: cvDateImagePath),
                const InformationCard(
                    title: "E-Posta Adresi",
                    subTitle: "username@gmail.com",
                    imgPath: cvMailImagePath),
                const InformationCard(
                    title: "Telefon Numarası",
                    subTitle: "+905055555555",
                    imgPath: cvPhoneImagePath),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          //**************************ABOUT ME******************************* */
          Card(
            shadowColor: Theme.of(context).colorScheme.background,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hakkımda",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 2),
                  //Buraya Hakkımdaki bilgiler gelecek
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          //**************************SKILLS************************** */
          Card(
            shadowColor: Theme.of(context).colorScheme.background,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Yetkinliklerim",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 2),
                  const Skills(
                    title: "SQL",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  const Skills(
                    title: "c#",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  const Skills(
                    title: "Dart",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  const Skills(
                    title: "Flutter",
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          //***************************** LANGUAGES *************************** */
          Card(
            shadowColor: Theme.of(context).colorScheme.background,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Yabancı Dillerim",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 2),
                  const LanguagesWidget(
                    title: "İngilizce",
                    subtitle: "Orta Seviye (B1, B2)",
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          //******************************* CERTİFİCATES ************************ */
          Card(
            shadowColor: Theme.of(context).colorScheme.background,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sertifikalarım",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 2),
                  const CertificateWidget(
                    title: "Flutter_Certificate",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  const CertificateWidget(
                    title: "Flutter_Certificate",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  const CertificateWidget(
                    title: "Flutter_Certificate",
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          //******************************** SOCIAL MEDYA ************************* */
          Card(
            shadowColor: Theme.of(context).colorScheme.background,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Medya Hesaplarım",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 2),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {},
                          child: Image.asset(
                            cvGithubImagePath,
                            height: 60,
                            width: 60,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height / 40,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {},
                          child: Image.asset(
                            cvLinkedinImagePath,
                            height: 60,
                            width: 60,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          //******************************** ACHIVEMENT MODEL *********************** */
          Card(
            shadowColor: Theme.of(context).colorScheme.background,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tobeto İşte Başarım Modelim",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      InkWell(onTap: () {}, child: Image.asset(eyeImagePath))
                    ],
                  ),
                  const Divider(thickness: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Image.asset(
                      chartImagePath,
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Colors.grey
                          : null,
                    ),
                  ),
                  const RatingContainerWidget(
                      text: "Yeni dünyaya hazırlanıyorum",
                      rating: "3.6",
                      color: Color(0xFF85A0A9)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 70,
                  ),
                  const RatingContainerWidget(
                      text: "Profesyonel duruşumu geliştiriyorum",
                      rating: "4.7",
                      color: Color(0xFF217925)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 70,
                  ),
                  const RatingContainerWidget(
                      text: "Kendimi tanıyor ve yönetiyorum",
                      rating: "4.5",
                      color: Color(0xFFEEC272)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 70,
                  ),
                  const RatingContainerWidget(
                      text: "Yaratıcı ve doğru çözümler geliştiriyorum",
                      rating: "4.3",
                      color: Color(0xFF6667AB)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 70,
                  ),
                  const RatingContainerWidget(
                      text: "Kendimi sürekli geliştiriyorum",
                      rating: "4.9",
                      color: Color(0xFFE288B6)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 70,
                  ),
                  const RatingContainerWidget(
                      text: "Başkaları ile birlikte çalışıyorum",
                      rating: "4.6",
                      color: Color(0xFFB38F6A)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 70,
                  ),
                  const RatingContainerWidget(
                      text: "Sonuç ve başarı odaklıyım",
                      rating: "4.5",
                      color: Color(0xFFD75078)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 70,
                  ),
                  const RatingContainerWidget(
                      text: "Anlıyorum ve anlaşılıyorum",
                      rating: "4.4",
                      color: Color(0xFFD77E6F)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 60,
          ),
          //************************* TOBETO EXAMS *************************** */
          Card(
            shadowColor: Theme.of(context).colorScheme.background,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tobeto Seviye Testlerim",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 2),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    //width: MediaQuery.of(context).size.width,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        ExamsWidget(
                          title: "Microsoft SQL Server",
                          date: "06-09-2023",
                          score: "76.00",
                        ),
                        ExamsWidget(
                          title: "Herkes İçin Kodlama 1B Değerlendirme Sınavı",
                          date: "11-11-2023",
                          score: "76.00",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 60,
          ),
          //***************************  MY BADGES **************************/
          Card(
            shadowColor: Theme.of(context).colorScheme.background,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Yetkinlik Rozetlerim",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 2),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const BadgeWidget(imgPath: hikRozetImagePath),
                        SizedBox(
                          width: MediaQuery.of(context).size.height / 60,
                        ),
                        const BadgeWidget(imgPath: hikRozetImagePath),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 60,
          ),
          //*************************** ACTIVITIES MAP *************************** */
          Card(
            shadowColor: Theme.of(context).colorScheme.background,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Aktivite Haritam",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 2),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                    child: const ActivityMapWidget(),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ActivityMapContainerWidget(
                          color: Colors.grey,
                        ),
                        ActivityMapContainerWidget(
                          color: Color(0xFFBB66FF),
                        ),
                        ActivityMapContainerWidget(
                          color: Color(0xFF9933FF),
                        ),
                        ActivityMapContainerWidget(
                          color: Color(0xFF5C1F99),
                        ),
                        ActivityMapContainerWidget(
                          color: Color(0xFF361259),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 60,
          ),
          //*************************** MY EDUCATİON AND EXPERİENCES ************************* */
          Card(
            shadowColor: Theme.of(context).colorScheme.background,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Eğitim Hayatım ve Deneyimlerim",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 2),
                  Wrap(
                    children: [
                      Text("Henüz bir eğitim ve deneyim bilgisi eklemedin.",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 18))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
