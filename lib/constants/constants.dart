//Images Path
import 'package:dropdown_model_list/drop_down/model.dart';

const String backgroundImagePath = "assets/images/background.jpg";
const String tobetoLogoPath = "assets/images/tobeto-logo.png";
const String iKLogoPath = "assets/images/istkodluyor.png";
const String iKDarkLogoPath = "assets/images/istkodluyor_dark.png";
const String doneLogoPath = "assets/images/done.png";
const String countDownLogoPath = "assets/images/countdown.png";
const String ecmelPath = "assets/images/ecmel.jpg";
const String ikImagePath = "assets/images/ik.jpg";
const String anketImagePath = "assets/images/anket.png";
const String timeStartImagePath = "assets/images/timeStart.png";
const String timeEndImagePath = "assets/images/timeEnd.png";
const String googleIconImagePath = "assets/images/google_icon.png";
const String githubIconImagePath = "assets/images/github_icon.png";
const String forgotPassImagePath = "assets/images/forgot-password.png";

//Profile Screen
const String cvGithubImagePath = "assets/images/profile_screen/cv-github.png";
const String cvInstagramImagePath =
    "assets/images/profile_screen/cv-instagram.png";
const String cvLinkedinImagePath =
    "assets/images/profile_screen/cv-linkedn.png";
const String cvDateImagePath = "assets/images/profile_screen/cv-date.png";
const String cvMailImagePath = "assets/images/profile_screen/cv-mail.png";
const String cvNameImagePath = "assets/images/profile_screen/cv-name.png";
const String cvPhoneImagePath = "assets/images/profile_screen/cv-phone.png";
const String edit2ImagePath = "assets/images/profile_screen/edit2.png";
const String editImagePath = "assets/images/profile_screen/edit.png";
const String eyeImagePath = "assets/images/profile_screen/eye.png";
const String globeImagePath = "assets/images/profile_screen/globe.png";
const String hikRozetImagePath = "assets/images/profile_screen/hik_rozet.jpg";
const String homeImagePath = "assets/images/profile_screen/home.png";
const String pdfImagePath = "assets/images/profile_screen/pdf.png";
const String shareImagePath = "assets/images/profile_screen/share.png";
const String chartImagePath = "assets/images/profile_screen/chart.png";
const String awardImagePath = "assets/images/profile_screen/award.png";
const String bookImagePath = "assets/images/profile_screen/book.png";
const String businessImagePath = "assets/images/profile_screen/business.png";
const String translateImagePath = "assets/images/profile_screen/translate.png";
const String settingsImagePath = "assets/images/profile_screen/settings.png";
const String trashImagePath = "assets/images/profile_screen/trash.png";
const String userImagePath = "assets/images/profile_screen/user.png";
const String uploadImagePath = "assets/images/profile_screen/upload.png";
const String certificateImagePath =
    "assets/images/profile_screen/certificates.png";

//Home Screen
const String anouncementImagePath = "assets/images/home_screen/anouncement.png";
const String applicationImagePath = "assets/images/home_screen/application.png";
const String educationImagePath = "assets/images/home_screen/education.png";
const String surveyImagePath = "assets/images/home_screen/survey.png";

const List<Map<String, dynamic>> pageList = [
  {'Başvurularım': applicationImagePath},
  {'Eğitimlerim': educationImagePath},
  {'Duyuru ve Haberlerim': anouncementImagePath},
  {'Anketlerim': surveyImagePath},
];

DropListModel gradeList = DropListModel([
  OptionItem(id: "1", title: "Ön Lisans"),
  OptionItem(id: "2", title: "Lisans"),
  OptionItem(id: "3", title: "Yüksek Lisans"),
  OptionItem(id: "4", title: "Doktora"),
]);

DropListModel sMediaList = DropListModel([
  OptionItem(id: "1", title: "Instagram"),
  OptionItem(id: "2", title: "Twitter"),
  OptionItem(id: "3", title: "Linkedin"),
  OptionItem(id: "4", title: "Behance"),
  OptionItem(id: "5", title: "Dribble"),
  OptionItem(id: "6", title: "Github"),
]);

DropListModel levels = DropListModel([
  OptionItem(id: "1", title: "Seviye Seçiniz*"),
  OptionItem(id: "2", title: "Temel Seviye(A1,A2)"),
  OptionItem(id: "3", title: "Orta Seviye(B1,B2)"),
  OptionItem(id: "4", title: "İleri Seviye(C1,C2)"),
  OptionItem(id: "5", title: "Anadil"),
]);

