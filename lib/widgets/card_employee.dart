import 'package:flutter/material.dart';
import 'package:kampenies/models/employee.dart';
import 'package:kampenies/pages/detail_employee_page.dart';
import 'package:kampenies/theme.dart';
import 'package:kampenies/widgets/card_age_widget.dart';

class CardEmployee extends StatelessWidget {
  const CardEmployee({
    Key? key,
    required this.employee,
  }) : super(key: key);
  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailEmployeePage.routeName,
          arguments: employee,
        );
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(color: Color(0xffEAECF0), width: 3))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Image.network(
                  employee.avatar,
                ),
              ),
              const SizedBox(width: 10),
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: blueColor,
                                ),
                          ),
                        ],
                        text: '${employee.name} - ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: blackColor, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      employee.role,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: greyColor),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      employee.deskripsi,
                      maxLines: 3, // Atur sesuai kebutuhan
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 4),
                    AgeCard(age: employee.usia),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
