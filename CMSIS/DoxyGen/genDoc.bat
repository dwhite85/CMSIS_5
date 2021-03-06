@echo off

REM ====================================================================================
REM Batch file for generating
REM
REM Author  : 
REM Date    :  17th February 2016
REM Version : 1.0
REM Company : ARM 
REM
REM 
REM Command syntax: genDoc.bat
REM
REM  Version: 1.0 Initial Version.
REM ====================================================================================

SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

REM -- Delete previous generated HTML files ---------------------
  ECHO.
  ECHO Delete previous generated HTML files

IF EXIST ..\Documentation\Core\html (
  rmdir /S /Q ..\Documentation\Core\html
)
IF EXIST ..\Documentation\Driver\html (
  rmdir /S /Q ..\Documentation\Driver\html
)
IF EXIST ..\Documentation\General\html (
  rmdir /S /Q ..\Documentation\General\html
)
IF EXIST ..\Documentation\Pack\html (
  rmdir /S /Q ..\Documentation\Pack\html
)
IF EXIST ..\Documentation\SVD\html (
  rmdir /S /Q ..\Documentation\SVD\html
)
IF EXIST ..\Documentation\DSP\html (
  rmdir /S /Q ..\Documentation\DSP\html
)
IF EXIST ..\Documentation\DAP\html (
  rmdir /S /Q ..\Documentation\DAP\html
)

REM -- Generate New HTML Files ---------------------
  ECHO.
  ECHO Generate New HTML Files

pushd Core
CALL doxygen_core.bat
popd

pushd Driver
CALL doxygen_driver.bat
popd

pushd General
CALL doxygen_general.bat
popd

pushd Pack
CALL doxygen_pack.bat
popd

pushd SVD
CALL doxygen_svd.bat
popd

pushd DSP
CALL doxygen_dsp.bat
popd

pushd DAP
CALL doxygen_dap.bat
popd

REM -- Copy search style sheet ---------------------
ECHO Copy search style sheets
copy /Y Doxygen_Templates\search.css ..\Documentation\CORE\html\search\. 
copy /Y Doxygen_Templates\search.css ..\Documentation\Driver\html\search\.
REM copy /Y Doxygen_Templates\search.css ..\Documentation\General\html\search\. 
copy /Y Doxygen_Templates\search.css ..\Documentation\Pack\html\search\.
REM copy /Y Doxygen_Templates\search.css ..\Documentation\SVD\html\search\.
copy /Y Doxygen_Templates\search.css ..\Documentation\DSP\html\search\.
copy /Y Doxygen_Templates\search.css ..\Documentation\DAP\html\search\.
  
:END
  ECHO.
REM done
