import 'package:flutter/material.dart';
import 'package:kampenies/models/employee.dart';

class ItemMentorr extends StatelessWidget {
  const ItemMentorr({
    Key? key,
    required this.employee,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);
  final Employee employee;

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(color: Color(0xffEAECF0), width: 3))),
        // elevation: 2,
        // shadowColor: const Color(0xFF1570EF),
        // color: Colors.white,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(12),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Image.network(
                employee.avatar,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.05,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                    children: [
                      TextSpan(
                          text: employee.divisi,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: screenWidth * 0.035,
                              color: const Color(0xFF1570EF)))
                    ],
                    text: '${employee.name} - ',
                    style: TextStyle(
                        color: const Color(0xff101828),
                        fontSize: screenWidth * 0.037,
                        fontWeight: FontWeight.w700),
                  )),
                  Text(
                    employee.role,
                    style: TextStyle(
                      color: const Color(0xFF98A2B3),
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    employee.deskripsi,
                    maxLines: 3, // Atur sesuai kebutuhan
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style:
                        TextStyle(fontSize: screenWidth * 0.03, wordSpacing: 2),
                    textAlign: TextAlign.justify,
                  ),
                  ElevatedButton.icon(
                      style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.fromLTRB(20, 8, 20, 8)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          elevation: const MaterialStatePropertyAll(0),
                          foregroundColor:
                              const MaterialStatePropertyAll(Color(0xFF1570EF)),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color(0xffEFF8FF))),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.cases_outlined,
                        size: 20,
                      ),
                      label: Text(
                        "${employee.usia} Tahun",
                        style: TextStyle(fontSize: screenHeight * 0.015),
                      ))
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
