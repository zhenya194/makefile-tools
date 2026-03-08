## Delete not essential files of Python and several Python libraries
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