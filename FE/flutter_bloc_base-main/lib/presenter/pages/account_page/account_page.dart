import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_bloc.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_event.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_state.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_starter/presenter/languages/translation_keys.g.dart';
part 'menu_item.dart';

// TODO: Add the page to the router
@RoutePage()
class AccountPagePage extends StatefulWidget implements AutoRouteWrapper {
  const AccountPagePage();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<AccountPageBloc>.value(
      value: provider.get<AccountPageBloc>(),
      child: this,
    );
  }

  @override
  State<AccountPagePage> createState() => _AccountPagePageState();
}

class _AccountPagePageState extends State<AccountPagePage> {
  AccountPageBloc get _bloc => context.read<AccountPageBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(AccountPageEvent.getInformation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.gradientPurple,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Colors.white, Colors.white.withOpacity(0.9)],
          ).createShader(bounds),
          child: Text(
            LocaleKeys.MyProfile.tr(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: BlocBuilder<AccountPageBloc, AccountPageState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  AppColors.primaryPurpleLight.withOpacity(0.05),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Profile Avatar
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: AppColors.gradientPurple,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryPurple.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(4),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: (state.information?.avatarUrl != null &&
                              (state.information!.avatarUrl!.isNotEmpty))
                          ? NetworkImage(state.information!.avatarUrl!)
                          : null,
                      child: (state.information?.avatarUrl == null ||
                              (state.information!.avatarUrl!.isEmpty))
                          ? const Icon(
                              Icons.person,
                              size: 50,
                              color: AppColors.primaryPurple,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Name
                  Text(
                    ((state.information?.firstName ?? '').isEmpty &&
                            (state.information?.lastName ?? '').isEmpty)
                        ? 'Nguyen Van A'
                        : '${state.information?.firstName ?? ''} ${state.information?.lastName ?? ''}'
                            .trim(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.information?.email ?? 'giapt2k29@cht.edu.vn',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: _openEditProfile,
                    icon: const Icon(Icons.edit),
                    label: Text(LocaleKeys.EditProfile.tr()),
                  ),
                  const SizedBox(height: 24),
                  // Info Cards
                  _buildInfoCard(
                    context,
                    icon: Icons.person_outline,
                    iconColor: AppColors.primaryPurple,
                    title: LocaleKeys.FullName.tr(),
                    value: ((state.information?.firstName ?? '').isEmpty &&
                            (state.information?.lastName ?? '').isEmpty)
                        ? 'Nguyen Van A'
                        : '${state.information?.firstName ?? ''} ${state.information?.lastName ?? ''}'
                            .trim(),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    context,
                    icon: Icons.email_outlined,
                    iconColor: AppColors.secondaryTeal,
                    title: LocaleKeys.Email.tr(),
                    value: state.information?.email ?? 'giapt2k29@cht.edu.vn',
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    context,
                    icon: Icons.phone_outlined,
                    iconColor: Colors.green,
                    title: LocaleKeys.PhoneNumber.tr(),
                    value: (state.information?.phone ?? '').isNotEmpty
                        ? state.information!.phone!
                        : '-',
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    context,
                    icon: Icons.cake_outlined,
                    iconColor: Colors.orange,
                    title: LocaleKeys.Birthday.tr(),
                    value: state.information?.dob != null
                        ? '${state.information!.dob!.day.toString().padLeft(2, '0')}/${state.information!.dob!.month.toString().padLeft(2, '0')}/${state.information!.dob!.year}'
                        : '-',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _openEditProfile() async {
    final bloc = _bloc;
    final current = context.read<AccountPageBloc>().state.information;
    String firstName = current?.firstName ?? '';
    String lastName = current?.lastName ?? '';
    DateTime? dob = current?.dob;
    String phone = current?.phone ?? '';
    String? avatarPath;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: StatefulBuilder(builder: (ctx, setModal) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(LocaleKeys.Edit.tr()),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(ctx),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(labelText: LocaleKeys.LastName.tr()),
                        controller: TextEditingController(text: lastName),
                        onChanged: (v) => lastName = v,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(labelText: LocaleKeys.FirstName.tr()),
                        controller: TextEditingController(text: firstName),
                        onChanged: (v) => firstName = v,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TextField(
                  decoration: InputDecoration(labelText: LocaleKeys.PhoneNumber.tr()),
                  controller: TextEditingController(text: phone),
                  keyboardType: TextInputType.phone,
                  onChanged: (v) => phone = v,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final picked = await showDatePicker(
                            context: ctx,
                            initialDate: dob ?? DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (picked != null) {
                            setModal(() => dob = picked);
                          }
                        },
                        child: InputDecorator(
                          decoration: InputDecoration(labelText: LocaleKeys.DateOfBirth.tr()),
                          child: Text(dob != null
                              ? '${dob!.year}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}'
                              : LocaleKeys.ChooseDate.tr()),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton.icon(
                      onPressed: () async {
                        final picker = ImagePicker();
                        final picked =
                            await picker.pickImage(source: ImageSource.gallery, imageQuality: 85);
                        if (picked != null) {
                          setModal(() => avatarPath = picked.path);
                        }
                      },
                      icon: const Icon(Icons.image),
                      label: Text(avatarPath == null
                          ? LocaleKeys.ChooseImage.tr()
                          : LocaleKeys.ImageSelected.tr()),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                      bloc.add(AccountPageEvent.updateProfile(
                        firstName: firstName.isEmpty ? null : firstName,
                        lastName: lastName.isEmpty ? null : lastName,
                        dob: dob,
                        phone: phone.isEmpty ? null : phone,
                        avatarFilePath: avatarPath,
                      ));
                    },
                    child: Text(LocaleKeys.Save.tr()),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            );
          }),
        );
      },
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: iconColor.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }
}
