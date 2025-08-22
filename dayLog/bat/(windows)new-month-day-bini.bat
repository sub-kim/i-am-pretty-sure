:: 연도/월 디렉토리 내 일(요일).md의 파일 형태로 만들어 줌

@echo off
chcp 65001 > nul
setlocal ENABLEDELAYEDEXPANSION

:: 날짜 구성 (PowerShell로 정확 추출)
for /f %%a in ('powershell -Command "(Get-Date).Year"') do set "YYYY=%%a"
for /f %%a in ('powershell -Command "(Get-Date).Month.ToString('00')"') do set "MM=%%a"
for /f %%a in ('powershell -Command "(Get-Date).Day.ToString('00')"') do set "DD=%%a"
for /f %%a in ('powershell -Command "[System.Globalization.CultureInfo]::InvariantCulture.DateTimeFormat.GetAbbreviatedDayName((Get-Date).DayOfWeek)"') do set "WEEKDAY=%%a"

:: 경로 및 파일명 구성
set "DIR=%~dp0..\!YYYY!\!MM!"
set "FILE_NAME=!DD!(!WEEKDAY!)-bini.md"
set "FILE=!DIR!\!FILE_NAME!"

:: 디렉토리 생성
echo 디렉토리 경로: !DIR!
if not exist "!DIR!" (
    mkdir "!DIR!"
    echo 디렉토리 생성됨: "!DIR!"
) else (
    echo 디렉토리 이미 존재: "!DIR!"
)

:: 파일 생성 여부 체크
echo 파일 경로: !FILE!
if exist "!FILE!" (
    echo [⚠️] !FILE! 이미 존재합니다. 내용 업데이트 중...
) else (
    (
        echo ## !YYYY!-!MM!-!DD!(^!WEEKDAY!^)
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
    ) > "!FILE!"
    echo [✅] 오늘 날짜 파일 생성 완료: !FILE!
)

pause
