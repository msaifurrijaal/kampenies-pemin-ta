import 'package:flutter/material.dart';
import 'package:kampenies/models/employee.dart';
import 'package:kampenies/theme.dart';

class CardEmployee extends StatelessWidget {
  const CardEmployee({
    Key? key,
    required this.employee,
  }) : super(key: key);
  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                    ElevatedButton.icon(
                      style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          ),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          elevation: const MaterialStatePropertyAll(0),
                          foregroundColor:
                              const MaterialStatePropertyAll(blueColor),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color(0xffEFF8FF))),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.cases_outlined,
                        size: 20,
                      ),
                      label: Text(
                        "${employee.usia} Tahun",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: blueColor),
                      ),
                    ),
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