DropListModel teachers = DropListModel([
  OptionItem(id: "1", title: "Eğitmen Dojo"),
  OptionItem(id: "2", title: "Gürkan İlişen"),
  OptionItem(id: "3", title: "Roiva Eğitmen"),
  OptionItem(id: "4", title: "Veli Bahçeci"),
  OptionItem(id: "5", title: "İrem Balcı"),
  OptionItem(id: "6", title: "Cem Bayraktaroğlu"),
  OptionItem(id: "7", title: "Ahmet Çetinkaya"),
  OptionItem(id: "8", title: "Denizhan Dursun"),
  OptionItem(id: "9", title: "Halit Enes Kalaycı"),
  OptionItem(id: "10", title: "Kadir Murat Başaren"),
  OptionItem(id: "11", title: "Serkan Tekin"),
  OptionItem(id: "12", title: "Aykut Baştuğ"),
  OptionItem(id: "13", title: "Semih Karduz"),
  OptionItem(id: "14", title: "Barbaros Ciga"),
  OptionItem(id: "15", title: "Mehmet Emin Kortak"),
  OptionItem(id: "16", title: "Engin Demiroğ"),
  OptionItem(id: "17", title: "Ali Seyhan"),
  OptionItem(id: "18", title: "Kader Yavuz"),
]);

DropListModel languages = DropListModel([
  OptionItem(id: "1", title: "Dil Seçiniz*"),
  OptionItem(id: "2", title: "Almanca"),
  OptionItem(id: "3", title: "Arapça"),
  OptionItem(id: "4", title: "Çekçe"),
  OptionItem(id: "5", title: "Çince (Mandarin)"),
  OptionItem(id: "6", title: "Danca"),
  OptionItem(id: "7", title: "Fince"),
  OptionItem(id: "8", title: "Fransızca"),
  OptionItem(id: "9", title: "Hindi"),
  OptionItem(id: "10", title: "Hollandaca"),
  OptionItem(id: "11", title: "İbranice"),
  OptionItem(id: "12", title: "İngilizce"),
  OptionItem(id: "13", title: "İspanyolca"),
  OptionItem(id: "14", title: "İsveççe"),
  OptionItem(id: "15", title: "İtalyanca"),
  OptionItem(id: "16", title: "Japonca"),
  OptionItem(id: "17", title: "Korece"),
  OptionItem(id: "18", title: "Lehçe"),
  OptionItem(id: "19", title: "Macarca"),
  OptionItem(id: "20", title: "Norveççe"),
  OptionItem(id: "21", title: "Portekizce"),
  OptionItem(id: "22", title: "Romence"),
  OptionItem(id: "23", title: "Rusça"),
  OptionItem(id: "24", title: "Türkçe"),
  OptionItem(id: "25", title: "Vietnamca"),
  OptionItem(id: "26", title: "Yunanca"),
]);

