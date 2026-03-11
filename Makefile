## Python and libraries
clean_python_unix:
	find . -name "**/*.pyc" -delete 
	find . -name "__pycache__" -type d -exec rm -rf {} +
	find . -type d -name ".ipynb_checkpoints" -exec rm -r {} +
	rm -f .coverage coverage.xml
	rm -rf htmlcov/ .mypy_cache .pytest_cache .ruff_cache
	rm -rf *.egg-info
clean_python_win_ps:
	powershell -Command "Get-ChildItem -Recurse -Directory -Filter '__pycache__' | Remove-Item -Recurse -Force"
	powershell -Command "Get-ChildItem -Recurse -Filter '*.pyc' | Remove-Item -Force"
	powershell -Command "Remove-Item .pytest_cache -Recurse -Force -ErrorAction SilentlyContinue"
	powershell -Command "Remove-Item *.egg-info -Recurse -Force -ErrorAction SilentlyContinue"
clean_python_win_cmd:
	-for /d /r %%i in (__pycache__) do rd /s /q "%%i"
	-del /s /q *.pyc
	-rd /s /q .pytest_cache

## JS and Node.js
clean_js_unix:
	rm -rf .eslintcache .next .turbo .parcel-cache
clean_js_win_ps:
	powershell -Command "Remove-Item -Recurse -Force .eslintcache, .next, .turbo, .parcel-cache"
clean_js_win_cmd:
	rd /s /q .eslintcache .next .turbo .parcel-cache

## C++
clean_cpp_unix:
	find . -type f \( -name "*.obj" -o -name "*.o" -o -name "*.lib" -o -name "*.a" -o -name "*.idb" -o -name "*.tlog" \) -delete
clean_cpp_win_cmd:
	del /s /q *.obj *.o *.lib *.a *.idb *.tlog
clean_cpp_win_ps:
	powershell -Command "Get-ChildItem -Recurse -Include *.obj, *.o, *.lib, *.a, *.idb, *.tlog | Remove-Item -Force"

## OS
clean_os_unix:
	find . -type f \( -name "*.DS_Store" -o -name "Thumbs.db" \) -delete
clean_os_win_ps:
	powershell -Command "Get-ChildItem -Recurse -Include *.DS_Store, Thumbs.db | Remove-Item -Force"
clean_os_win_cmd:
	del /s /q *.DS_Store Thumbs.db
