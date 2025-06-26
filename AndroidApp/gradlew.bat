@echo off
set DIR=%~dp0
set CMD="%JAVA_HOME%\bin\java"
if not exist %CMD% set CMD=java
%CMD% -cp "%DIR%\gradle\wrapper\gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain %*
