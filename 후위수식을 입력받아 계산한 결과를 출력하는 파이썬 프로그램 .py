# 스택을 저장할 빈 리스트 생성
a_stack = []

# 스택에 값을 추가하는 함수
def push(push_data):
    a_stack.append(int(push_data))  # 데이터가 숫자일 때만 정수로 변환하여 추가
    print(f'삽입과정: {a_stack}')

# 스택에서 값을 꺼내는 함수
def pop():
    a = a_stack[-1]
    print(f"계산을 위해 스택에서 빼야하는 값: {a}")
    a_stack.remove(a_stack[-1])
    return a

# 사용자 입력 받기
a = list(input("계산식을 후위표기법으로 입력하세요.\n연산자와 피연사자는 \",\"로 분리해서 입력하세요.\n").split(','))

for i in a:
    if i == '+' or i == '-' or i == '*' or i == '/':  # 연산자 체크
        pop_data1 = pop()  # 첫 번째 피연산자
        pop_data2 = pop()  # 두 번째 피연산자

        if i == '+':  # 덧셈
            push(pop_data2 + pop_data1)
        elif i == '-':  # 뺄셈
            push(pop_data2 - pop_data1)
        elif i == '*':  # 곱셈
            push(pop_data2 * pop_data1)
        elif i == '/':  # 나눗셈
            push(pop_data2 / pop_data1)

    else:
        push(int(i))  # 숫자일 경우 스택에 삽입하고, 이때 숫자로 변환해서 넣어야 합니다.

# 최종 결과 출력
print(f"최종 계산 결과: {a_stack[0]}")

