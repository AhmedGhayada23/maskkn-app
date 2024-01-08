import 'package:flutter/material.dart';
import '../../appConfig.dart';

class AppTerms extends StatelessWidget {
  const AppTerms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final Locale appLocale = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar( backgroundColor: Res.kPrimaryColor,),
      body:  Padding(
          padding:  const EdgeInsets.fromLTRB(15, 25, 15, 10),
          child: appLocale.toString() == 'ar'? const ArabicTerms(): const EnglishTerms(),),);
  }
}

class EnglishTerms extends StatelessWidget {
  const EnglishTerms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle TitleStyle = TextStyle(color: Res.sPrimaryColor,fontSize: Res.TitleFontSize, fontWeight: FontWeight.bold);
    TextStyle SubTitleStyle = TextStyle(color: Res.kPrimaryColor, fontSize: Res.SubTitleFontSize);
    TextStyle textStyle = TextStyle(color: Res.dGrayColor, fontSize: Res.TextFontSize);
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: [
            Text("Terms and coditions",style: TitleStyle,),
            const SizedBox(height: 10,),
            Text("Advertisement publishing policy                                 ",style: SubTitleStyle ,),
            Text("All ads you post must adhere to the policies and statistics here:", style: textStyle ,),
            Text("1. Free posting of licensed advertisements under the pag number in your account in the laws and conditions of use.", style: textStyle ,),
            Text("2. If we decide that we wish to appoint public representatives, overseers, at a later time. In particular, we may remove, suspend, or restore your ad and make it compatible.", style: textStyle ),
            Text("3. Do not advertise duplicate ads. Only one (1) advertisement is allowed for the same service. It allows you to post an ad to post a good ad, unless it has already been deleted or has expired.", style: textStyle ),
            Text("4. It is permissible to activate the activation of all ads that are valid (such as sold).", style: textStyle ),
            Text("5. Infringement of intellectual property rights. You may not advertise the service or violate the intellectual property rights of third parties. Includes The portfolio of counterfeit products, including counterfeit or unauthorized copies.", style: textStyle ),
            Text("6. Misleading / false information. It is strictly forbidden to provide incorrect information in ads, such as incorrect prices, terms and conditions", style: textStyle ),
            const SizedBox(height: 10,),
            Text("Reporting ads with violations                                    ",style: SubTitleStyle),
            Text("If you want to report any violating advertisement on the site, you can use the e-mail (Report abuse) on the advertisement page, and this facilitates the concerned section to adjust the violating ads faster, and you can contact us and provide us with ads that violate the terms of use of the site or the member’s personal page Let's take action.", style: textStyle ),
            const SizedBox(height: 10,),
            Text("payment                                                                         ",style: SubTitleStyle),
            Text("1. Payments using the Service may be made only using only Visa or MasterCard credit cards.", style: textStyle ),
            Text("2. Upon completing a transaction using the Service, you will be presented with a confirmation screen verifying the transaction details you wish to process. It is your responsibility to verify that all transaction information and other details are correct.", style: textStyle ),
            Text("3. You will receive a confirmation email and SMS  once the payment has been received by Our third party service provider", style: textStyle ),
            Text("4. We have no liability for transactions which are incorrect as a result of inaccurate data entry in the course of the use of the Service or for loss of data or information caused by factors beyond Our control.", style: textStyle ),
            const SizedBox(height: 10,),
            Text("Torment                                                                         ",style: SubTitleStyle),
            Text("7.1 You agree to indemnify us for any loss, cost or expense we incur or incur as a result of the following:", style: textStyle ),
            Text("1.1. Your breach of your obligations under the Terms:                     ", style: textStyle ),
            Text("1.2. Intentional misuse of the service:                                               ", style: textStyle ),
            Text("3. Acts of negligence or negligence in using the service;                    ", style: textStyle ),
            Text("7.1.4. Any claim brought against us by a third party in connection with your use of the service.", style: textStyle ),

          ],
        ),
      ),
    );
  }
}

