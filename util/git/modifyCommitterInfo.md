# 커밋한 사람의 이름, 이메일 변경하기(modify Committer Info)

---

## 📅 What's this?

이미 커밋된 경우에도 커미터의 이름, 이메일을 변경할 수 있는 방법 소개

### 현재 깃 레포지토리의 committer 정보 확인  
- 해당 레포지토리만 적용되는 정보
> $ git config user.name
> 
> $ git config user.email
>
### 현재 깃 레포지토리의 committer 정보 변경  
- 해당 레포지토리만 적용되는 정보  
- puppy, new@email.com으로 변경할 때
> $ git config user.name "puppy"
> 
> $ git config user.email "new@email.com"
>
### 현재 기본 committer 정보 확인(레포지토리 정보가 없을 때 기본값)
> $ git config --global user.name
> 
> $ git config --global user.email
>
### 파이썬 설치 확인
> $ where python
>
### 위 명령어 입력 시 만약 아래와 같은 응답이 온다면 이건 "가짜 파이썬"  
- 이 경로는 Microsoft Store에서 제공하는 "가짜" python.exe임!  
- 이건 단순히 "Python을 아직 설치하지 않은 사람을 위해 Store로 연결만 시켜주는 실행기"일 뿐, 실제 Python 해석기나 pip 모듈은 아예 포함되어 있지 않음
> $ C:\Users\user\AppData\Local\Microsoft\WindowsApps\python.exe
>

---
### 파이썬이 설치되지 않았을 경우에만 실행  

#### 파이썬 설치  
- 아래 경로에서 Windows installer (64-bit) 다운로드
> https://www.python.org/downloads/release/python-31210/
>
#### 파이썬 설치 확인 후 아직 동일하게 나온다면 환경변수 등록
> $ where python
>
#### 파이썬 환경변수 등록  
- Win 키 → "환경 변수" 검색 → "시스템 환경 변수 편집" 클릭 → 하단의 [환경 변수(N)...] 버튼 클릭 → 사용자 변수 또는 시스템 변수에서 Path 더블클릭 → [새로 만들기] 클릭해서 아래 2개 경로를 추가
>
> 1) C:\Users\user\AppData\Local\Programs\Python\Python312\
> 2) C:\Users\user\AppData\Local\Programs\Python\Python312\Scripts\
>
#### 파이썬 설치 확인
> $ where python
>
#### git-filter-repo 설치
> $ pip install git-filter-repo
>
#### 설치 확인
> $ git filter-repo --version

---

### 현재 커밋 내역을 시간 역순으로 표출하여 바꿀 name, email 확인
> $ git log --pretty=format:"%h %an <%ae>" --reverse
>
### 가독성 향상을 위해 줄바꿈을 했으나 실제로 명령어 적용 시에는 줄바꿈을 없애야 함  
- 명령어: author 이름 puppy, 이메일 origin@email.com 으로 커밋된 것을 bini, new@email.com로 변경해라
> $ git filter-repo --force --commit-callback
> 
>  "if commit.author_name == b'puppy' and commit.author_email == b'origin@email.com'
> 
>  : commit.author_name = b'bini'; commit.author_email = b'new@email.com'; commit.committer_name = b'bini'; commit.committer_email = b'new@email.com'"
>
### 현재 커밋 내역을 시간 역순으로 표출하여 name, email 변경되었는지 확인
> $ git log --pretty=format:"%h %an <%ae>" --reverse
>
### 원격 저장소를 연결  
- https로 클론할 때 가지고 오는 url 주소를 넣으면 됨
> $ git remote add origin https://github.com/보통은계정/보통은레포지토리이름
>
### 원격 저장소로 강제 푸시
> $ git push origin main --force
> 
> $ git push origin --tags --force