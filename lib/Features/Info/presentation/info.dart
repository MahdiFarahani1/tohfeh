import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';

class InfoPage extends StatelessWidget {
  InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          leading: const Padding(
            padding: EdgeInsets.only(right: 12, top: 16),
            child: Text(
              'التطبیق',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          bottom: const TabBar(labelColor: Colors.white, tabs: [
            Tab(
              text: 'مهدی',
            ),
            Tab(
              text: 'علی',
            ),
            Tab(
              text: 'رضا',
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            itemTab(context, '''بسم الله الحمن الرحيم
الحمدلله رب العالمين 
و الصلاة والسلام على رسول الله و على اله الطاهرين
وأما بعد..

مما لا يختلف عليه اثنان أن سهولة العثور على ما يحتاجه الباحثين والخطباء و أصحاب المنابر الحسينية من مادة علمية متقنة ، قد توفرها بعض التطبيقات الالكترونية  و ذلك لسهولة البحث و التوفير للوقت.

وبعد اطلاعنا على محتوى هذا التطبيق الموسوم "التفسير الموضوعي"
وجدناه نافعا مباركاً و جديداً من نوعه ويمتاز بعدة ميزات لا يُستغنى عنها :

 اولاً : حاول المؤلف أن يأتي بالروايات المتواترة و الصحيحة من حيث السند ويتجنب الضعيف منها في الكتب الغير مشهورة.

ثانياً : اختار من كل صفحة من القرآن الكريم أبرز آياتها وقام بشرحها و تفسيرها معتمدا التفاسير المعتبرة.

ثالثاً : استخدم المؤلف الأسلوب القصصي من أجل التعبير و إيصال المعلومات حيث تلي كلَّ آية مختارة ، قصةٌ ملائمة لموضوعها.

نرى أن هذا الجهد المبارك يلبي طلب ما يحتاجه كل باحث بما فيهم أصحاب الفضيلة الخطباء مع توفير الوقت وسرعة الوصول للمعلومة.

نرجو من الله العلي الأعلى تسديد خُطى الناشطين في نشر تعاليم القرآن وعلوم أهل البيت عليهم السلام ومزيد التوفيق لصاحب هذا الأثر النافع انه سميع مجيب.


مركز التبليغ القراني الدولي
في العتبة الحسينية المقدسة'''),
            itemTab(context, ''' رسالة شكر وتقدير

إلى من لولاه لساخت الأرض بأهلها، سيدي ومولاي، بقية الله في أرضه، الإمام الحجة المنتظر المهدي أرواحنا لتراب مقدمه الفداء،
لك مني أسمى آيات الشكر والتقدير، فببركتك ورعايتك، تتجلى آمالنا وتزدهر آمال الأمة في ظلالك المباركة.
جزاك الله عنا خير الجزاء، ونسأله تعالى أن يعجل بظهورك وليملأ الأرض قسطاً وعدلاً كما ملئت جوراً وظلماً.
نحن في انتظار الفرج، وكلنا أمل أن تكون خطواتنا في خدمة هذا الدين الطاهر هي من أسباب تعجيل ظهورك الشريف، وأن تقبل منا هذا الجهد المتواضع.

كما أتوجه بأسمى عبارات الشكر والثناء إلى والدي و والدتي و الثلة الطيبة من المؤمنين والمؤمنات الذين ساهموا بجدٍ واجتهاد في إكمال ونشر هذا الأثر القرآني الروائي المبارك، كما ولا شك أن دورهم الكبير في تيسير هذا المشروع المبارك له أجر عظيم عند الله تعالى.
إن ما بذلوه من خدمةٍ و دعم لنشر العلم وتعاليم أهل البيت عليهم السلام هو فخر لنا جميعاً، ونموذج يحتذى به في التضحية والإيثار. أسأل الله أن يضاعف لهم الأجر والثواب، وأن يبارك في أعمالهم، وأن يكون هذا العمل المبارك شفيعاً لهم في الدنيا والآخرة.

نسأل الله تعالى أن يوفقهم جميعاً لما يحب ويرضى، وأن يوفقنا جميعاً في السعي الحثيث نحو رضا الله، وأن يعيننا على السير في طريق الحق والهدى.
اللهم اجعل هذا العمل في ميزان حسناتنا وحسنات جميع من شارك فيه، واجعلنا من المستحقين لدعاء الإمام المهدي عليه السلام.

بارك الله فيكم جميعاً، وجعل أعمالكم في صميم خدمة دين الله، وجعلنا من أنصار الحق والعدل، وأن يُسعد قلوبنا بظهور الفرج القريب.
اللهم آمين.



السيد سليم الفاضلي 
النجف الاشرف 



رابط القناة

حوزة الامام الحجة (ع): 
Hujjahseminary.com

السيد سليم الفاضلي:
https://youtube.com/@salim_alfazeli?si=brhHVsnKnf34BARj'''),
            itemTab(context, 'مهدی'),
          ],
        ),
      ),
    );
  }

  Widget itemTab(BuildContext context, String text) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: EsaySize.width(context),
            height: 70,
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: logoImages
                  .map(
                    (image) => SizedBox(
                      width: 55,
                      height: 55,
                      child: Image.asset(
                        image,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: SelectableText(
              text,
              style: const TextStyle(fontSize: 17),
            ),
          )
        ],
      ),
    );
  }

  final List<String> logoImages = [
    Assets.images.l1.path,
    Assets.images.l2.path,
    Assets.images.l3.path,
    Assets.images.l4.path,
  ];
}
