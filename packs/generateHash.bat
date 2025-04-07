@echo off
echo Generating Hashes
CertUtil -hashfile lobbypack.zip SHA1 > lobbypack.sha1
echo Completed
pause