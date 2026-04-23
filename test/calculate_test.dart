import 'package:exam_app/calculate.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('add to numbers positive',(){
  // Arrange
    final calculate =Calculate();
    int num1 =2;
    int num2 =5;
    //Act
    int result= calculate.add(num1, num2);
    //Assert
    expect(result, 7);
    expect(result, isPositive);
    expect(result, isNotNaN);
  });
}