class ArabicTerms extends StatelessWidget {
  const ArabicTerms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle TitleStyle = TextStyle(color: Res.sPrimaryColor,fontSize: Res.TitleFontSize, fontWeight: FontWeight.bold);
    TextStyle SubTitleStyle = TextStyle(color: Res.kPrimaryColor, fontSize: Res.SubTitleFontSize);
    TextStyle textStyle = TextStyle(color: Res.dGrayColor, fontSize: Res.TextFontSize);
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Text("الشروط والأحكام",style: TitleStyle,),
            const SizedBox(height: 10,),
            Text("سياسة نشر الإعلانات                                                     ",style: SubTitleStyle ,),
            Text("يجب أن تلتزم جميع الإعلانات التي تنشرها بالسياسات والإحصائيات هنا:", style: textStyle ,),
            Text("1. النشر المجاني للاعلانات المرخصة تحت رقم الصفحة في حسابك في قوانين وشروط الاستخدام", style: textStyle ,),
            Text("2. إذا قررنا أننا نرغب في تعيين ممثلين أو مشرفين عموميين في وقت لاحق. على وجه الخصوص ، يجوز لنا إزالة إعلانك أو تعليقه أو استعادته وجعله متوافقًا.", style: textStyle ),
            Text("3. لا يسمح بنشر إعلانات مكررة. يُسمح بإعلان واحد (1) فقط لنفس الخدمة. يسمح لك بنشر إعلان لنشر إعلان جيد ، ما لم يكن قد تم حذفه بالفعل أو انتهت صلاحيته.", style: textStyle ),
            Text("4. يجوز لنا  إلغاء تفعيل جميع الإعلانات  الغير صالحة (مثل المباعة).", style: textStyle ),
            Text("5. التعدي على حقوق الملكية الفكرية. لا يجوز لك الإعلان عن الخدمة أو انتهاك حقوق الملكية الفكرية لأطراف ثالثة. يشمل مجموعة المنتجات المقلدة ، بما في ذلك النسخ المزيفة أو غير المصرح بها.", style: textStyle ),
            Text("6. معلومات مضللة / وكاذبة. يمنع منعا باتا تقديم معلومات غير صحيحة في الإعلانات ، مثل الأسعار والبنود والشروط غير الصحيحة", style: textStyle ),
            const SizedBox(height: 10,),
            Text("الإبلاغ عن الإعلانات المخالفة                                            ",style: SubTitleStyle),
            Text("إذا كنت ترغب في الإبلاغ عن أي إعلان مخالف على الموقع ، يمكنك استخدام البريد الإلكتروني (الإبلاغ عن إساءة) الموجود في صفحة الإعلان ، وهذا يسهل على القسم المعني ضبط الإعلانات المخالفة بشكل أسرع ، ويمكنك الاتصال بنا وتزويدنا بها. الإعلانات التي تنتهك شروط استخدام الموقع أو الصفحة الشخصية للعضو فنتخذ إجراءً.", style: textStyle ),
            const SizedBox(height: 10,),
            Text("دفع                                                                                    ",style: SubTitleStyle),
            Text("1-لا يجوز إجراء المدفوعات باستخدام الخدمة إلا باستخدام بطاقات ائتمان Visa أو MasterCard فقط.", style: textStyle ),
            Text("2- عند إتمام معاملة باستخدام الخدمة ، ستظهر لك شاشة تأكيد للتحقق من تفاصيل المعاملة التي ترغب في معالجتها. تقع على عاتقك مسؤولية التحقق من صحة جميع معلومات المعاملة والتفاصيل الأخرى.", style: textStyle ),
            Text("3-ستتلقى رسالة تأكيد عبر البريد الإلكتروني ورسالة نصية قصيرة بمجرد استلام الدفع من قبل مزود خدمة الطرف الثالث لدينا", style: textStyle ),
            Text("4-لا نتحمل أي مسؤولية عن المعاملات غير الصحيحة نتيجة إدخال بيانات غير دقيق في سياق استخدام الخدمة أو فقدان البيانات أو المعلومات بسبب عوامل خارجة عن سيطرتنا.", style: textStyle ),
            const SizedBox(height: 10,),
            Text("إخلاء المسؤولية                                                                         ",style: SubTitleStyle),
            Text("7.1 أنت توافق على تعويضنا عن أي خسارة أو تكلفة أو مصاريف تكبدها أو تتكبدها نتيجة لما يلي:", style: textStyle ),
            Text("7.1.1. خرقك التزاماتك بموجب الشروط:                                               ", style: textStyle ),
            Text("7.1.2. سوء الاستخدام المتعمد للخدمة.                                                 ", style: textStyle ),
            Text("7.1.3. أفعال الإهمال أو التقصير في استخدام الخدمة.                          ", style: textStyle ),
            Text("7.1.4. أي دعوى مرفوعة ضدنا من قبل طرف ثالث فيما يتعلق باستخدام للخدمة.", style: textStyle ),

          ],
        ),
      ),
    );
  }
}