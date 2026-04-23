import 'package:equatable/equatable.dart';

class SubjectEntity extends Equatable{
  final String name;
  final String icon;
  final String id;

 const SubjectEntity({required this.id, required this.name, required this.icon});

  @override
  List<Object?> get props => [id, name, icon];
}