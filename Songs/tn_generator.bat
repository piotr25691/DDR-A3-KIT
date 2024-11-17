@echo off
echo.
echo.
echo.
echo.
echo    Make sure you have Image Magick installed to make this work.
echo    Press any key to begin or close this window to exit.
echo.
echo.
echo.
echo.
pause
rem setlocal enabledelayedexpansion
cls
for /D %%G in (*.*) do (
	cd %%~nxG
	for /D %%H in (*.*) do (
		cd %%~nxH
		if exist "*jacket.*" (
			if not exist "%%~nxH-tn.png" (
				for /F "delims=" %%i in ('dir /b *jacket.*') do (
					magick "%%i" -resize 150x150 "%%~nxH-tn.png"
					echo    created : %%~nxG / %%~nxH-tn.png
				)
			)
		) else echo    can't create, jacket missing: %%~nxG / %%~nxH
		cd..
	)
	cd..
)
echo.
echo.
echo.
echo.
echo    Supply missing jackets to create thumbnail files.
echo    Press any key to exit.
echo.
echo.
echo.
echo.
echo.
pause