DropListModel provinceList = DropListModel([
  OptionItem(id: "1", title: "Adana"),
  OptionItem(id: "2", title: "Adıyaman"),
  OptionItem(id: "3", title: "Afyon"),
  OptionItem(id: "4", title: "Ağrı"),
  OptionItem(id: "5", title: "Amasya"),
  OptionItem(id: "6", title: "Antalya"),
  OptionItem(id: "7", title: "Artvin"),
  OptionItem(id: "8", title: "Aydın"),
  OptionItem(id: "9", title: "Balıkesir"),
  OptionItem(id: "10", title: "Bilecik"),
  OptionItem(id: "11", title: "Bingöl"),
  OptionItem(id: "12", title: "Bitlis"),
  OptionItem(id: "13", title: "Bolu"),
  OptionItem(id: "14", title: "Burdur"),
  OptionItem(id: "15", title: "Bursa"),
  OptionItem(id: "16", title: "Çanakkale"),
  OptionItem(id: "17", title: "Çankırı"),
  OptionItem(id: "18", title: "Çorum"),
  OptionItem(id: "19", title: "Denizli"),
  OptionItem(id: "20", title: "Diyarbakır"),
  OptionItem(id: "21", title: "Edirne"),
  OptionItem(id: "22", title: "Elazığ"),
  OptionItem(id: "23", title: "Erzincan"),
  OptionItem(id: "24", title: "Erzurum"),
  OptionItem(id: "25", title: "Eskişehir"),
  OptionItem(id: "26", title: "Gaziantep"),
  OptionItem(id: "27", title: "Giresun"),
  OptionItem(id: "28", title: "Gümüşhane"),
  OptionItem(id: "29", title: "Hakkari"),
  OptionItem(id: "30", title: "Hatay"),
  OptionItem(id: "31", title: "Isparta"),
  OptionItem(id: "32", title: "Mersin"),
  OptionItem(id: "33", title: "İstanbul"),
  OptionItem(id: "34", title: "İzmir"),
  OptionItem(id: "35", title: "Kars"),
  OptionItem(id: "36", title: "Kastamonu"),
  OptionItem(id: "37", title: "Kayseri"),
  OptionItem(id: "38", title: "Kırklareli"),
  OptionItem(id: "39", title: "Kırşehir"),
  OptionItem(id: "40", title: "Kocaeli"),
  OptionItem(id: "41", title: "Konya"),
  OptionItem(id: "42", title: "Kütahya"),
  OptionItem(id: "43", title: "Malatya"),
  OptionItem(id: "44", title: "Manisa"),
  OptionItem(id: "45", title: "Kahramanmaraş"),
  OptionItem(id: "46", title: "Mardin"),
  OptionItem(id: "47", title: "Muğla"),
  OptionItem(id: "48", title: "Muş"),
  OptionItem(id: "49", title: "Nevşehir"),
  OptionItem(id: "50", title: "Niğde"),
  OptionItem(id: "51", title: "Ordu"),
  OptionItem(id: "52", title: "Rize"),
  OptionItem(id: "53", title: "Sakarya"),
  OptionItem(id: "54", title: "Samsun"),
  OptionItem(id: "55", title: "Siirt"),
  OptionItem(id: "56", title: "Sinop"),
  OptionItem(id: "57", title: "Sivas"),
  OptionItem(id: "58", title: "Tekirdağ"),
  OptionItem(id: "59", title: "Tokat"),
  OptionItem(id: "60", title: "Trabzon"),
  OptionItem(id: "61", title: "Tunceli"),
  OptionItem(id: "62", title: "Şanlıurfa"),
  OptionItem(id: "63", title: "Uşak"),
  OptionItem(id: "64", title: "Van"),
  OptionItem(id: "65", title: "Yozgat"),
  OptionItem(id: "66", title: "Zonguldak"),
  OptionItem(id: "67", title: "Aksaray"),
  OptionItem(id: "68", title: "Bayburt"),
  OptionItem(id: "69", title: "Karaman"),
  OptionItem(id: "70", title: "Kırıkkale"),
  OptionItem(id: "71", title: "Batman"),
  OptionItem(id: "72", title: "Şırnak"),
  OptionItem(id: "73", title: "Bartın"),
  OptionItem(id: "74", title: "Ardahan"),
  OptionItem(id: "75", title: "Iğdır"),
  OptionItem(id: "76", title: "Yalova"),
  OptionItem(id: "77", title: "Karabük"),
  OptionItem(id: "78", title: "Kilis"),
  OptionItem(id: "79", title: "Osmaniye"),
  OptionItem(id: "80", title: "Düzce"),
]);

DropListModel dropListModel = DropListModel([
  OptionItem(id: "1", title: "Muhasebe"),
  OptionItem(id: "2", title: "JavaScript"),
  OptionItem(id: "3", title: "Aktif Öğrenme"),
  OptionItem(id: "4", title: "Aktif Dinlenme"),
  OptionItem(id: "5", title: "Uyum Sağlama"),
  OptionItem(id: "6", title: "Yönetim ve İdare"),
  OptionItem(id: "7", title: "Reklam"),
  OptionItem(id: "8", title: "Algoritmalar"),
  OptionItem(id: "9", title: "Android (İşletim Sistemi)"),
  OptionItem(id: "10", title: "Apachi Ambari"),
  OptionItem(id: "11", title: "Uygulama Mağazası (IOS)"),
  OptionItem(id: "12", title: "Apple Sağlık Kiti"),
  OptionItem(id: "13", title: "Apple IOS"),
  OptionItem(id: "14", title: "Apple XCode"),
  OptionItem(id: "15", title: "Uygulamalı Makine Öğrenimi"),
  OptionItem(id: "16", title: "Backend (Yazılım Mühendisliği)"),
  OptionItem(id: "17", title: "Büyük Veri"),
  OptionItem(id: "18", title: "Blok Zinciri"),
  OptionItem(id: "19", title: "Bootstrap (Front-End-Framework)"),
  OptionItem(id: "20", title: "Marka Yönetimi"),
  OptionItem(id: "21", title: "İletişim"),
  OptionItem(id: "22", title: "Pazarlama"),
  OptionItem(id: "23", title: "Building and Contruction"),
]);
