# Task

0311 과제

이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수
정수를 하나 입력받아 2의 배수 여부를 반환하는 함수
정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)
4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수
점수(문자 또는 숫자)를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
점수(문자 또는 숫자)를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)

0312 과제

두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수 (1과 5 입력 시 15, 29와 30 입력 시 2930, 6과 100 입력 시 6100)
문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
자연수를 입력받아 그 수의 약수를 모두 출력하는 함수
2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수
자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수 참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열 (입력된 숫자가 4면 0, 1, 1, 2, 3, 5 ... 에서 4번째 위치인 2 출력. )
100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수

0314 과제

자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수 ex) 123 -> 321 , 10293 -> 39201

주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수 ex) ["a", "b", "c", "a", "e", "d", "c"] -> ["b", "e" ,"d"]

임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수 ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]

2개의 자연수와 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic 을 입력 파라미터로 받아 해당 연산의 결과를 반환하는 함수 구현 enum Arithmetic { case addition, subtraction, multiplication, division } func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int { // 코드 }

별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고

해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기

0315 과제

객체 지향 프로그래밍 (Object-Oriented Programming) 에 대해 예습하기

지난 과제에서 함수를 이용해 풀었던 문제를 클로저로 변형해서 풀어보기

클로저 Full Syntax <-> Optimized Syntax 변환 연습

// 위 1 ~ 3번은 자율 학습, 4 ~ 5번은 일요일 밤까지 제출 // 제출 : 일요일 밤까지 과제 제출용 폴더에 Playground 파일 업로드 // 정답 풀이는 월요일 전달

아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기
let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in let isAscending: Bool if s1 > s2 { isAscending = true } else { isAscending = false } return isAscending }

let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in var count: Int = 0 for _ in values { count += 1 } return count }

옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수
func combineString(str1: String?, str2: String?, str3: String?) -> String { // code }

// 입력 예시 및 결과 // combineString1(str1: "AB", str2: "CD", str3: "EF") -> "ABCDEF" // combineString1(str1: "AB", str2: nil, str3: "EF") -> "ABEF"


0319 과제

다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기. 구현 내용은 자유롭게
** 강아지 (Dog)

속성: 이름, 나이, 몸무게, 견종
행위: 짖기, 먹기
** 학생 (Student)

속성: 이름, 나이, 학교명, 학년
행위: 공부하기, 먹기, 잠자기
** 아이폰(IPhone)

속성: 기기명, 가격, faceID 기능 여부(Bool)
행위: 전화 걸기, 문자 전송
** 커피(Coffee)

속성: 이름, 가격, 원두 원산지
계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
** 계산기 (Calculator)

속성: 현재 값
행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
ex) let calculator = Calculator() // 객체생성

calculator.value // 0

calculator.add(10) // 10 calculator.add(5) // 15

calculator.subtract(9) // 6 calculator.subtract(10) // -4

calculator.multiply(4) // -16 calculator.multiply(-10) // 160

calculator.divide(10) // 16 calculator.reset() // 0


0321 과제

첨부된 이미지를 보고 상속을 이용해 구현해보기
첨부된 각 도형의 이미지를 참고하여 각 도형별 클래스를 만들고 각각의 넓이, 둘레, 부피를 구하는 프로퍼티와 메서드 구현하기 (클래스 구현 연습)

0322 과제

[Project]

UISwitch : On, Off 가 바뀔 때마다 Label 의 내용이 On, Off 로 표시되도록 구현
UISegmentedControl : 선택 내용이 바뀔 때마다 Label 의 내용도 해당 타이틀 값으로 함께 변경되도록 구현 참고로, 위 2개는 버튼과 달리 event 처리를 touchUpInside 가 아니라 valueChanged 라는 것을 활용해야 합니다.
[Playground]

정수 하나를 입력받은 뒤, 해당 숫자와 숫자 1사이에 있는 모든 정수의 합계 구하기 e.g. 5 -> 1 + 2 + 3 + 4 + 5 = 15, -2 -> -2 + -1 + 0 + 1 = -2

입력받은 숫자의 모든 자리 숫자 합계를 출력하기
e.g. 123 -> 6 , 5678 -> 26

숫자를 입력받아 1부터 해당 숫자까지 출력하되, 3, 6, 9가 하나라도 포함되어 있는 숫자는 *로 표시 e.g. 1, 2, *, 4, 5, *, 7, 8, *, 10, 11, 12, *, 14, 15, * ...

하샤드 수 구하기

하샤드 수 : 자연수 N의 각 자릿수 숫자의 합을 구한 뒤, 그 합한 숫자로 자기 자신이 나누어 떨어지는 수 e.g. 18의 자릿수 합은 1 + 8 = 9 이고, 18은 9로 나누어 떨어지므로 하샤드 수.
2개의 정수를 입력했을 때 그에 대한 최소공배수와 최대공약수 구하기 e.g. Input : 6, 9 -> Output : 18, 3

// 최대공약수 // 1) 두 수 중 큰 수를 작은 수로 나눈 나머지가 0이면 최대 공약수 // 2) 나머지가 0이 아니면, 큰 수에 작은 수를 넣고 작은 수에 나머지 값을 넣은 뒤 1) 반복

// 최소 공배수 // - 주어진 두 수의 곱을 최대공약수로 나누면 최소공배수


0325 과제

[ 과제1 ]

수업 실습 항목 3번 (3개의 빨강, 파랑, 초록색뷰 추가하기) 을 코드로 구현하기

[ 과제2 ]

AlertController 를 통해 Label 의 숫자를 1씩 올리거나 초기화하기 (위 내용을 스토리보드로 구현하기는 연습. 스토리보드 없이 완전히 코드로만으로 구현하는 것이 과제)

AlertController 에 TextField 를 추가해서 Label 의 숫자를 원하는 대로 증가시키기


0326 과제

영상 참고 텍스트 필드에 어떤 값을 입력하면 별도의 Label 에 입력된 텍스트 표시. 텍스트 필드가 활성화 되어 있을 땐 Label 의 텍스트 색상이 파란색이고, Font 크기는 40 텍스트 필드가 비활성화되면 Label 텍스트 색상이 빨간색이고, Font 크기는 20

ViewController 데이터 전달 AViewController 와 BViewController 를 만들고 각각 하나의 Label 생성. AViewController 와 BViewController 를 전환할 때마다 각 Label 에 화면을 전환한 숫자 1씩 증가
