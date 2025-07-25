@echo off
chcp 65001 > nul
setlocal ENABLEDELAYEDEXPANSION

:: 오늘 날짜 정보 추출 (형식: YYYY MM DD)
for /f "tokens=1-3 delims=/- " %%a in ("%date%") do (
    set "YYYY=%%a"
    set "MM=%%b"
)

:: 두 자리 월 유지
if 1!MM! LSS 110 set MM=0!MM!
set MM=!MM:~-2!

:: 날짜 문자열
set "YM=!YYYY!!MM!"
set "DIR=%~dp0!YYYY!"
set "FILE=!DIR!\!YM!.md"

:: 디렉토리 생성
echo 디렉토리 생성 경로: !DIR!  :: 경로 출력
if not exist "!DIR!" (
    mkdir "!DIR!"
    echo 디렉토리 생성됨: "!DIR!"
) else (
    echo 디렉토리 이미 존재: "!DIR!"
)

:: 마지막 날 구하기 (기본 30일)
set LAST_DAY=30  :: 기본적으로 30일로 설정, 필요시 수정 가능

:: 파일이 존재하는지 확인하고 내용 갱신
echo 파일 경로: !FILE!  :: 파일 경로 출력
if exist "!FILE!" (
    echo [⚠️] !FILE! 이미 존재합니다. 내용 업데이트 중...
) else (
    echo # 📅 !YYYY!년 !MM!월 > "!FILE!"
    echo. >> "!FILE!"
    echo --- >> "!FILE!"
    echo 헤더 추가 완료!
)

:: 날짜별 템플릿 생성
for /l %%i in (1,1,!LAST_DAY!) do (
    set "DAY=0%%i"
    set "DAY=!DAY:~-2!"

    :: 요일 계산: PowerShell 사용
    for /f %%w in ('powershell -Command "(Get-Date -Year !YYYY! -Month !MM! -Day %%i).ToString('ddd')"') do (
        set "WEEKDAY=%%w"
    )

    (
        echo.
        echo ## !YYYY!-!MM!-!DAY!(^!WEEKDAY!^)
        echo.
        echo - 🌤 Weather: 
        echo - 😊 Mood: 
        echo - ✅ To-Do
        echo   - [ ✔ ] Task 1: 
        echo   - [ ⏳ ] Task 2: 
        echo   - [ ✖ ] Task 3: 
        echo ^<hr style="border-top: 1px dashed #333;"^>
        echo - 💡 Is there something NEW?   
        echo.
        echo ^> *WoWthing*
        echo.
        echo - 📝 How was your day?   
        echo ^> Waiting for write
        echo.
        echo ---
    ) >> "!FILE!"
)

echo [✅] !FILE! 생성 완료!
pause
