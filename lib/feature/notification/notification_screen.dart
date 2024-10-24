import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:urban_stay/feature/notification/widgets/container_maintenance.dart';
import 'package:urban_stay/feature/notification/widgets/container_voucher.dart';
import 'package:urban_stay/ui/extension.dart';
import '../../ui/color.dart';
import '../../ui/typography.dart';
import 'notification_filter_cubit.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationFilterCubit(),
      child: Scaffold(
        backgroundColor: black00,
        appBar: AppBar(
          backgroundColor: forest600,
          title: Text(
            "Pemberitahuan",
            style: mLBold.copyWith(
              color: black00,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<NotificationFilterCubit, NotificationFilterState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildFilterButton(
                              context,
                              NotificationFilter.all,
                              "Semua",
                              15,
                              state.selectedFilter == NotificationFilter.all),
                          _buildFilterButton(
                              context,
                              NotificationFilter.unread,
                              "Belum dibaca",
                              6,
                              state.selectedFilter ==
                                  NotificationFilter.unread),
                          _buildFilterButton(
                              context,
                              NotificationFilter.transaction,
                              "Transaksi",
                              2,
                              state.selectedFilter ==
                                  NotificationFilter.transaction),
                          _buildFilterButton(
                              context,
                              NotificationFilter.report,
                              "Laporan",
                              3,
                              state.selectedFilter ==
                                  NotificationFilter.report),
                        ].withSpaceBetween(width: 5),
                      ),
                    ),
                  );
                },
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('dd MMMM yyyy').format(DateTime.now()),
                      style: SSemiBold.copyWith(color: Colors.black),
                    ),
                    Text(
                      'Baca Semua',
                      style: SSemiBold.copyWith(color: blue600),
                    ),
                  ],
                ),
              ),

              BlocBuilder<NotificationFilterCubit, NotificationFilterState>(
                builder: (context, state) {
                  return _buildNotificationList(state.selectedFilter);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButton(BuildContext context, NotificationFilter filter,
      String label, int count, bool isSelected) {
    return GestureDetector(
      onTap: () => context.read<NotificationFilterCubit>().changeFilter(filter),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
          border: Border(
            bottom: BorderSide(
              color: isSelected ? forest600 : black00,
              width: 3.0,
            ),
          ),
          // color: isSelected ? forest600 : green50,
          // borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: SSemiBold.copyWith(
                  color:Colors.black),
            ),
            const SizedBox(width: 5),
            CircleAvatar(
              radius: 12,
              backgroundColor: isSelected ? forest600 : green50,
              child: Text(
                '$count',
                style: SSemiBold.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationList(NotificationFilter filter) {
    if (filter == NotificationFilter.all) {
      return const Column(
        children: [
          ContainerVoucher(
              title: " Extra Voucher mu belum dipakai!",
              subDesc: "subDesc",
              desc:
                  "Promo voucher Diskon 40 RB dari minimum transaksi pembelian RP 800.000."),
          ContainerMaintenance(isReaded: true, isImage: false),
          ContainerMaintenance(isReaded: true, isImage: true),
          ContainerMaintenance(isReaded: false, isImage: true),
          ContainerMaintenance(isReaded: false, isImage: true),
        ],
      );
    } else if (filter == NotificationFilter.unread) {
      return const Column(
        children: [
          ContainerMaintenance(isReaded: false, isImage: true),
        ],
      );
    } else if (filter == NotificationFilter.transaction) {
      return const Column(
        children: [
          ContainerVoucher(
              title: " Transaksi Terkonfirmasi",
              subDesc: "Transaksi",
              desc: "Transaksi kamu sudah terkonfirmasi."),
        ],
      );
    } else if (filter == NotificationFilter.report) {
      return const Column(
        children: [
          ContainerMaintenance(isReaded: true, isImage: false),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
