:: delete Registry BEYOND COMPARE 4 CacheID
:: 레지스트리 편집기에서 BEYOND COMPARE 4 CacheID 값을 삭제하여 체험판 기간을 초기화

@echo off
setlocal

REM 레지스트리 값 존재 여부 확인
REG QUERY "HKCU\Software\Scooter Software\Beyond Compare 4" /v cacheId >nul 2>&1

IF %ERRORLEVEL% EQU 0 (
    REM 값이 존재할 때 삭제
    REG DELETE "HKCU\Software\Scooter Software\Beyond Compare 4" /v cacheId /f >nul
    echo Beyond Compare 4 cacheId 항목이 삭제되었습니다.
) ELSE (
    echo cacheId 항목이 존재하지 않습니다. 삭제할 항목이 없습니다.
)

pause
endlocal