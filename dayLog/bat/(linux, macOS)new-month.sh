#!/bin/bash

# 현재 날짜 정보 추출 (형식: YYYY MM DD)
YYYY=$(date +%Y)
MM=$(date +%m)

# 날짜 문자열
YM="${YYYY}${MM}"
DIR="${PWD}/${YYYY}"
FILE="${DIR}/${YM}.md"

# 디렉토리 생성
echo "디렉토리 생성 경로: ${DIR}"  # 경로 출력
if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
    echo "디렉토리 생성됨: ${DIR}"
else
    echo "디렉토리 이미 존재: ${DIR}"
fi

# 마지막 날 구하기 (기본 30일, 필요시 수정 가능)
LAST_DAY=30

# 파일이 존재하는지 확인하고 내용 갱신
echo "파일 경로: ${FILE}"  # 파일 경로 출력
if [ -f "$FILE" ]; then
    echo "[⚠️] ${FILE} 이미 존재합니다. 내용 업데이트 중..."
else
    echo "# 📅 ${YYYY}년 ${MM}월" > "$FILE"
    echo "" >> "$FILE"
    echo "---" >> "$FILE"
    echo "헤더 추가 완료!"
fi

# 각 날짜별 템플릿 추가
for ((i=1; i<=LAST_DAY; i++)); do
    DAY=$(printf "%02d" $i)

    # 요일 구하기
    WEEKDAY=$(date -d "${YYYY}-${MM}-${DAY}" '+%a')

    # 날짜별 템플릿 추가
	echo "" >> "$FILE"
    echo "## ${YYYY}-${MM}-${DAY}(${WEEKDAY})" >> "$FILE"
    echo "" >> "$FILE"
    echo "- 🌤 Weather: " >> "$FILE"
    echo "- 😊 Mood: " >> "$FILE"
    echo "- ✅ To-Do" >> "$FILE"
    echo "  - [ ✔ ] Task 1: " >> "$FILE"
	echo "  - [ ⏳ ] Task 2: " >> "$FILE"
    echo "  - [ ✖ ] Task 3: " >> "$FILE"
	echo "^<hr style='border-top: 1px dashed #333;'^>" >> "$FILE"
	echo "- 💡 Is there something NEW?  " >> "$FILE"
	echo "" >> "$FILE"
    echo "^> *WoWthing*" >> "$FILE"
    echo "" >> "$FILE"
    echo "- 📝 How was your day?  " >> "$FILE"
    echo "^> Waiting for write" >> "$FILE"
    echo "" >> "$FILE"
    echo "---" >> "$FILE"
done

echo "[✅] ${FILE} 생성 완료!"
