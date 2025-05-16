class PhoneBook:
        class Node:
                def __init__(self, data):
                        self.data = data
                        self.next = None
		
        def __init__(self):
                self.head = None


        def insertNode(self, add_data):                    
                if self.head == None:  # 빈 연결리스트
                        self.head= self.Node(add_data)
                        print("신규입력 완료\n")
                        return
    
                current = self.head
                prev= None
                while current :    #노드가 있을때까지
                        if current.data[0] == add_data[0]: # 이미 있는 이름이라면
                                print("이미 있는 이름입니다\n")
                                return
                        elif current.data[0] > add_data[0] :
                                break
                        prev = current
                        current = current.next
                        
                new_node = self.Node(add_data) # 새노드 생성
                
                if not prev : # 가장 작은 이름임
                        new_node.next = self.head
                        self.head = new_node

                else : #prev 와 next사이에 신규 노드 삽입하면 됨
                        prev.next = new_node
                        new_node.next = current
                print("신규입력 완료\n")
                
        def changeNode(self, change_name):
                current = self.head
                while current :
                        if current.data[0] == change_name:
                                print("\n{}전화번호는 {}입니다.".format(current.data[0], current.data[1]))
                                current.data[1] = input("변경할 전화번호:")
                                print("\n{}의 전화번호가 {}으로 수정되었습니다.".format(current.data[0], current.data[1]))
                                return
                        current=current.next
                print("없는 이름입니다\n")
                
                      
    
        def printNodes(self): 
                current = self.head # 현재 노드를 head로 설정
                if current == None:  # 빈 리스트이면
                        return 
                while current != None: #리스트 끝까지 반복
                        print(current.data, end = ' ')
                        current = current.next # 다음 노드로 이동
               
                return
                

         
        def deleteNode(self, delete_name):
                if self.head == None:
                        print("연결리스트가 비어 있습니다\n")
                        return
                current = self.head # 현재에 헤드의 주소값 저장
                prev = None
  	  
                while current :
                        if current.data[0] == delete_name :
                                if not prev:  # 첫번째 자료임
                                        self.head = current.next # 헤드에 다음 노도의 주소값을 저장
                                else :
                                        prev.next = current.next        # 이전 노드에 다음 노드이 주소값을 저장
                                del current  # 해당 노드를 메모리에서 free시킴
                                print("연락처가 삭제되었습니다\n")
                                return
                        prev = current  # 다음 노드로 이동
                        current = current.next # 다음 노드주소값을 current에 넣음
                
                print("없는 이름 입니다\n")


                

        def findNode(self,find_name):
                if self.head == None:
                        print("빈 리스트입니다")
                        return None
                current = self.head     #현재에 헤드의 주소값 저장

                while current :
                        if current.data[0] == find_name: #찾는 이름을 current가 가지고 있다면
                                print('\n{}님의 전화번호는 {} 입니다.' .format(current.data[0], current.data[1]))
                                return current
                        current = current.next # current가 다음 노드의 주소를 가짐.
                print("없는 이름입니다\n")
                return None

	    
if __name__=="__main__":

    print('단순연결리스트를 이용한 전화번호부 관리 프로그램입니다.\n')
    
    P = PhoneBook()  # 단순연결리스트 생성

    while True:
        print('\n1: 입력\t 2:수정\t 3:삭제\t 4:탐색\t 0:종료\n')
        
        ch = input("기능 선택--> ")
            
        if ch == '0':
            P.printNodes()
            print('종료합니다\n')
            break

        elif ch == '1':
            add_data =[]
            add_data.append(input('입력할 이름: '))         
            add_data.append(input('입력할 전화번호: '))
            P.insertNode(add_data) 
            P.printNodes()
            
        elif ch == '2':
            change_name = (input('전화번호를 수정할 이름:'))
            P.changeNode(change_name)  
            P.printNodes()

        elif ch == '3':
            delete_name = input('삭제할 이름: ')
            P.deleteNode(delete_name)                            
            P.printNodes()
            
        elif ch == '4':
            search_name = input('탐색할 이름 : ')
            P.findNode(search_name)
        else:       
            print('\n잘못된 입력입니다.\n')

    
