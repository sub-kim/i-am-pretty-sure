:: delete Registry BEYOND COMPARE 4 CacheID
:: ������Ʈ�� �����⿡�� BEYOND COMPARE 4 CacheID ���� �����Ͽ� ü���� �Ⱓ�� �ʱ�ȭ

@echo off
setlocal

REM ������Ʈ�� �� ���� ���� Ȯ��
REG QUERY "HKCU\Software\Scooter Software\Beyond Compare 4" /v cacheId >nul 2>&1

IF %ERRORLEVEL% EQU 0 (
    REM ���� ������ �� ����
    REG DELETE "HKCU\Software\Scooter Software\Beyond Compare 4" /v cacheId /f >nul
    echo Beyond Compare 4 cacheId �׸��� �����Ǿ����ϴ�.
) ELSE (
    echo cacheId �׸��� �������� �ʽ��ϴ�. ������ �׸��� �����ϴ�.
)

pause
endlocal