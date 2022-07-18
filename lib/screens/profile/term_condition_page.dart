import 'package:capstone_flutter/widgets/space.dart';
import 'package:flutter/material.dart';

import '../../constants/icon.dart';
import '../../widgets/text.dart';

class TermConditionPage extends StatelessWidget {
  const TermConditionPage({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: RepoIcon().arrowCircle,
        ),
        title: UrbanistText().blackBold('Terms and Condition', 18),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UrbanistText().blackBold('General Terms', 18),
              spaceHeight(8),
              UrbanistText().blackNormal(
                  'Lörem ipsum stenojåren exons i monoform telelig. Trid lafän huruvida mijåll. Dånade. Uning sarar, nyhetsbok emedan hejaklacksjournalistik. Intragen bun anan gigade. Plalyn prende. Sudade diren. Ina prod inte plusjobb monosa trektiga. Bemävis ijöpp paravida dina.',
                  14),
              spaceHeight(16),
              UrbanistText().blackBold('License', 18),
              spaceHeight(8),
              UrbanistText().blackNormal(
                  'Lörem ipsum stenojåren exons i monoform telelig. Trid lafän huruvida mijåll. Dånade. Uning sarar, nyhetsbok emedan hejaklacksjournalistik. Intragen bun anan gigade. Plalyn prende.',
                  14),
              spaceHeight(16),
              UrbanistText().blackBold('Definition and key terms', 18),
              spaceHeight(8),
              UrbanistText().blackNormal(
                  'Lörem ipsum mirade hypor fakussa dorera språkekonomi. Fadoktig dodade telepåsm. Rengen dism adat och hönöjär i arabisk vår. Åra yrera av nerung och rögaktig. Nätbingo pus, hemikrovis och gåliga. Gigaska monogöl redur. Lateskap. Kalkstenssångare geovande. Rev bespenade. Krotona des donde, såsom äskap ade. Du kan vara drabbad. ',
                  14),
              spaceHeight(16),
              UrbanistText().blackBold('Restrictions', 18),
              spaceHeight(8),
              UrbanistText().blackNormal(
                  'Lörem ipsum mirade hypor fakussa dorera språkekonomi. Fadoktig dodade telepåsm. Rengen dism adat och hönöjär i arabisk vår. Åra yrera av nerung och rögaktig. Nätbingo pus, ',
                  14),
              spaceHeight(16),
              UrbanistText().blackBold('Disclaimer', 18),
              spaceHeight(8),
              UrbanistText().blackNormal(
                  'Lörem ipsum dekaren nysan rende håligt eller nyra. Decidiskapet bengar: den nysade ans. Dialig vitissa vikenat nyktigt och enade. Are rett spenat måt. Megar dyligt rynyde, kringtidskort om red. Tisat. Järe eurade, belävis spevis ilig. Vaviling ätt, is giganing ävis. Sefarat semilossa. Dekaskap Ikeamonarki dangar. Tregåde bevaning artad.',
                  14),
              spaceHeight(16),
              UrbanistText().blackBold('Contact Us', 18),
              spaceHeight(8),
              UrbanistText().blackNormal(
                  'Don’\t hesitate to contact us if you have any question.\nVia Email : levelup@gmail.com',
                  14),
            ],
          ),
        ),
      ),
    );
  }
}
